import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/utils/api.dart';
import 'package:http/http.dart';

import '../utils/storage.dart';

class GetAllStoresProvider with ChangeNotifier {
  var loading = false;

  List<StoreModel> stores = [];
  StoreModel? storeDetail;

  void getStores() async {
    loading = true;
    notifyListeners();

    try {
      final response = await get(Uri.parse(urls.getAllStores), headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        if (data is List) {
          this.stores = data.map((e) => StoreModel.fromJson(e)).toList();
        }
      }
    } catch (e) {}

    loading = false;
    notifyListeners();
  }

  void getStore(int id) async {
    loading = true;
    notifyListeners();

    try {
      final response =
          await get(Uri.parse(urls.getStoreDetail + id.toString()), headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];

        storeDetail = StoreModel.fromJson(data);
      }
    } catch (e) {}

    loading = false;
    notifyListeners();
  }
}
