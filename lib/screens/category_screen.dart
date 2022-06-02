import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/CategoryListModel.dart';
import 'package:grabit/providers/cart_provider.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/widgets/show_loader.dart';
import 'package:provider/provider.dart';


import '../assets.dart';
import '../constants.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_screen_tile.dart';
class CategoryScreen extends StatefulWidget {
  final String title;
  final String id;
  const CategoryScreen({Key? key, required this.title,required this.id}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).getCategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,

      ),
      body: SafeArea(
        child: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
            return Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  CategoryListModel model =provider.categoryListModel;
                return provider.loading?ShowLoader(): Stack(
                  children: [
                    Column(
                      children: [
                        CustomSearchBar(hint: 'Search'),
                        Expanded(
                          child:model.data!.length>0? GridView.count(
                            padding: const EdgeInsets.all(20),
                            childAspectRatio: 1.5 / 2.1,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            scrollDirection: Axis.vertical,
                             children: List.generate(model.data!.length, (index) {
                               CategoryData data = model.data![index];
                            return _categoryItems(data);
                          }),
                          ):Center(child: Image.asset('assets/images/ic_empty_box.png',height: 100,),),
                        ),
                      ],
                    ),
                   cartProvider.loading? ShowLoader():Container()
                  ],
                );
              }
            );
          }
        ),
      ),
    );
  }

  Widget _categoryItems(CategoryData data){
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 200,
          height: 80,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            // image: DecorationImage(
            //     image: AssetImage(imageUrl),
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.topCenter),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: urls.itemsUrl + data.img.toString(),
          ),
        ),
        Container(
          width: 250,
          margin: const EdgeInsets.only(top: 90),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  data.enItemName.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  data.enDescription.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  glowColor: Colors.black,
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 4,
                  itemSize: 15,
                  glow: false,
                  itemPadding: const EdgeInsets.symmetric(
                      horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),

              ],
            ),
          ),
        ),
        Positioned(
          top: 50,

          right: 1,
          child: Container(
            height: 25,
            width: 70,
            decoration: BoxDecoration(
              color:
              const Color(0xFF5E4311).withOpacity(0.5),
            ),
            child:  Center(
              child: Text(
                '\$${data.price.toString()}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: (){
              var body = {
                'item_id':data.id.toString(),
                'quantity':'1',
                'item_type':'1',
                'price':data.price.toString()
              };
              if(data.addedInCart==0)
                Provider.of<CartProvider>(context,listen: false).addToCart(body);
              else Fluttertoast.showToast(msg: "Item already added in cart");
data.addedInCart =1;
setState(() {

});
              },
            child: Container(
              height: 30,
              width: 200,
              color: primaryColor,
              child:  Center(
                  child: Text(
                    data.addedInCart==0?'Add to cart':'Added',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
