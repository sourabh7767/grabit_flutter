import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:http/http.dart' as http;
import '../utils/api.dart';
import '../utils/storage.dart';

class HomeProvider with ChangeNotifier {
  var loading = false;
  HomeListModel homeData = HomeListModel(categoryList: [], nearByStore: []);

  Future<void> getData() async {
    try {
      loading = true;
      notifyListeners();
      final url = Uri.parse(urls.home);
      final response = await http.get(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        homeData = HomeListModel.fromJson(responseData['data']);
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
    } catch (e, t) {
      print(e);
      print(t);
    }
    loading = false;

    notifyListeners();
  }
}
