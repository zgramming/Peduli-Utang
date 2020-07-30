import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/models/models.dart';
import '../../providers/global_provider.dart';

class ModalBottomSheetCicil extends StatefulWidget {
  final UtangModel model;
  ModalBottomSheetCicil({
    this.model,
  });

  @override
  _ModalBottomSheetCicilState createState() => _ModalBottomSheetCicilState();
}

class _ModalBottomSheetCicilState extends State<ModalBottomSheetCicil> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _totalCicilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Cicil Utang ${widget.model.pengutang.nameUser} : ',
                style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: sizes.mediaQuery(context).viewInsets.bottom),
                child: TextFormFieldCustom(
                  onSaved: (value) => '',
                  controller: _totalCicilController,
                  labelText: 'Masukkan Nominal',
                  prefixIcon: Icon(Icons.add),
                  inputFormatter: [
                    InputNumberFormat(),
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 10),
              Consumer((ctx, read) {
                final globalState = read(globalStateNotifierProvider.state);
                if (globalState.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ButtonCustom(
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      try {
                        globalStateNotifierProvider.read(context).toggleLoading(true);
                        final unFormat =
                            GlobalFunction().unFormatNumber(_totalCicilController.text);
                        final result = await utangProvider.read(context).cicilUtang(
                              idUtang: widget.model.idUtang,
                              pembertang: widget.model.pembertang.idUser,
                              totalCicil: int.tryParse(unFormat),
                            );
                        globalStateNotifierProvider.read(context).toggleLoading(false);
                        await GlobalFunction().showToast(message: result, isSuccess: true);
                        Navigator.of(context).pop();
                      } catch (e) {
                        globalStateNotifierProvider.read(context).toggleLoading(false);
                        await GlobalFunction().showToast(message: e.toString(), isError: true);
                      }
                    }
                  },
                  buttonTitle: 'Cicil Utang',
                  textStyle: appTheme
                      .button(context)
                      .copyWith(fontWeight: FontWeight.bold, color: colorPallete.white),
                );
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
