import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grabit/models/SingleItemModel.dart';
import 'package:grabit/providers/cart_provider.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/widgets/empty_data.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ItemTap extends StatefulWidget {
  final String title;
  final String imageUrl;

  final String location;
  final String phone;
  final String meal;
  final String id;

  ItemTap(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.location,
      required this.phone,
      required this.meal,
      required this.id})
      : super(key: key);

  @override
  State<ItemTap> createState() => _ItemTapState();
}

class _ItemTapState extends State<ItemTap> {
  bool isSub = false;

  int quantity = 1;

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getItemById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 14444000 * 60;

    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
        return Consumer<HomeProvider>(builder: (context, provider, child) {
          SingleItemModel model = provider.singleItemModel;

          quantity = (model.data?.addedInCart==0?1:model.data?.addedInCart)??1;

          return Scaffold(
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: InkWell(
                onTap: () {
                  var data = {
                    'item_id': model.data!.id.toString(),
                    'item_type':'1',
                    'quantity': quantity.toString(),
                    'price': model.data!.price.toString()
                  };

                  Provider.of<CartProvider>(context,listen: false).addToCart(data).then((value){
                    if(value['success']==false){
                      return;
                    }
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: homeHeadingColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Add to cart',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      Text(
                        model.data != null
                            ? '\$${(double.parse(model.data!.discount!) * quantity)}'
                            : "",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                model.data != null
                    ? SingleChildScrollView(
                        child: Stack(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: Image.network(widget.imageUrl), fit: BoxFit.cover),
                                ),
                            child: CachedNetworkImage(
                              imageUrl: urls.itemsUrl + model.data!.img.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.34),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(50)),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        model.data!.enItemName.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(),
                                      RatingBar.builder(
                                        glowColor: Colors.black,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        glow: false,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 60),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Iconsax.clock,
                                              size: 25,
                                            ),
                                            Text(
                                              '19:00 hrs',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 5),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isSub = !isSub;
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5, horizontal: 15),
                                                  decoration: BoxDecoration(
                                                    color: isSub
                                                        ? Colors.grey
                                                        : Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                  ),
                                                  child: isSub
                                                      ? Text(
                                                          'Followed',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        )
                                                      : Text(
                                                          'Follow',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: Colors.white),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              color: homeHeadingColor,
                                              size: 25,
                                            ),
                                            Text(
                                              model.data?.storeDetails?.location??"",
                                              style: TextStyle(
                                                  color: homeHeadingColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(),
                                            const SizedBox(),
                                            const SizedBox(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Iconsax.mobile,
                                              size: 25,
                                              color: homeHeadingColor,
                                            ),
                                            Text(
                                              model.data?.storeDetails?.phone??"",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: homeHeadingColor,
                                              ),
                                            ),
                                            const SizedBox(),
                                            const SizedBox(),
                                            const SizedBox(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.meal,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: const [
                                            Text(
                                              'Description',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        model.data!.enDescription.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: const [
                                            Text(
                                              'Quantity',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  int quantity =model.data!.addedInCart!;
                                                  quantity != 1 ? quantity -- : 1;
                                                  model.data!.addedInCart=quantity;
                                                });
                                              },
                                              child: Container(
                                                child: const Icon(
                                                  Iconsax.minus,
                                                  color: Colors.white,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: homeHeadingColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              quantity.toString(),
                                              style: const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                int quantity =model.data!.addedInCart!;
                                                quantity ++;
                                                model.data!.addedInCart=quantity;
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: const Icon(
                                                  Iconsax.add,
                                                  color: Colors.white,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: homeHeadingColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'In Stock (${model.data!.stock})',
                                                  style: TextStyle(
                                                      color: homeHeadingColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'You will save \$5.23 on this',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.31,
                            right: -1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '\$${model.data!.discount}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          '\$${model.data!.price}',
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 19,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.21,
                            right: 1,
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Only ${model.data!.stock} left',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.26,
                            right: 1,
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              // child: Text('BUY BEFORE 18:00',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              child: CountdownTimer(
                                endTime: endTime,
                                widgetBuilder: (context, endTime) {
                                  return Text(
                                      'days:${endTime?.days}, hours:${endTime?.hours}, min:${endTime?.min}, sec:${endTime?.sec}');
                                },
                              ),
                            ),
                          ),
                        ]),
                      )
                    : showEmptyImage(context),
                if (provider.loading) ShowLoader(),
                if (cartProvider.loading) ShowLoader(),

              ],
            ),
          );
        });
      }
    );
  }
}
