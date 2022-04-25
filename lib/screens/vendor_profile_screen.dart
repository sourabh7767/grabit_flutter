import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../assets.dart';
import '../constants.dart';
import '../data/data.dart';
import '../widgets/content_list.dart';


class VendorProfile extends StatelessWidget {
  final String title;


  final String location;
  final String phone;
  const VendorProfile({Key? key, required this.title, required this.location, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    child: Image(
                      image: AssetImage(Assets.resCover),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${title}, ${location}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '2.6km away',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Icon(
                                Iconsax.clock,
                                size: 25,
                                color: primaryColor,
                              ),
                              Text(
                                '19:00 hrs',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Iconsax.location,
                                color: primaryColor,
                                size: 25,
                              ),
                              Text(
                                '${location}',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Iconsax.mobile,
                                size: 25,
                                color: primaryColor,
                              ),
                              Text(
                                '${phone}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ),
                        ),




                      ],
                    ),
                  ),
                ),


                SliverToBoxAdapter(
                  child: ContentList(
                    title: 'Hot Deals',
                    contentList: food,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    title: 'Pastries',
                    contentList: food,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    title: 'Pizza',
                    contentList: food,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    title: 'Bakery Items',
                    contentList: food,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
