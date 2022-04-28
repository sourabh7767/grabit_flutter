import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/providers/get_all_stores_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/data.dart';
import '../utils/api.dart';
import '../widgets/content_list.dart';

class VendorProfile extends StatelessWidget {
  final StoreModel store;
  const VendorProfile({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: ChangeNotifierProvider(
          create: (context) => GetAllStoresProvider()..getStore(store.id),
          builder: (context, child) {
            final GetAllStoresProvider provider = context.watch();
            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (provider.storeDetail == null) {
              return SizedBox();
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CachedNetworkImage(
                    imageUrl: urls.storeImageUrl + store.logo,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    fit: BoxFit.cover,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${store.region}, ${store.location}',
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
                            children: [
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
                                '${store.location}',
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
                                '${store.phone}',
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
            );
          }),
    );
  }
}
