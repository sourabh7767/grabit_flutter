import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/textfieldwidget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passTextController = TextEditingController();
  var viewPass = false;
  final _newPassTextController = TextEditingController();
  var viewNewPass = false;
  final _confirmNewPassTextController = TextEditingController();
  var viewConfirmNewPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
          create: (context) => ChangepasswordProvider(),
          builder: (context, child) {
            final provider = context.watch<ChangepasswordProvider>();

            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextFieldWidget(
                    label: 'Password',
                    controller: _passTextController,
                    obscureText: !viewPass,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewPass = !viewPass;
                          setState(() {});
                        },
                        icon: Icon(
                          viewPass ? Icons.visibility_off : Icons.visibility,
                          color: primaryColor,
                        )),
                  ),
                  TextFieldWidget(
                    label: 'New Password',
                    controller: _newPassTextController,
                    obscureText: !viewNewPass,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewNewPass = !viewNewPass;
                          setState(() {});
                        },
                        icon: Icon(
                          viewNewPass ? Icons.visibility_off : Icons.visibility,
                          color: primaryColor,
                        )),
                  ),
                  TextFieldWidget(
                    label: 'Confirm New Password',
                    controller: _confirmNewPassTextController,
                    obscureText: !viewConfirmNewPass,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewConfirmNewPass = !viewConfirmNewPass;
                          setState(() {});
                        },
                        icon: Icon(
                          viewConfirmNewPass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primaryColor,
                        )),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 45, horizontal: 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (_newPassTextController.text !=
                              _confirmNewPassTextController.text) {
                            Fluttertoast.showToast(
                                msg:
                                    'Confirm password does not match with new password');
                          } else {
                            final success = await provider.change(
                                _passTextController.text,
                                _newPassTextController.text);
                            if (success) {
                              Navigator.pop(context);
                            }
                          }
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
