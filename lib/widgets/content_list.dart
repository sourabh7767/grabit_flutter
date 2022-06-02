import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/screens/hot_right_now_detail_screen.dart';
import 'package:grabit/utils/api.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/content_model.dart';
import '../screens/item_tap.dart';

class ContentList extends StatefulWidget {
  final String title;
  final String isFrom;
  final List<Content> contentList;

  ContentList({
    required this.isFrom,
    Key? key,
    required this.title,

    required this.contentList,

  }) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    final hotDeal = context.watch<HomeProvider>().homeData.data?.hotDeal??[];
    // final itemBaseUrl = context.read<HomeProvider>().homeData.itemBaseUrl;
    // final contentList = context.read<HomeProvider>().homeData.hotDeal;
    return hotDeal.length>0?Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: homeHeadingColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  color: homeHeadingColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 175,
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: hotDeal.length,
                itemBuilder: (BuildContext context, int index) {
                  final HotDeal content = hotDeal[index];
                  return GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>widget.isFrom.isNotEmpty&&widget.isFrom=='hot_right'?HotRightNowScreen(
                            title: content.bundleName!,
                            location: "",
                            imageUrl:urls.notiImageUrl+ content.img.toString(),
                            phone: "123456789",
                            meal: "",
                            id: content.id.toString(),
                          ): ItemTap(
                                title: content.bundleName!,
                                location: "",
                                imageUrl:urls.notiImageUrl+ content.img.toString(),
                                phone: "content.phone.toString()",
                                meal: "content.meal.toString()",
                            id: content.id.toString(),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PhysicalModel(
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        child: SizedBox(
                          height: 120,
                          width: 320,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          urls.itemsUrl + content.img.toString()),
                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.centerLeft),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        content.bundleName!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        content.bundleName!,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Iconsax.location5,
                                            color: Colors.grey,
                                            size: 15,
                                          ),
                                          Text(
                                            content.storeDetails?.location??"",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${content.price.toString()}',
                                        style: TextStyle(
                                            color: priceColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 13),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${content.totalAfterDiscount.toString()}',
                                            style: TextStyle(
                                                color: priceColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 25),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isfav = !isfav;
                                              });
                                            },
                                            icon: isfav
                                                ? Icon(
                                                    FontAwesomeIcons.solidHeart,
                                                    color: priceColor,
                                                  )
                                                : Icon(
                                                    FontAwesomeIcons.heart,
                                                    color: priceColor,
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ):Container();
  }
}
