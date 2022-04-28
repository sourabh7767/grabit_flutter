import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/item_tap.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) => ItemTap(
                        title: "notification.name",
                        imageUrl: "notification.imageUrl",
                        location: "notification.location",
                        phone: "notification.phone",
                        meal: '${"notification.meal"}',
                      ));
            },
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("notification.imageUrl"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 10),
                    child: Text(
                      '12:47 AM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${"notification.name"}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text('added a new offer near you. Tap to find out more'),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 3,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
