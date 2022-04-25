import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/order_list.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: const Text(
          'My Orders',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),

          child: Column(
            children: [
              OrderList(orderList: myOrder),
            ],
          ),
        ),
      ),
    );
  }
}
