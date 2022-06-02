import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grabit/models/StoreDetailModel.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/utils/api.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/content_model.dart';
import '../screens/item_tap.dart';

class ContentListStore extends StatefulWidget {
  final String title;
  final List<CategoryItemsData> contentList;

  ContentListStore({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  State<ContentListStore> createState() => _ContentListState();
}

class _ContentListState extends State<ContentListStore> {
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    // final itemBaseUrl = context.read<HomeProvider>().homeData.itemBaseUrl;
    // final contentList = context.read<HomeProvider>().homeData.hotDeal;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
            child:widget.contentList.length>0? ListView.builder(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final CategoryItemsData content = widget.contentList[index];
                  return GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => ItemTap(
                            title: content.enItemName??'',
                            location: "",
                            imageUrl:urls.notiImageUrl+ content.img.toString(),
                            phone: "123456789",
                            meal: "Meal",
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
                                        content.enItemName??"",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        content.enItemName??"",
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
                                            "",
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
                                            '\$${content.discount.toString()}',
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
                }):Center(child: Text('No Data Found'),),
          ),
        ],
      ),
    );
  }
}
