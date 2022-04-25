
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/screens/vendor_profile_screen.dart';

import '../constants.dart';
import '../data/data.dart';
import '../models/content_model.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: brands.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final Content brandList = brands[index];
              return GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) =>
                          VendorProfile(title: brandList.name, location: 'Alexandria', phone: '+20 111 562 2222'));

                },
                child: Container(
                  height: 130,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black, width: 0.1)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(brandList.imageUrl.toString()),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  brandList.name,
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
                          ),
                          SizedBox(width: 10,),
                          SizedBox(width: 10,),
                          const Icon(CupertinoIcons.forward),

                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
