import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants.dart';
import '../data/data.dart';
import '../models/content_model.dart';
import 'deal_screen.dart';
import 'item_tap.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(

            padding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: food.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = food[index];
              return GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) =>
                          DealScreen(title: content.name,location:content.location.toString() ,phone:content.phone.toString() ,));



                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    child: SizedBox(
                      height: 120,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                  AssetImage(content.imageUrl.toString()),
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.centerLeft),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(

                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    content.name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    'added a new deal',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  Text(
                                    '10 pcs remaining',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  ),


                                  Text(
                                    '3 days remaining',
                                    style: TextStyle(
                                        color: priceColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),

    );
  }
}
