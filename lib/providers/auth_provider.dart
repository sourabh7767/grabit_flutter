import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/UserModel.dart';
import 'package:grabit/utils/push_notifications.dart';
import 'package:grabit/utils/storage.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

class RegisterProvider with ChangeNotifier {
  var loading = false;
  var userSignupSuccess = false;

  Future<void> register(
      String username, String password, String email, String phone) async {
    if (username.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter username');
    } else if (password.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
    } else if (email.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
    } else if (phone.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter Phone number');
    } else {
      try {
        loading = true;
        notifyListeners();
        final url = Uri.parse(urls.register);
        final response = await http.post(url,
            body: json.encode({
              'username': username,
              'password': password,
              'email': email,
              'phone_number': phone,
            }),
            headers: {HttpHeaders.contentTypeHeader: "application/json"});

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          if (responseData['data'] is Map) {
            final user = User.fromMap(responseData['data']);
            sharedPrefs.userData = user;
            userSignupSuccess = true;
            if (sharedPrefs.fbToken != null) {
              PushNotificationsManager().submitToken(sharedPrefs.fbToken!);
            }
          } else {
            final Map errorMap =
                responseData['error'] ?? responseData['errors'] ?? {};

            var errr = <String>[];
            for (var value in errorMap.values) {
              if (value is List) {
                errr.add(value.first.toString());
              }
            }
            Fluttertoast.showToast(msg: errr.join(", "));
          }
        }
      } catch (e) {}
      loading = false;

      notifyListeners();
    }
  }
}

class RegisterOtpProvider with ChangeNotifier {
  var loading = false;
  var otpVerified = false;

  Future<void> otpVerify(String otp) async {
    try {
      loading = true;
      notifyListeners();
      final url = Uri.parse(urls.verifyOtp);
      final response =
          await http.post(url, body: json.encode({'otp': otp}), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      loading = false;
      if (response.statusCode == 200) {
        otpVerified = true;
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: 'Incorrect otp entered');
      }
    } catch (e) {}
    notifyListeners();
  }
}

class LoginProvider with ChangeNotifier {
  var loading = false;
  var loggedIn = false;

  Future<void> login(String username, String password) async {
    if (username.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter username');
    } else if (password.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
    } else {
      try {
        loading = true;
        notifyListeners();
        final url = Uri.parse(urls.login);
        final response = await http.post(url,
            body: json.encode({
              'username': username,
              'password': password,
            }),
            headers: {HttpHeaders.contentTypeHeader: "application/json"});

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          if (responseData['data'] is Map) {
            final user = User.fromMap(responseData['data']);
            sharedPrefs.userData = user;
            loggedIn = true;
            if (sharedPrefs.fbToken != null) {
              PushNotificationsManager().submitToken(sharedPrefs.fbToken!);
            }
          } else {
            final Map errorMap = responseData['error'] ??
                responseData['errors'] ??
                {
                  if (responseData['message'] != null)
                    'error': responseData['message'].toString()
                };

            var errr = <String>[];
            for (var value in errorMap.values) {
              if (value is List) {
                errr.add(value.first.toString());
              }
            }
            Fluttertoast.showToast(msg: errr.join(", "));
          }
        }
      } catch (e) {}
      loading = false;

      notifyListeners();
    }
  }
}

class ChangeProfileProvider with ChangeNotifier {
  var loading = false;

  Future<void> update(String email, String firstName, String lastName,
      String dob, int gender) async {
    if (email.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
    } else if (firstName.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter first name');
    } else if (lastName.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter last name');
    } else {
      try {
        loading = true;
        notifyListeners();
        final url = Uri.parse(urls.updateProfile);
        final response = await http.post(url,
            body: json.encode({
              'first_name': firstName,
              'last_name': lastName,
              'dob': dob,
              'email': email,
              'gender': gender
            }),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
            });

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          Fluttertoast.showToast(msg: responseData['message'].toString());
          if (responseData['data'] is Map) {
            final user = User.fromMap(responseData['data']);
            sharedPrefs.userData = user;
          } else {
            final Map errorMap =
                responseData['error'] ?? responseData['errors'] ?? {};

            var errr = <String>[];
            for (var value in errorMap.values) {
              if (value is List) {
                errr.add(value.first.toString());
              }
            }
            Fluttertoast.showToast(msg: errr.join(", "));
          }
        }
      } catch (e) {}
      loading = false;

      notifyListeners();
    }
  }
}

class ChangepasswordProvider with ChangeNotifier {
  var loading = false;

  Future<bool> change(String password, String newPassword) async {
    if (password.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
    } else if (newPassword.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter new password');
    } else {
      try {
        loading = true;
        notifyListeners();
        final url = Uri.parse(urls.changePassword);
        final response = await http.post(url,
            body: json.encode({
              'current_password': password,
              'new_password': newPassword,
            }),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
            });

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          Fluttertoast.showToast(msg: responseData['message'].toString());
          return responseData['success'] == true;
        } else {
          final responseData = json.decode(response.body);
          final Map errorMap =
              responseData['error'] ?? responseData['errors'] ?? {};

          var errr = <String>[];
          for (var value in errorMap.values) {
            if (value is List) {
              errr.add(value.first.toString());
            }
          }
          Fluttertoast.showToast(msg: errr.join(", "));
        }
      } catch (e) {
        return false;
      }
      loading = false;

      notifyListeners();
      return false;
    }
    return false;
  }
}
