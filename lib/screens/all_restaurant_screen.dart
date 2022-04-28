import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/providers/get_all_stores_provider.dart';
import 'package:grabit/screens/vendor_profile_screen.dart';
import 'package:grabit/utils/api.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class AllRestaurant extends StatelessWidget {
  const AllRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All stores'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ChangeNotifierProvider(
          create: (c) => GetAllStoresProvider()..getStores(),
          builder: (context, child) {
            final GetAllStoresProvider provider = context.watch();
            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: provider.stores.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final store = provider.stores[index];
                  return GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => VendorProfile(store: store));
                    },
                    child: Container(
                      height: 130,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Colors.black, width: 0.1)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                                imageUrl: urls.storeImageUrl + store.logo,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store.enName,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Fast food, sandwiches , international',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              const Icon(CupertinoIcons.forward),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
