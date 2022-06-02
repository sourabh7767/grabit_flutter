import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabit/providers/auth_provider.dart';
import 'package:grabit/providers/cart_provider.dart';
import 'package:grabit/providers/get_all_stores_provider.dart';
import 'package:grabit/providers/home_provider.dart';
import 'package:grabit/screens/login.dart';
import 'package:grabit/screens/nav_screen.dart';
import 'package:grabit/screens/otp_screen.dart';
import 'package:grabit/screens/screens.dart';
import 'package:grabit/utils/push_notifications.dart';
import 'package:grabit/utils/storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'providers/order_provider.dart';

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
        providers: providers,
        child: MaterialApp(
          initialRoute: '/splash',
          routes: {
            '/': (context) => const LoginPage(param_homepage: 'LogIn Page'),
            '/register': (context) =>
                const RegisterPage(param_homepage: 'Register Page'),
            '/otp_screen': (context) => const OtpScreen(),
            '/second': (context) => const NavScreen(),
            '/splash': (context) => const SplashScreen(),
          },
          // home: SplashScreen(),
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

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<RegisterProvider>(create: (_) => RegisterProvider()),
    ChangeNotifierProvider<GetAllStoresProvider>(
        create: (_) => GetAllStoresProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
  ];
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      print(sharedPrefs.userData);
      if (sharedPrefs.userData != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage(param_homepage: 'LogIn Page')),
                (route) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/icon.png',
          width: MediaQuery.of(context).size.width / 1.8,
        ),
      ),
    );
  }
}
