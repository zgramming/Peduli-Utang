import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/global_provider.dart';

import '../widgets/onboarding_screen/page_view.dart';

import './login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeNamed = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: showPageViewModel(context),
      onDone: () async {
        await globalStateNotifierProvider.read(context).setAlreadyOnboarding(true);
        await Navigator.of(context).pushReplacementNamed(LoginScreen.routeNamed);
      },
      done: Text(
        'Selesai',
        style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
      ),
      next: Text(
        'Lanjut',
        style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
      ),
      showSkipButton: true,
      skip: Text(
        'Lewati',
        style: appTheme.subtitle1(context).copyWith(color: colorPallete.white),
      ),
      dotsDecorator: DotsDecorator(
        color: colorPallete.white.withOpacity(.5),
        activeColor: colorPallete.white,
        activeSize: Size(15, 15),
      ),
    );
  }
}
