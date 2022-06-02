import 'package:flutter/material.dart';
import 'package:grabit/models/OrderListModel.dart';
import 'package:grabit/providers/order_provider.dart';
import 'package:grabit/widgets/empty_data.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/order_list.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {


  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false)
        .getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child) {

      OrderListModel model = provider.orderListModel;

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
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      model.data!=null?OrderList(orderList: model.data!):showEmptyImage(context),
                    ],
                  ),
                ),
                if(provider.loading)ShowLoader()
              ],
            ),
          ),
        );
      }
    );
  }
}
