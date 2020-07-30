import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class LocalNotification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings _androidInitializationSettings;
  IOSInitializationSettings _iosInitializationSettings;
  InitializationSettings _initializationSettings;

  AndroidNotificationDetails _androidNotificationDetail({
    @required int idNotification,
    @required String titleNotification,
    @required String bodyNotification,
  }) {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    return AndroidNotificationDetails(
      idNotification.toString(), titleNotification, bodyNotification,
      priority: Priority.High,
      importance: Importance.Max,
      color: colorPallete.primaryColor,

      ///! For config Sound Notification
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      playSound: true,

      ///! For Showing Long Text and append expanded icon
      styleInformation: BigTextStyleInformation(''),

      ///! Configurasi LED
      enableLights: true,
      ledColor: Color.fromARGB(100, 150, 100, 0),
      ledOnMs: 10000,
      ledOffMs: 5000,

      //! For Config Vibrate
      vibrationPattern: vibrationPattern,
      enableVibration: true,
    );
  }

  IOSNotificationDetails _iosNotificationDetails() => IOSNotificationDetails();

  //! Should Be Initialize First Before used flutter local notification
  Future<void> initLocalNotification({Function(String) onClickNotification}) async {
    //! Saat Initial Local Notificatoin : 1.Taro app_icon.png di android>res>drawable
    //! 2.Pasang Suara Notifikasi di res>raw>suara.mp3
    _androidInitializationSettings = AndroidInitializationSettings('app_icon');
    _iosInitializationSettings = IOSInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    _initializationSettings = InitializationSettings(
      _androidInitializationSettings,
      _iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: onClickNotification,
    );
  }

  Future _onDidReceiveLocalNotification(
    int id,
    String title,
    String body,
    String payload,
  ) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          child: Text('ok'),
          isDefaultAction: true,
          onPressed: () => print('dialog cupertino || $payload'),
        )
      ],
    );
  }

  Future<void> onClickNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future<void> showNotification({
    @required int idNotification,
    String titleNotification,
    String bodyNotification,
    String payloadNotification = 'Default Payload :D',
  }) async {
    var platformChannelSpecifics = NotificationDetails(
      _androidNotificationDetail(
        idNotification: idNotification,
        titleNotification: titleNotification,
        bodyNotification: bodyNotification,
      ),
      _iosNotificationDetails(),
    );
    await _flutterLocalNotificationsPlugin.show(
      idNotification,
      titleNotification,
      bodyNotification,
      platformChannelSpecifics,
      payload: payloadNotification,
    );
  }

  Future<void> showNotificationSchedule({
    @required DateTime dateTimeShowNotification,
    @required int idNotification,
    String titleNotification,
    String bodyNotification,
    String payloadNotification,
  }) async {
    var notificationDetails = NotificationDetails(
      _androidNotificationDetail(
        idNotification: idNotification,
        titleNotification: titleNotification,
        bodyNotification: bodyNotification,
      ),
      _iosNotificationDetails(),
    );
    await _flutterLocalNotificationsPlugin.schedule(
      idNotification,
      titleNotification,
      bodyNotification,
      dateTimeShowNotification,
      notificationDetails,
      payload: payloadNotification,
    );
  }

  Future<void> cancelNotificationById(int idNotification) async {
    await _flutterLocalNotificationsPlugin.cancel(idNotification);
  }

  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}

final localNotification = LocalNotification();
