import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen/login_screen.dart';
import '../screen/welcome_screen.dart';

import '../../providers/global_provider.dart';

import './onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeNamed = '/splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read(globalStateNotifierProvider).getAllSession();
      context.read(userProvider).readUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        (ctx, read) {
          final globalState = read(globalStateNotifierProvider.state);
          return SplashScreenTemplate(
            image: ShowImageAsset(
              imageUrl: 'asset/images/logo_white.png',
              padding: EdgeInsets.all(sizes.width(context) / 10),
            ),
            copyRightVersion: CopyRightVersion(),
            navigateAfterSplashScreen: (_) {
              if (!globalState.alreadyOnboarding) {
                return OnboardingScreen();
              } else {
                if (!globalState.alreadyLogin) {
                  return LoginScreen();
                } else {
                  return WelcomeScreen();
                }
              }
            },
            backgroundColor: colorPallete.primaryColor,
          );
        },
      ),
    );
  }
}
