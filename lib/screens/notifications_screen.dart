import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/models/notifications_model.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/utils/storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'deal_screen.dart';

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
      body: ChangeNotifierProvider(
          create: (context) => NotificationsProvider()..getNotifications(),
          builder: (context, child) {
            final provider = context.watch<NotificationsProvider>();

            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: provider.notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  final content = provider.notifications[index];
                  print(content.notificationData);
                  return GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => DealScreen(
                                title: content.message,
                                location: "location",
                                phone: "Phone",
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtRGUPUbIp17EKvv3qbyHRDckf0N61k_6fwg&usqp=CAU',
                                  height: 150,
                                  width: 150,
                                  errorWidget: (c, a, b) =>
                                      ColoredBox(color: Colors.grey.shade500),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        content.notificationData['bundle_name'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        content.message,
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
                });
          }),
    );
  }
}

class NotificationsProvider with ChangeNotifier {
  var loading = false;
  var notifications = <NotificationModel>[];
  void getNotifications() async {
    loading = true;
    notifyListeners();

    try {
      final response = await get(Uri.parse(urls.getNotifications), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefs.userData?.token}'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final List notis = responseData['data'];
        this.notifications =
            notis.map((e) => NotificationModel.fromJson(e)).toList();
      } else {
        final responseData = json.decode(response.body);
        final Map errorMap =
            responseData['error'] ?? responseData['errors'] ?? {};

        var errr = <String>[];
        for (var value in errorMap.values) {
          if (value is List) {
            errr.add(value.first.toString());
          }
        }
        Fluttertoast.showToast(msg: errr.join(", "));
      }
    } catch (e) {}
    loading = false;
    notifyListeners();
  }
}
