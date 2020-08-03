import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/global_provider.dart';

import './welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeNamed = '/login-screen';
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      context.read(globalStateNotifierProvider).toggleLoading(true);
      final tokenFCM = await firebaseMessaging.getToken();
      final result = await googleSignIn.signIn();
      if (result == null) {
        context.read(globalStateNotifierProvider).toggleLoading(false);

        return null;
      }
      await context.read(userProvider).validateUser(googleAccount: result, tokenFCM: tokenFCM);
      await context.read(globalStateNotifierProvider).setAlreadyLogin(true);
      context.read(globalStateNotifierProvider).toggleLoading(false);

      await Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeNamed);
    } catch (e) {
      context.read(globalStateNotifierProvider).toggleLoading(false);

      await GlobalFunction().showToast(message: e.toString(), isError: true, isLongDuration: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPallete.primaryColor,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: sizes.statusBarHeight(context) + sizes.height(context) / 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 10),
              child: Text(
                'Login',
                style: appTheme.headline2(context).copyWith(
                      color: colorPallete.white,
                      fontFamily: 'Righteous',
                      letterSpacing: 2,
                    ),
              ),
            ),
            SizedBox(height: sizes.height(context) / 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizes.width(context) / 10),
              child: Text(
                'Cukup gunakan akun google kamu untuk menggunakan aplikasi ini',
                style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
              ),
            ),
            Expanded(
              child: Consumer(
                (ctx, read) {
                  final globalState = read(globalStateNotifierProvider.state);
                  if (globalState.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(sizes.width(context) / 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorPallete.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: Offset(2, 4),
                            color: colorPallete.black.withOpacity(.5),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async => await signInWithGoogle(context),
                        splashColor: colorPallete.accentColor,
                        child: ShowImageAsset(
                          imageUrl: 'asset/images/LG-1.png',
                          padding: EdgeInsets.all(sizes.width(context) / 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CopyRightVersion(
              backgroundColor: colorPallete.monochromaticColor,
            ),
          ],
        ),
      ),
    );
  }
}
