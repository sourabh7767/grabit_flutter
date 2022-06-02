import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/CartModel.dart';
import 'package:grabit/models/OrderDetailModel.dart';
import 'package:grabit/models/OrderListModel.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';
import '../utils/storage.dart';

class OrderProvider with ChangeNotifier {
  bool loading = false;

  CartModel cartModel = CartModel();
  OrderListModel orderListModel = OrderListModel();
  OrderDetailModel orderDetailModel = OrderDetailModel();

  Future placeOrder() async {
    loading = true;
    notifyListeners();
    print("URL==> ${urls.placeOrder}");

    final response = await http.post(Uri.parse(urls.placeOrder), headers: {
      HttpHeaders.acceptHeader: "application/json",
      'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
    });
    print(jsonDecode(response.body));
    loading = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
    }
    loading = false;
    notifyListeners();
    return jsonDecode(response.body);
  }

  void getOrders() async {
    print("token==> ${sharedPrefs.userData?.token}");
    loading = true;
    notifyListeners();
    final url = Uri.parse(urls.getOrder);
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      orderListModel = OrderListModel.fromJson(responseData);
      print(responseData);
    }
    loading = false;
    notifyListeners();
  }

  void getOrderById(id) async {
    print("token==> ${sharedPrefs.userData?.token}");
    loading = true;
    notifyListeners();
    final url = Uri.parse(urls.getOrderById+id);
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      orderDetailModel = OrderDetailModel.fromJson(responseData);
      print(responseData);
    }
    loading = false;
    notifyListeners();
  }

}
