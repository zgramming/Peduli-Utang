import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/global_provider.dart';
import '../../../function/common_function.dart';

import '../../screen/add_utang_screen.dart';

class ModalBottomSheetAddUtang extends StatefulWidget {
  @override
  _ModalBottomSheetAddUtangState createState() => _ModalBottomSheetAddUtangState();
}

class _ModalBottomSheetAddUtangState extends State<ModalBottomSheetAddUtang> {
  final TextEditingController emailController = TextEditingController();

  Future<void> searchByEmail() async {
    final globalProvider = globalStateNotifierProvider.read(context);
    final user = userProvider.read(context).initialState;
    if (user.emailUser == emailController.text) {
      await GlobalFunction().showToast(
          message: 'Tidak dapat ber-utang ke diri sendiri', isError: true, isLongDuration: true);
      return;
    }
    try {
      globalProvider.toggleLoading(true);
      final result =
          await userProvider.read(context).searchUserByIdOrEmail(emailuser: emailController.text);
      if (result != null) {
        globalProvider.toggleLoading(false);
        await Navigator.of(context).pushNamed(AddUtangScreen.routeNamed, arguments: result);
      }
    } catch (e) {
      globalProvider.toggleLoading(false);
      await GlobalFunction().showToast(message: e.toString(), isError: true, isLongDuration: true);
    }
  }

  Future<void> searchById() async {
    final user = userProvider.read(context).initialState;
    try {
      final resultQR = await CommonFunction().scanQRKU(context: context);
      if (resultQR == user.idUser) {
        await GlobalFunction().showToast(
            message: 'Tidak dapat ber-utang ke diri sendiri', isError: true, isLongDuration: true);
        return;
      }
      final result = await userProvider.read(context).searchUserByIdOrEmail(
            idOrEmail: 'id_user',
            idUser: resultQR,
          );
      if (result != null) {
        print('hasil dari cari email ${result.toString()}');
        await Navigator.of(context).pushNamed(AddUtangScreen.routeNamed, arguments: result);
      }
    } catch (e) {
      await GlobalFunction().showToast(message: e.toString(), isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Cari Pemberi utang via : ',
              style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(bottom: sizes.mediaQuery(context).viewInsets.bottom),
              child: TextFormFieldCustom(
                controller: emailController,
                onSaved: (value) => '',
                hintText: 'contoh john.doe@gmail.com',
                labelText: 'Email Pemberi',
                prefixIcon: Icon(Icons.search),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 10),
            Consumer((ctx, read) {
              final globalProvider = read(globalStateNotifierProvider.state);
              if (globalProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ButtonCustom(
                onPressed: searchByEmail,
                buttonTitle: 'Cari Pemberi',
                textStyle: appTheme
                    .button(context)
                    .copyWith(fontWeight: FontWeight.bold, color: colorPallete.white),
              );
            }),
            const SizedBox(height: 10),
            Center(child: Text('Atau')),
            const SizedBox(height: 10),
            Consumer((ctx, read) {
              final globalProvider = read(globalStateNotifierProvider.state);
              if (globalProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Card(
                child: ListTile(
                  onTap: searchById,
                  leading: Card(
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: CircleAvatar(
                      backgroundColor: colorPallete.white,
                      foregroundColor: colorPallete.black,
                      child: ShowImageAsset(
                        imageUrl: '${AppConfig.urlImageAsset}/qr-code.png',
                        fit: BoxFit.cover,
                        padding: const EdgeInsets.all(8.0),
                        color: colorPallete.accentColor,
                      ),
                    ),
                  ),
                  title: Text('Scan QR code'),
                  subtitle: Text(
                    'Silahkan scan QR code pemberi utang',
                    style: appTheme.caption(context),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
