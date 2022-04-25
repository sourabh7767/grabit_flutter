import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/screens/search_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/categories.dart';
import '../widgets/content_list.dart';
import '../widgets/restaurant_carousel.dart';
import 'all_restaurant_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.map_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => const NotificationScreen());
              },
              child: Icon(
                Iconsax.notification,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => const SearchScreen());
                        },
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          elevation: 2,
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Iconsax.search_normal,
                                  color: priceColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Try burger. . . ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: RestaurantCarousel(
                        title: 'Brands near you', contentList: brands),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    sliver: SliverToBoxAdapter(
                      child: Categories(
                        title: 'Explore by categories',
                        contentList: categories,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ContentList(
                      title: 'Hot Right Now',
                      contentList: food,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ContentList(
                      title: 'Near me',
                      contentList: food,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 45, horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => AllRestaurant());
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
                            'View all restaurants',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
