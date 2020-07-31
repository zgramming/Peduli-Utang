import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/global_provider.dart';

import '../widgets/setting_screen/dialog_qr.dart';
import '../widgets/setting_screen/menu_setting.dart';
import '../widgets/profil_info.dart';
import '../screen/login_screen.dart';
import '../screen/history_screen.dart';

class SettingScreen extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signOutWithGoogle(BuildContext context) async {
    await Future.wait([
      userProvider.read(context).signOutWithGoogle(),
      GlobalFunction().showToast(message: 'Berhasil Logout', isSuccess: true),
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeNamed),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: sizes.width(context) / 15,
          left: sizes.width(context) / 15,
          top: sizes.height(context) / 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Consumer(
              (ctx, read) {
                final globalState = read(globalStateNotifierProvider.state);
                return Text(
                  'Pengaturan',
                  style: appTheme.headline5(context).copyWith(
                        fontFamily: 'Righteous',
                        color: globalState.isDarkMode ? colorPallete.white : colorPallete.black,
                      ),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer((ctx, read) {
              final result = read(userProvider.state);
              return ProfilInfo(
                email: result.emailUser,
                username: result.nameUser,
                photo: result.imageUser,
              );
            }),
            const SizedBox(height: 40),
            Text('Akun', style: appTheme.headline6(context)),
            const SizedBox(height: 10),
            MenuSetting(
              icon: Icons.history,
              onTap: () async => Navigator.of(context).pushNamed(HistoryScreen.routeNamed),
              title: 'Riwayat',
            ),
            const SizedBox(height: 10),
            MenuSetting(
              leading: ShowImageAsset(
                imageUrl: '${AppConfig.urlImageAsset}/qr-code.png',
                fit: BoxFit.cover,
                color: colorPallete.white,
                padding: const EdgeInsets.all(8.0),
              ),
              title: 'QR-Ku',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => DialogQR(),
                );
              },
            ),
            const SizedBox(height: 10),
            Text('Aplikasi', style: appTheme.headline6(context)),
            const SizedBox(height: 10),
            MenuSetting(
              icon: Icons.brightness_3,
              onTap: null,
              title: 'Tema',
              subtitle: 'Kamu bisa atur tampilan menjadi gelap atau terang',
              trailing: Consumer((ctx, read) {
                final globalState = read(globalStateNotifierProvider.state);
                return Switch.adaptive(
                  value: globalState.isDarkMode,
                  onChanged: (value) =>
                      globalStateNotifierProvider.read(context).setDarkModeTheme(value),
                );
              }),
            ),
            const SizedBox(height: 10),
            MenuSetting(
              icon: Icons.security,
              onTap: null,
              title: 'Izinkan Ngutang',
              subtitle: 'Jika tidak aktif, orang lain tidak bisa meminta utang kepadamu',
              trailing: Consumer((ctx, read) {
                final user = read(userProvider.state);
                final globalState = read(globalStateNotifierProvider.state);
                var isAllowUtang = user.allowUtang == '1' ? true : false;
                if (globalState.isLoading) {
                  return CircularProgressIndicator();
                }
                return Switch.adaptive(
                  value: isAllowUtang,
                  onChanged: (value) async {
                    var result = value ? '1' : '0';
                    globalStateNotifierProvider.read(context).toggleLoading(true);
                    await userProvider.read(context).updateAllowUtang(result);
                    globalStateNotifierProvider.read(context).toggleLoading(false);

                    // return globalStateNotifierProvider.read(context).setDarkModeTheme(value);
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            MenuSetting(
              icon: Icons.arrow_back,
              onTap: () async {
                await globalStateNotifierProvider.read(context).setAlreadyLogin(false);
                await signOutWithGoogle(context);
              },
              title: 'Keluar',
              backgroundColor: colorPallete.red,
            ),
            SizedBox(height: sizes.statusBarHeight(context) * 4),
          ],
        ),
      ),
    );
  }
}
