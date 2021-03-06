import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/providers/order_provider.dart';
import 'package:grabit/screens/home_screen.dart';
import 'package:grabit/screens/nav_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/show_loader.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _value = 1;
  int _value2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<OrderProvider>(builder: (context, provider, child) {
          return Stack(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment method',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: homeHeadingColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Icon(
                                              // FontAwesomeIcons.creditCard,
                                              Icons.credit_card_outlined,
                                              color: Colors.white,
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Credit card',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: 0,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value as int;
                                        });
                                      },
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: primaryColor),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Icon(
                                              // FontAwesomeIcons.moneyBill,
                                              Icons.payments_outlined,
                                              color: Colors.white,
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Cash',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value as int;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Delivery Options',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: homeHeadingColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: const Text(
                                      'Pick up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    leading: Radio(
                                      value: 4,
                                      groupValue: false,
                                      onChanged: (value) {
                                        setState(() {
                                          _value2 = value as int;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45, bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Provider.of<OrderProvider>(context, listen: false)
                                  .placeOrder()
                                  .then((value) {
                                if (value['status'] == 1) {
                                  Fluttertoast.showToast(msg: "Order Placed");
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => NavScreen()),
                                      (Route<dynamic> route) => false);
                                }
                              });
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                  child: Text(
                                'Complete order',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                                child: Text(
                              'Cancel order',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )),
              if (provider.loading)
                Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: ShowLoader(),),
                )
            ],
          );
        }),
      ),
    );
  }
}
