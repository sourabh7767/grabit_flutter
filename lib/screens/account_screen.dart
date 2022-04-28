import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:grabit/utils/storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/textfieldwidget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _gender = 1;
  final _emailTextController = TextEditingController();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _dobTextController = TextEditingController();

  @override
  void initState() {
    final user = sharedPrefs.userData;
    _emailTextController.text = user!.email;
    _firstNameTextController.text = user.firstName ?? '';
    _lastNameTextController.text = user.lastName ?? '';
    _dobTextController.text = user.dob ?? '';
    _gender = user.gender == null ? 1 : (int.tryParse(user.gender!) ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account info'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ChangeNotifierProvider(
          create: (context) => ChangeProfileProvider(),
          builder: (context, child) {
            final provider = context.watch<ChangeProfileProvider>();
            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  TextFieldWidget(
                      label: 'Email', controller: _emailTextController),
                  TextFieldWidget(
                      label: 'First Name',
                      controller: _firstNameTextController),
                  TextFieldWidget(
                      label: 'Last Name', controller: _lastNameTextController),
                  InkWell(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (c) {
                            return SizedBox(
                              height: 0.25.sh,
                              child: CupertinoDatePicker(
                                backgroundColor: Colors.white,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (dob) {
                                  _dobTextController.text =
                                      DateFormat('dd/MM/yyyy').format(dob);
                                },
                              ),
                            );
                          });
                    },
                    child: IgnorePointer(
                      child: TextFieldWidget(
                          label: 'Date of birth',
                          controller: _dobTextController),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Text('Gender(optional)'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Male',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value as int;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Female',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                            value: 2,
                            groupValue: _gender,
                            onChanged: (int? v) {
                              if (v != null) {
                                _gender = v;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 45, horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          provider.update(
                              _emailTextController.text,
                              _firstNameTextController.text,
                              _lastNameTextController.text,
                              _dobTextController.text,
                              _gender);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                              child: Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
