import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/OrderListModel.dart';
import 'package:grabit/utils/api.dart';
import 'package:intl/intl.dart';

import '../models/order_model.dart';
import '../screens/order_details_screen.dart';


class OrderList extends StatefulWidget {
  final List<OrdersData> orderList;

  const OrderList({Key? key, required this.orderList}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.orderList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final OrdersData orders = widget.orderList[index];

          String status = orders.status==0?'Canceled':
          orders.status==1?'Waiting':
          orders.status==2?'Accepted':
          orders.status==3?'On Deliver':'done';
          return InkWell(
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) =>
                      OrderDetails(id: orders.id.toString()));
            },
            child: Container(
              height: 130,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black, width: 0.1)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(imageUrl: Urls().itemsUrl+orders.items![0].itemDetails!.img!,fit: BoxFit.cover,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orders.items![0].itemType==0?
                              orders.items![0].itemDetails?.enItemName??"":
                              orders.items?[0].itemDetails?.bundleName??"",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              status,
                              style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                                DateFormat("yyyy-MM-dd").parse(orders.createdAt!).toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            Text(
                              'OrderId : ${orders.id}',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.refresh,
                                        size: 18,
                                        color: Colors.orange.shade700,
                                      ),
                                      Text(
                                        'Re-order',
                                        style: TextStyle(
                                            color: Colors.orange.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.smilingFace,
                                        size: 18,
                                        color: Colors.orange.shade700,
                                      ),
                                      Text(
                                        'Rate-us',
                                        style: TextStyle(
                                            color: Colors.orange.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(CupertinoIcons.forward),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
