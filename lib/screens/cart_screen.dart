import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../assets.dart';
import '../constants.dart';
import '../widgets/cart_card.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: const Text('Food Cart'),
        centerTitle: true,
      ),
      backgroundColor: scaffoldbgColor,
      body: Column(
        children: [
          CartCard(
            imageUrl: Assets.food2,
            name: 'Bazooka',
            location: 'ALEXANDRIA',
            price: '3.5',
          ),
          CartCard(
            imageUrl: Assets.food3,
            name: 'Pizza',
            location: 'ALEXANDRIA',
            price: '4.5',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Cart Total',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('E£34.30',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Tax',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('E£4.30',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Delivery',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('E£3.10',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Sub Total',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                Text('E£144.30',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 20),
            child: GestureDetector(
              onTap: (){
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) =>
                        const CheckoutScreen());

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
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
