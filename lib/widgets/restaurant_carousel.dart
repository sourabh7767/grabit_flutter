import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/utils/api.dart';

import '../constants.dart';
import '../screens/vendor_profile_screen.dart';
import 'package:provider/provider.dart';

class RestaurantCarousel extends StatelessWidget {
  final String title;

  RestaurantCarousel({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brands = context.read<HomeProvider>().homeData.data?.nearByStore??[];
    final storeBaseUrl = context.read<HomeProvider>().homeData.storeBaseUrl;
    return brands.length>0? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
              color: homeHeadingColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: brands.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              var content = brands[index];
              return GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => VendorProfile(id: content.id!));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          imageUrl: storeBaseUrl! + content.logo!,
                        ),
                      ),
                    ),
                    Text(
                      content.enName!,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ):Container();
  }
}
