// import 'package:flutter/material.dart';
// import 'package:resturantapp/core/constants.dart';
// import 'package:resturantapp/view/login/login_screen.dart';
// import 'package:tbib_splash_screen/splash_screen.dart';
// import 'package:tbib_splash_screen/splash_screen_view.dart';
// class SplashScreen extends StatefulWidget {
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   bool isLoaded = false;
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 10)).then((value) => setState(() {
//       isLoaded = true;
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreenView(
//       navigateWhere: isLoaded,
//       navigateRoute:  LoginScreen(), backgroundColor: Colors.white,
//       linearGradient: const LinearGradient(
//           colors: [
//          Colors.white,
//             KPrimaryColor,
//
//           ],
//           begin: FractionalOffset(0.0, 0.0),
//           end: FractionalOffset(1.0, 0.0),
//           stops: [0.0, 1.0],
//           tileMode: TileMode.clamp),
//       text: WavyAnimatedText(
//         "Restaurant App",
//         textStyle: const TextStyle(
//           color: KSecondryColor,
//           fontSize: 32.0,
//           fontFamily: "Pacifico",
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       imageSrc: "assets/images/logo.png",
//       logoSize:300,
//
//       //  displayLoading: false,
//     );
//   }
// }