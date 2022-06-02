import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/screens/search_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/categories.dart';
import '../widgets/content_list.dart';
import '../widgets/content_list_near_by_me.dart';
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
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
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
        child: Consumer<HomeProvider>(builder: (context, provider, child) {

              return Stack(
                children: [
                  CustomScrollView(
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
                          child: RestaurantCarousel(title: 'Brands near you')),
                      const SliverPadding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10),
                        sliver: SliverToBoxAdapter(
                          child: Categories(title: 'Explore by categories'),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ContentList(
                          title: 'Hot Right Now',
                          contentList: food,
                          isFrom: 'hot_right',
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ContentListNearByMe(
                          title: 'Near me',
                          // contentList: nearByMe,
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
                  if (provider.loading) HomeLoader()
                ],
              );
            }),
      ),
    );
  }
}

class HomeLoader extends StatelessWidget {
  const HomeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 30),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      )),
    );
  }
}
