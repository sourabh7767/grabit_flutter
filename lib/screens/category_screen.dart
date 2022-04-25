import 'package:flutter/material.dart';


import '../assets.dart';
import '../constants.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_screen_tile.dart';
class CategoryScreen extends StatelessWidget {
  final String title;
  const CategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(title),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(hint: 'Search'),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                childAspectRatio: 1.5 / 2.1,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                children: const [
                  CustomSearchTile(imageUrl: Assets.food1,),
                  CustomSearchTile(imageUrl: Assets.food2,),
                  CustomSearchTile(imageUrl: Assets.food3,),
                  CustomSearchTile(imageUrl: Assets.food4,),
                  CustomSearchTile(imageUrl: Assets.food5,),
                  CustomSearchTile(imageUrl: Assets.food3,),
                  CustomSearchTile(imageUrl: Assets.food1,),
                  CustomSearchTile(imageUrl: Assets.food2,),
                  CustomSearchTile(imageUrl: Assets.food3,),
                  CustomSearchTile(imageUrl: Assets.food4,),
                  CustomSearchTile(imageUrl: Assets.food5,),
                  CustomSearchTile(imageUrl: Assets.food3,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
