import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/CartModel.dart';
import 'package:grabit/providers/cart_provider.dart';
import 'package:grabit/screens/hot_right_now_detail_screen.dart';
import 'package:grabit/screens/screens.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/widgets/empty_data.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double cartTotal = 0;

  @override
  void initState() {
    Provider.of<CartProvider>(context,listen: false).getCartData();
    super.initState();
  }

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
      body: Consumer<CartProvider>(
          builder: (context, provider, child) {
            Data? data = provider.cartModel.data;
            cartTotal=0;
            if (data != null && data.cartDetails!.isNotEmpty) {
              data.cartDetails!.forEach((element) {
                cartTotal = cartTotal += (double.parse(element.price!)*element.quantity!);
              });
            }
            return Stack(
              children: [
                SingleChildScrollView(
                        child: data != null && data.cartDetails!.length > 0
                            ? Column(
                                children: [
                                  ListView.builder(
                                      itemCount: data.cartDetails?.length ?? 0,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        CartDetails detail =
                                            data.cartDetails![index];
                                        return itemCart(detail);
                                      }),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Cart Total',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$${cartTotal.toString()}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tax',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$${0}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Delivery',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$${0}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sub Total',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$${cartTotal.toString()}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 45, horizontal: 20),
                                    child: GestureDetector(
                                      onTap: () {
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
                              )
                            : showEmptyImage(context),
                      ),
                if(provider.loading)
                  ShowLoader()
              ],
            );
          }),
    );
  }

  Widget itemCart(CartDetails detail) {

    print(detail.toJson());

    return InkWell(
      onTap: (){
        detail.itemType==1? showCupertinoModalPopup(
            context: context,
            builder: (context) => ItemTap(
              title: detail.itemDetails?.enItemName??"",
              location: '',
              imageUrl: urls.itemsUrl+ detail.itemDetails!.img!,
              phone: '123456789',
              meal: 'Meal',
              id: detail.itemId.toString(),
            )):showCupertinoModalPopup(
            context: context,
            builder: (context) => HotRightNowScreen(
              title: detail.itemDetails?.enItemName??"",
              location: '',
              imageUrl: urls.itemsUrl+ detail.itemDetails!.img!,
              phone: '123456789',
              meal: 'Meal',
              id: detail.itemId.toString(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 130,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: PhysicalModel(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 70,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () => setState(() {
                                        int count = detail.quantity!;
                                        count++;
                                        detail.quantity = count;
                                        var data={
                                          "item_id":detail.itemId.toString(),
                                          'item_type':detail.itemType.toString(),
                                          'status':"1"
                                        };
                                        Provider.of<CartProvider>(context,listen: false).addItemQuantity(data);
                                      }),
                                  child: const Icon(
                                    EvaIcons.plus,
                                    size: 15,
                                    color: Colors.grey,
                                  )),
                              Text(detail.quantity.toString()),
                              InkWell(
                                onTap: () => setState(() {
                                  int count = detail.quantity!;
                                  count--;
                                  detail.quantity = count;
                                  var data={
                                    "item_id":detail.itemId.toString(),
                                    'item_type':detail.itemType.toString(),
                                    'status':"0"
                                  };
                                  Provider.of<CartProvider>(context,listen: false).addItemQuantity(data);
                                  if(count==0)
                                    Provider.of<CartProvider>(context,listen: false)
                                        .removeCart({'item_id':detail.itemId.toString()});
                                }),
                                child: const Icon(
                                  EvaIcons.minus,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: Urls().itemsUrl +
                                  detail.itemDetails!.img.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail.itemDetails!.enItemName.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                '\$${double.parse(detail.price!)*detail.quantity!}',
                                style: TextStyle(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.location,
                                    size: 15,
                                    color: homeHeadingColor,
                                  ),
                                  Text(
                                    detail.itemDetails?.storeDetails?.location??"",
                                    style: TextStyle(
                                        color: homeHeadingColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
