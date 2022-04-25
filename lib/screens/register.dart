import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required String param_homepage})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      body: ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
          builder: (context, child) {
            if (context.read<RegisterProvider>().userSignupSuccess) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacementNamed(context, '/otp_screen');
              });
            }

            if (context.watch<RegisterProvider>().loading) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Image.asset(
                          Assets.logo,
                          height: 150,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Sign Up With',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                  height: 2.5,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: TextField(
                                  controller: usernameTextController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    labelText: 'Username',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    prefixIcon: const Icon(
                                      Iconsax.user,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    floatingLabelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 10, bottom: 10),
                                child: TextField(
                                  controller: passwordTextController,
                                  obscureText: _isObscure,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off
                                            : Iconsax.eye,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    prefixIcon: const Icon(
                                      Iconsax.key,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    floatingLabelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 10, bottom: 10),
                                child: TextField(
                                  controller: emailTextController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    floatingLabelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 10, bottom: 10),
                                child: TextField(
                                  controller: phoneTextController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    labelText: 'Phone',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    prefixIcon: const Icon(
                                      Iconsax.mobile,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    floatingLabelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<RegisterProvider>().register(
                                      usernameTextController.text,
                                      passwordTextController.text,
                                      emailTextController.text,
                                      phoneTextController.text);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 40,
                                    width: 270,
                                    decoration: BoxDecoration(
                                      color: homeHeadingColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already a member ? ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/');
                                      },
                                      child: const Text(
                                        'SignIn',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
