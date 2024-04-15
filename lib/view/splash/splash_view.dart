import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:resturantapp/view/Home/home_view.dart';
import 'package:resturantapp/view/Home/layout_view.dart';
import 'package:resturantapp/view/Restaurants/restaurants_screen.dart';
import 'package:resturantapp/view/login.dart';
import '../../../../core/constants.dart';
import '../../main.dart';

class SplashView extends StatelessWidget {
bool is1Restaurant=false;
Widget ?homeScreen;

  @override
  Widget build(BuildContext context) {
    if(is1Restaurant){
      homeScreen=LayoutView();
    }else{
      homeScreen=LayoutView();
    }
    return SafeArea(
      child: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: MediaQuery.of(context).size.width / 1.1,
        splash: Column(
          children: [
            SizedBox(
             // height: MediaQuery.of(context).size.width / 2,
             // width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  "assets/images/tourism.jpg",
                  fit: BoxFit.fill,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        nextScreen: sharedPref!.getInt("id") ==1?homeScreen!:LoginView(),
      ),
    );
  }
}
