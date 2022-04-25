import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/utils/storage.dart';
import 'package:http/http.dart';

class PushNotificationsManager {
  late final FirebaseMessaging _messaging;
  PushNotificationsManager._();
  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      await Firebase.initializeApp();
      _messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      _messaging.getToken().then((value) {
        if (value != null) {
          log('👋 FCMTOKEN: $value');
          sharedPrefs.fbToken = value;
          if (sharedPrefs.userData != null && value.isNotEmpty) {
            submitToken(value);
          }
        }
      });

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
      } else {
        debugPrint('User declined or has not accepted permission');
      }

      _initialized = true;
    }
  }

  void submitToken(String value) async {
    try {
      await post(Uri.parse(urls.firebaseTokenUpdate),
          body: json.encode({'device_type': 1, 'device_token': value}),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
          });
    } catch (e, trace) {
      // ignore: avoid_print
      print(trace);
    }
  }
}
