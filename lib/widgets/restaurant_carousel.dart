import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/StoresModel.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../constants.dart';
import '../models/content_model.dart';
import '../screens/vendor_profile_screen.dart';

class RestaurantCarousel extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  RestaurantCarousel({Key? key, required this.title, required this.contentList})
      : super(key: key);
  List<Items> brands = [];

  Future<List<Items>> getBrands() async {
    final response = await http.get(Uri.parse(
        'https://apps-valley.net/grabit/public/api/store/1?token=fdf154db8c2be1eb3ac10ee34486ce7377001f95c357ff483737c8da334590f5'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        brands.add(Items.fromJson(i));
      }
      return brands;
    } else {
      return brands;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FutureBuilder(
          future: getBrands(),
          builder: (context, snapshot) {
          if (!snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Shimmer.fromColors(child: Container(width: double.infinity,height: 100,color: Colors.red,), baseColor: Colors.white,highlightColor: Colors.grey,),
              );
            } else {
              return Container(
                height: 150,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: brands.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final Content content = contentList[index];
                    return GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => VendorProfile(
                                title: content.name,
                                location: 'Alexandria',
                                phone: '+20 111 562 2222'));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(brands[index].img.toString()),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Text(
                            brands[index].enItemName.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
