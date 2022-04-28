import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:grabit/screens/otp_screen.dart';
import 'package:grabit/screens/register.dart';
import 'package:grabit/utils/push_notifications.dart';
import 'package:grabit/utils/storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'screens/login.dart';
import 'screens/nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = SharedPrefs(await SharedPreferences.getInstance());
  runApp(MyApp());
  var pushNotificationManager = PushNotificationsManager();
  pushNotificationManager.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1D437C),
      ),
    );
    return ScreenUtilInit(builder: (_) {
      return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: RegisterProvider())],
        child: MaterialApp(
          initialRoute: sharedPrefs.userData == null ? '/' : '/second',
          routes: {
            '/': (context) => const LoginPage(param_homepage: 'LogIn Page'),
            '/register': (context) =>
                const RegisterPage(param_homepage: 'Register Page'),
            '/otp_screen': (context) => const OtpScreen(),
            '/second': (context) => const NavScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: scaffoldbgColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
        ),
      );
    });
  }
}
