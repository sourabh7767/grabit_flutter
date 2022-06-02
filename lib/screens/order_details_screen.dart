import 'package:flutter/material.dart';
import 'package:grabit/models/OrderDetailModel.dart';
import 'package:grabit/providers/order_provider.dart';
import 'package:grabit/widgets/empty_data.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/order_header.dart';

class OrderDetails extends StatefulWidget {
  final String id;

  const OrderDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getOrderById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child) {
      OrderDetailModel orderDetailModel = provider.orderDetailModel;

      return Scaffold(
        backgroundColor: scaffoldbgColor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          title: const Text('Order Details'),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.qr_code),
            ),
          ],
        ),
        body: Stack(
          children: [
            SafeArea(
              child: orderDetailModel.data != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderHeaderCard(orderDetails: orderDetailModel.data!),
                        const Divider(
                          color: Colors.grey,
                          indent: 0,
                          endIndent: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Iconsax.location_tick,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Pickup Address',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  orderDetailModel.data!.items![0].itemDetails!
                                      .storeDetails!.location
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Mobile : ${orderDetailModel.data!.items![0].itemDetails!.storeDetails!.phone.toString()}',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 0,
                          endIndent: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            'Order Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  orderDetailModel.data?.items?.length ?? 0,
                              itemBuilder: (context, index) {

                                Items data = orderDetailModel.data!.items![index];

                                return Column(
                                  children: [
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children:  [
                                        Text('${data.quantity} x ${data.itemType==0?
                                        data.itemDetails?.enItemName??"":
                                        data.itemDetails?.bundleName??""}'),
                                        Text('\$${(double.parse(data.price!)*(data.quantity)!)}'),
                                      ],
                                    ),

                                  ],
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal'),
                              Text("\$${orderDetailModel.data!.totalPrice.toString()}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text('Total'),
                              Text("\$${orderDetailModel.data!.totalPrice.toString()}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text('Payment method'),
                              Text('Cash'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Pickup before'),
                              Text('120 mins'),
                            ],
                          ),
                        ),
                      ],
                    )
                  : showEmptyImage(context),
            ),
            if (provider.loading) ShowLoader()
          ],
        ),
      );
    });
  }
}
