import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src/ui/screen/splash_screen.dart';
import '../src/ui/screen/login_screen.dart';
import '../src/ui/screen/welcome_screen.dart';
import '../src/ui/screen/add_utang_screen.dart';
import '../src/ui/screen/detail_utang_screen.dart';
import '../src/ui/screen/statistic_screen.dart';
import '../src/ui/screen/history_screen.dart';
import '../src/ui/screen/pengutang_screen.dart';

import './providers/global_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      (ctx, read) {
        final globalState = read(globalStateNotifierProvider.state);
        return MaterialApp(
          title: 'Peduli Utang',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: colorPallete.primaryColor,
            accentColor: colorPallete.accentColor,
            fontFamily: 'VarelaRound',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            cardTheme: CardTheme(elevation: 3),
            brightness: globalState.isDarkMode ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor:
                globalState.isDarkMode ? colorPallete.darkGrey : colorPallete.white,
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor:
                  globalState.isDarkMode ? colorPallete.darkGreyAccent4 : colorPallete.white,
            ),
          ),
          home: SplashScreen(),
          routes: {
            LoginScreen.routeNamed: (ctx) => LoginScreen(),
            WelcomeScreen.routeNamed: (ctx) => WelcomeScreen(),
            AddUtangScreen.routeNamed: (ctx) =>
                AddUtangScreen(ModalRoute.of(ctx).settings.arguments),
            DetailUtangScreen.routeNamed: (ctx) =>
                DetailUtangScreen(ModalRoute.of(ctx).settings.arguments),
            StatisticScreen.routeNamed: (ctx) => StatisticScreen(),
            HistoryScreen.routeNamed: (ctx) => HistoryScreen(),
            PengutangScreen.routeNamed: (ctx) => PengutangScreen(),
          },
        );
      },
    );
  }
}
