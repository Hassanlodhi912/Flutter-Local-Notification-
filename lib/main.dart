// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  // ignore: prefer_const_constructors
  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);
  bool? initialized =
      await notificationsPlugin.initialize(initializationSettings);
  print("Notification: $initialized");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showNotificaton()  async{
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        "notification-hassan", "hassan Notification",
        priority: Priority.max, importance: Importance.max);
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetail =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
   await notificationsPlugin.show(
        0, "Hassan 1341-2019", "This is my local Notification", notiDetail);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showNotificaton,
          child: Icon(Icons.notification_add),
        ),
      ),
    );
  }
}
