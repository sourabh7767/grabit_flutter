import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grabit/constants.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/screens/item_tap.dart';
import 'package:grabit/utils/api.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';

class ContentListNearByMe extends StatefulWidget {
  final String title;
  // final List<NearByMe> contentList;


  ContentListNearByMe({
    Key? key,
    required this.title,
    //required this.contentList,
  }) : super(key: key);

  @override
  State<ContentListNearByMe> createState() => _ContentListNearByMeState();
}

class _ContentListNearByMeState extends State<ContentListNearByMe> {
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    final itemBaseUrl = context.read<HomeProvider>().homeData.itemBaseUrl;
    final contentList = context.read<HomeProvider>().homeData.data?.nearByMe??[];

    print(contentList.length.toString()+" testinkd;s");
    return contentList.length>0? Padding(
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
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  var content = contentList[index];
                  return GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => ItemTap(
                                title: content.enItemName!,
                                location: '',
                                imageUrl: urls.itemsUrl+ content.img!,
                                phone: '123456789',
                                meal: 'Meal',
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
                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         itemBaseUrl + content.img),
                                  //
                                  //     alignment: Alignment.centerLeft),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                      imageUrl: itemBaseUrl! + content.img!,
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
                                        content.enItemName!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        content.enDescription!,
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
                                            content.storeDetails?.location.toString()??"",
                                            // content.location.toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      // if (content.priceTimeOut!.isNotEmpty)
                                      //   Text(
                                      //     '\$${content.priceTimeOut}',
                                      //     style: TextStyle(
                                      //         color: priceColor,
                                      //         decoration:
                                      //             TextDecoration.lineThrough,
                                      //         fontSize: 13),
                                      //   ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${content.price}',
                                            // '\$95',
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
