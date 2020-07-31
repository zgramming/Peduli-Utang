import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import './home_screen.dart';
import './setting_screen.dart';
import './searching_screen.dart';

import '../widgets/custom_bottomnavigation.dart';

import '../../providers/global_provider.dart';
import '../../function/show_local_notification.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeNamed = '/welcome-screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Future<dynamic> backgroundNotifHandler(Map<String, dynamic> message) {
  return LocalNotification().showNotification(
    idNotification: 3,
    titleNotification: message['data']['title'],
    bodyNotification: message['data']['body'],
    payloadNotification: 'disini isi payload',
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final LocalNotification localNotification = LocalNotification();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          showLocalNotif(message);
        },
        onResume: (Map<String, dynamic> message) async {
          print('on resume $message');
          await Navigator.of(context)
              .pushNamed(message['data']['screen'], arguments: message['data']['id']);
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('on launch $message');
          await Navigator.of(context)
              .pushNamed(message['data']['screen'], arguments: message['data']['id']);
        },
        onBackgroundMessage: backgroundNotifHandler,
      );
      initLocalNotification();
    });
  }

  void showLocalNotif(Map<String, dynamic> message) async {
    await localNotification.showNotification(
      idNotification: 2,
      titleNotification: message['data']['title'],
      bodyNotification: message['data']['body'],
      payloadNotification: message['data']['id'],
    );
  }

  void initLocalNotification() async {
    await localNotification.initLocalNotification(
      onClickNotification: (String payload) {
        if (payload.isEmpty) {
          print('Tidak ADa Payload');
        } else {
          print('Ini Payloadnya :$payload');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: colorPallete.monochromaticColor, // status bar color
    // ));
    final screens = [
      HomeScreen(),
      SearchingScreen(),
      SettingScreen(),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: sizes.statusBarHeight(context),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: sizes.height(context) - sizes.statusBarHeight(context),
              width: sizes.width(context),
            ),
            Consumer((ctx, read) {
              final globalState = read(globalStateNotifierProvider.state);
              return IndexedStack(children: screens, index: globalState.indexBottomNavigation);
              // return screens[globalState.indexBottomNavigation];
            }),
            Positioned(
              bottom: 20,
              left: sizes.width(context) / 10,
              right: sizes.width(context) / 10,
              child: CustomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
