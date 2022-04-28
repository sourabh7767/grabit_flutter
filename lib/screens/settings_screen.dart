import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/utils/api.dart';
import 'package:grabit/utils/storage.dart';
import 'package:http/http.dart';

import '../constants.dart';
import '../widgets/settings_tile.dart';
import 'change_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value1 = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SettingsTileWidget(
                  title: 'Account info',
                ),
                const SettingsTileWidget(
                  title: 'Saved addresses',
                ),
                const SettingsTileWidget(
                  title: 'Saved cards',
                ),
                const SettingsTileWidget(
                  title: 'Change email',
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => ChangePasswordScreen()));
                  },
                  child: const SettingsTileWidget(
                    title: 'Change password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Switch(
                            value: value1,
                            onChanged: (value) {
                              setState(() {
                                value1 = value;
                              });
                            },
                            activeColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 1,
                  endIndent: 1,
                  color: Colors.grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'English',
                        style: TextStyle(color: primaryColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Country',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Egypt',
                        style: TextStyle(color: primaryColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: logout,
                        child: Text(
                          'Logout',
                          style: TextStyle(color: primaryColor, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (loading)
            Container(
              color: Colors.black12,
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }

  void logout() async {
    loading = true;
    setState(() {});
    try {
      final response = await post(Uri.parse(urls.logout), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefs.userData!.token}'
      });
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['message'] != null) {
          Fluttertoast.showToast(msg: res['message']);
        }
        if (res['success'] == true) {
          sharedPrefs.userData = null;
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      }
    } catch (e) {}
    loading = false;
    setState(() {});
  }
}
