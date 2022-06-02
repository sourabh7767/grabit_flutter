import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/CartModel.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';
import '../utils/storage.dart';

class CartProvider with ChangeNotifier {
  bool loading = false;

  CartModel cartModel = CartModel();

  Future addToCart(data) async {
    loading = true;
    notifyListeners();
    print("URL==> ${urls.addToCart}");
    print("data==> $data");

    final response =
        await http.post(Uri.parse(urls.addToCart), body: data, headers: {
      HttpHeaders.acceptHeader: "application/json",
      'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
    });
    print(jsonDecode(response.body));
    loading = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if(data['success']==false){
        Fluttertoast.showToast(msg: 'Something went wrong');
      }else{
        Fluttertoast.showToast(msg: 'Item added in your cart');
      }
    }
    loading = false;
    notifyListeners();
    return jsonDecode(response.body);
  }

  Future addItemQuantity(data) async {
    loading = true;
    notifyListeners();
    print("URL==> ${urls.addItemQuantity}");
    print("data==> $data");

    final response =
        await http.post(Uri.parse(urls.addItemQuantity), body: data, headers: {
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

  void getCartData() async {
    print("token==> ${sharedPrefs.userData?.token}");

    try {
      loading = true;
      notifyListeners();
      final url = Uri.parse(urls.getCartData);
      final response = await http.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        cartModel = CartModel.fromJson(responseData);
        print(responseData);
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
    loading = false;
    notifyListeners();
  }

  Future removeCart(data) async {
    loading = true;
    notifyListeners();
    print("URL==> ${urls.removeCart}");
    print("token==> ${sharedPrefs.userData?.token}");

    try {
      final response =
          await http.post(Uri.parse(urls.removeCart), body: data, headers: {
        HttpHeaders.acceptHeader: "application/json",
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });

      print(response.body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        getCartData();
      }

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }

    loading = false;
    notifyListeners();
  }
}
