import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/utils/api.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../screens/category_screen.dart';

class Categories extends StatelessWidget {
  final String title;

  const Categories({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<HomeProvider>().homeData.categoryList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: homeHeadingColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Iconsax.arrow_right_3,
                color: homeHeadingColor,
              ),
            ],
          ),
        ),
        Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final content = categories[index];
                return GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CategoryScreen(
                              title: content.categoryName,
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            alignment: Alignment.center,
                            errorWidget: (c, a, b) =>
                                ColoredBox(color: Colors.black),
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                            imageUrl: urls.imageBaseUrl + content.img,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              content.categoryName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                wordSpacing: 0,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
