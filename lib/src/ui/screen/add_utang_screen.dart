import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../providers/global_provider.dart';
import '../../network/models/models.dart';
import '../../function/show_local_notification.dart';

import '../widgets/add_utang_screen/steps_information.dart';
import '../widgets/add_utang_screen/steps_take_picture.dart';
import '../widgets/add_utang_screen/steps_signature.dart';

class AddUtangScreen extends StatefulWidget {
  final UserGoogleModel resultQRCode;
  AddUtangScreen(this.resultQRCode);
  static const routeNamed = '/add-utang-screen';

  @override
  _AddUtangScreenState createState() => _AddUtangScreenState();
}

class _AddUtangScreenState extends State<AddUtangScreen> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final LocalNotification localNotification = LocalNotification();

  File _pickedImage;
  Uint8List _byteSignature;
  DateTime _pickedDateTime;
  var error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPallete.primaryColor,
        title: Text('Form Permintaan Utang'),
      ),
      body: Consumer(
        (ctx, read) {
          final stepState = read(stepperStateNotifierProvider.state);
          final userState = read(userProvider.state);
          return Stepper(
            currentStep: stepState,
            onStepCancel: () => stepperStateNotifierProvider
                .read(context)
                .onStepCancel(onLastCancel: () => Navigator.of(context).pop()),
            onStepContinue: () => stepperStateNotifierProvider.read(context).onStepContinue(
                  showSteps(stepState).length,
                  onDone: () async => await validateForm(userState),
                ),
            onStepTapped: (step) => stepperStateNotifierProvider
                .read(context)
                .onStepTap(step, showSteps(stepState).length),
            steps: showSteps(stepState),
            type: StepperType.horizontal,
            physics: ClampingScrollPhysics(),
            controlsBuilder: (
              context, {
              onStepCancel,
              onStepContinue,
            }) {
              // return Text(error);
              return Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: onStepCancel,
                    borderSide: BorderSide(color: colorPallete.red),
                    textColor: colorPallete.red,
                    child: Text(stepState == 0 ? 'Batal' : 'Kembali'),
                  ),
                  const SizedBox(width: 10),
                  Consumer(
                    (ctx, read) {
                      final globalState = read(globalStateNotifierProvider.state);
                      if (globalState.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Row(
                          children: <Widget>[
                            RaisedButton(
                              color: colorPallete.primaryColor,
                              onPressed: onStepContinue,
                              textColor: colorPallete.white,
                              child: Text(
                                stepState + 1 == showSteps(stepState).length
                                    ? 'Konfirmasi'
                                    : 'Lanjut',
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<Step> showSteps(int currentIndex) {
    final steps = [
      Step(
        content: StepsInformation(
          nominalController: _nominalController,
          reasonController: _reasonController,
          onPickedDateTime: _selectDateTime,
          pickedDateTime: _pickedDateTime,
        ),
        title: Text(''),
        isActive: 1 > currentIndex + 1 ? false : true,
        state: 1 >= currentIndex + 1 ? StepState.indexed : StepState.complete,
      ),
      Step(
        content: StepsTakePicture(onPickedImage: _selectImage, pickedImage: _pickedImage),
        title: Text(''),
        isActive: 2 > currentIndex + 1 ? false : true,
        state: 2 >= currentIndex + 1 ? StepState.indexed : StepState.complete,
      ),
      Step(
        content:
            StepsSignature(onPickedSignature: _selectSignature, exportedSignature: _byteSignature),
        title: Text(''),
        isActive: 3 > currentIndex + 1 ? false : true,
        state: 3 >= currentIndex + 1 ? StepState.indexed : StepState.complete,
      ),
    ];
    return steps;
  }

  void _selectImage(File pickedImage) {
    setState(() => _pickedImage = pickedImage);
  }

  void _selectSignature(Uint8List byteSignature) {
    setState(() => _byteSignature = byteSignature);
  }

  void _selectDateTime(DateTime pickedDateTime) {
    setState(() => _pickedDateTime = pickedDateTime);
  }

  Future<void> validateForm(UserGoogleModel userState) async {
    if (_pickedImage == null ||
        _pickedDateTime == null ||
        _byteSignature == null ||
        _nominalController.text.isEmpty) {
      await GlobalFunction().showToast(message: 'Validasi belum lengkap', isError: true);
      return null;
    }
    try {
      final unFormatNumber = GlobalFunction().unFormatNumber(_nominalController.text);
      final formatDate = GlobalFunction().formatYearMonthDaySpecific(_pickedDateTime);
      final encodeUint8list = base64Encode(_byteSignature);
      globalStateNotifierProvider.read(context).toggleLoading(true);

      final result = await utangProvider.read(context).addUtang(
            pembertang: widget.resultQRCode.idUser,
            pengutang: userState.idUser,
            totalUtang: int.tryParse(unFormatNumber),
            tglKembali: _pickedDateTime,
            keterangan: _reasonController.text,
            ttd: encodeUint8list,
            selfieImage: _pickedImage,
          );

      await localNotification.showNotification(
        idNotification: 1,
        titleNotification: 'Permintaan Utang Berhasil',
        bodyNotification:
            'Tunggu pemberi utang mengkonfirmasi permintaanmu dengan detail Rp.${_nominalController.text} dan pengembalian pada $formatDate',
      );
      await GlobalFunction().showToast(message: result, isSuccess: true, isLongDuration: true);
      globalStateNotifierProvider.read(context).toggleLoading(false);
      Navigator.of(context).pop();
    } catch (e) {
      globalStateNotifierProvider.read(context).toggleLoading(false);
      await GlobalFunction().showToast(message: e.toString(), isError: true, isLongDuration: true);
    }
  }
}
