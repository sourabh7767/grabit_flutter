import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/CategoryListModel.dart';
import 'package:grabit/models/HotRightNowDetailModel.dart';
import 'package:grabit/models/SingleItemModel.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../utils/api.dart';
import '../utils/storage.dart';

class HomeProvider with ChangeNotifier {
  var loading = false;
  HomeListModel homeData = HomeListModel();

  SingleItemModel singleItemModel = SingleItemModel();
  CategoryListModel categoryListModel = CategoryListModel();
  HotRightNowDetailModel hotRightNowDetailModel = HotRightNowDetailModel();

  Future<void> getData() async {
    try {
      loading = true;
      notifyListeners();
      final url = Uri.parse(urls.home);
      final response = await http.get(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);

        homeData = HomeListModel.fromJson(responseData);

        homeData.storeBaseUrl = responseData["store_base_url"];
        homeData.itemBaseUrl = responseData["item_base_url"];
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


  void getCategory(String id) async {
    loading = true;
    notifyListeners();

    print("URL==> ${urls.getItemById + id}");

    try {
      final response =
      await get(Uri.parse(urls.getCategoryById + id.toString()), headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);
        categoryListModel = CategoryListModel.fromJson(data);
      }
    } catch (e) {

      print(e);

    }

    loading = false;
    notifyListeners();
  }

  void getHotRightById(String id) async {
    loading = true;
    notifyListeners();

    print("URL==> ${urls.getHotRightById + id}");

    try {
      final response =
      await get(Uri.parse(urls.getHotRightById + id.toString()), headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);
        hotRightNowDetailModel = HotRightNowDetailModel.fromJson(data);
      }
    } catch (e) {

      print(e);

    }

    loading = false;
    notifyListeners();
  }

  void getItemById(String id) async {
    loading = true;
    notifyListeners();

    print("URL==> ${urls.getItemById + id}");

    try {
      final response =
      await get(Uri.parse(urls.getItemById + id.toString()), headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);
        singleItemModel = SingleItemModel.fromJson(data);
      }
    } catch (e) {

      print(e);

    }

    loading = false;
    notifyListeners();
  }

}
