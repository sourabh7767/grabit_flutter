import 'package:flutter/material.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String param_homepage}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isObscure = true;
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      body: ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          builder: (context, child) {
            if (context.read<LoginProvider>().loggedIn) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/second', (route) => false);
              });
            }
            if (context.watch<LoginProvider>().loading) {
              return Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new CircularProgressIndicator(),
                      SizedBox(width: 20),
                      new Text("Signing you in"),
                    ],
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Image.asset(
                        Assets.logo,
                        height: 150,
                      ),
                      Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Sign In With',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                                height: 2.5,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: userTextController,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(0.0),
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        floatingLabelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 15),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 5) {
                                            return 'Password is too short';
                                          }
                                          return null;
                                        },
                                        controller: passwordTextController,
                                        obscureText: _isObscure,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          floatingLabelStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                  'Forgot Password ?')),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<LoginProvider>().login(
                                            userTextController.text,
                                            passwordTextController.text);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: homeHeadingColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Not a member ? ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                      child: const Text(
                                        'Signup',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Offstage(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 25.0, right: 15.0),
                                        child: const Divider(
                                          color: Colors.black,
                                          height: 50,
                                        )),
                                  ),
                                  const Text("OR"),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15.0, right: 25.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Offstage(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4286F5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(Assets.google),
                                        Text(
                                          'Continue with Google',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Offstage(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(Assets.fb),
                                      Text(
                                        'Continue with Facebook',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
