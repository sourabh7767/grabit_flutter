import 'package:flutter/material.dart';

import '../models/order_model.dart';

class OrderHeaderCard extends StatelessWidget {
  const OrderHeaderCard({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  final MyOrders orderDetails;

  @override
  Widget build(BuildContext context) {
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
                        image: DecorationImage(
                            image: AssetImage(orderDetails.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderDetails.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          orderDetails.status,
                          style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,fontSize: 12),
                        ),
                        Text(
                          orderDetails.date,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,fontSize: 12),
                        ),
                        Text(
                          'OrderId : ${orderDetails.orderId}',
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
