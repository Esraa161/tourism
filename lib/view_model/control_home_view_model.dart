import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resturantapp/model/notification_screen.dart';
import '../view/Home/cart_view.dart';
import '../view/Home/home_view.dart';
import '../view/favourites/favourites_screen.dart';
import '../view/profile/profile_screen.dart';

class ControlHomeViewModel extends GetxController {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  List<Widget> bottomScreens = [
     HomeView(),
    CartView(),
    const FavouritesView(),
     ProfileView(),

  ];
  List<String> listOfTitles = [
    'Home',
    'Transport',
    'Hotels',
    'Profile',
  ];

  void changeSelectedIndex(int selectedIndex) {
    _currentIndex = selectedIndex;
    HapticFeedback.lightImpact();

    update();
  }
}
