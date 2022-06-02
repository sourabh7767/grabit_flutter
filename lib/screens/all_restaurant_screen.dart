import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/AllStroreModel.dart';
import 'package:grabit/providers/get_all_stores_provider.dart';
import 'package:grabit/screens/vendor_profile_screen.dart';
import 'package:grabit/utils/api.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class AllRestaurant extends StatefulWidget {
  const AllRestaurant({Key? key}) : super(key: key);

  @override
  State<AllRestaurant> createState() => _AllRestaurantState();
}

class _AllRestaurantState extends State<AllRestaurant> {
  @override
  void initState() {
    Provider.of<GetAllStoresProvider>(context, listen: false).getStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All stores'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Consumer<GetAllStoresProvider>(builder: (context, provider, child) {
        AllStoreModel? stores = provider.allStoreModel;

        if (provider.loading) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: stores.data!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              StoreData store = stores.data![index];
              return GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => VendorProfile(id: store.id!));
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
                            imageUrl: urls.storeImageUrl + store.logo!,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.enName!,
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
