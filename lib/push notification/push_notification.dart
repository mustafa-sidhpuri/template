import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'local notification/local_notification.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise(BuildContext context) async {
    if (Platform.isIOS) {
      _fcm.requestPermission();
    }
    LocalNotificationService.initialize(context);

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
       // TODO: do something

      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        // TODO: do something
      }

      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
        //TODO:  do something
    });

  }
}