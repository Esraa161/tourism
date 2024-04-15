import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:resturantapp/view/splash/splash_view.dart';
import 'package:resturantapp/view_model/Login_Controller.dart';
import 'package:resturantapp/view_model/cart_view_model.dart';
import 'package:resturantapp/view_model/details_view_model.dart';
import 'package:resturantapp/view_model/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api_helper/api.dart';
import 'core/api_helper/cache_helper.dart';
import 'core/binding.dart';
import 'core/constants.dart';

SharedPreferences? sharedPref;

void main() async {
  runApp(const MyApp());
  sharedPref = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DioHelper.init();
  await CacheHelper.init();

  Get.put(CartViewModel());
  Get.put(DetailsViewModel());
  CacheHelper.setString("HOST", "http://148.113.1.230:2060/");
  if (CacheHelper.getString("HOST") == "") {
    CacheHelper.setString("HOST", "http://148.113.1.230:2060/");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(480, name: 'SM'),
          ResponsiveBreakpoint.autoScale(800, name: 'MD'),
          ResponsiveBreakpoint.autoScale(1000, name: 'LG'),
          ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
          ResponsiveBreakpoint.autoScale(2460, name: '2XL'),
        ],
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'jannah',
        colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
        useMaterial3: true,
      ),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
