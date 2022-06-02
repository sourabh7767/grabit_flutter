import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grabit/models/StoreDetailModel.dart';
import 'package:grabit/models/home_list_model.dart';
import 'package:grabit/providers/get_all_stores_provider.dart';
import 'package:grabit/widgets/content_list_store.dart';
import 'package:grabit/widgets/empty_data.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/data.dart';
import '../utils/api.dart';
import '../widgets/content_list.dart';

class VendorProfile extends StatefulWidget {
  final int id;

  const VendorProfile({Key? key,required this.id}) : super(key: key);

  @override
  State<VendorProfile> createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {

  @override
  void initState() {
    Provider.of<GetAllStoresProvider>(context, listen: false).getStore(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Consumer<GetAllStoresProvider>(builder: (context, provider, child) {
            if (provider.loading) {
              return ShowLoader();
            } else if (provider.storeDetailModel == null) {
              return SizedBox();
            }
            print("data  ${provider.storeDetailModel!.data}");
            return provider.storeDetailModel!.data!=null ? SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                    imageUrl: urls.storeImageUrl + (provider.storeDetailModel?.data?.logo??""),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${provider.storeDetailModel!.data!.region}, ${provider.storeDetailModel!.data!.location}',
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
                  Padding(
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
                                '${provider.storeDetailModel!.data!.location}',
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
                                '${provider.storeDetailModel!.data!.phone}',
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
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.storeDetailModel?.data?.categoryItems?.length??0,
                      itemBuilder: (context,index){
                        CategoryItems? items = provider.storeDetailModel?.data?.categoryItems![index];
                        return  ContentListStore(
                          title: items!.title.toString(),
                          contentList: items.data??[],
                        );
                      })
                ],
              ),
            ):showEmptyImage(context);
          }),
    );
  }
}
