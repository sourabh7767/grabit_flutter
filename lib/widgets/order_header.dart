import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/OrderDetailModel.dart';
import 'package:grabit/utils/api.dart';
import 'package:intl/intl.dart';

import '../models/order_model.dart';

class OrderHeaderCard extends StatelessWidget {
  const OrderHeaderCard({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  final Data orderDetails;

  @override
  Widget build(BuildContext context) {

    String status = orderDetails.status==0?'Canceled':
    orderDetails.status==1?'Waiting':
    orderDetails.status==2?'Accepted':
    orderDetails.status==3?'On Deliver':'done';

    return Container(
      height: 127,
      decoration: const BoxDecoration(

        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 30,),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                       ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(imageUrl: Urls().itemsUrl+orderDetails.items![0].itemDetails!.img!,fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderDetails.items![0].itemType==0?
                          orderDetails.items![0].itemDetails?.enItemName??"":
                          orderDetails.items?[0].itemDetails?.bundleName??"",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          status,
                          style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,fontSize: 12),
                        ),
                        Text(
                          DateFormat("yyyy-MM-dd").parse(orderDetails.createdAt!).toString(),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,fontSize: 12),
                        ),
                        Text(
                          'OrderId : ${orderDetails.id}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,fontSize: 12),
                        ),

                      ],
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
