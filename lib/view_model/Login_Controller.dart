import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantapp/core/extentions.dart';
import 'package:resturantapp/view/Home/home_view.dart';

import '../core/api.dart';
import '../core/api_helper/api.dart';
import '../core/api_helper/cache_helper.dart';
import '../main.dart';
import '../model/login_model.dart';
import '../view/Home/layout_view.dart';
import '../view/Restaurants/restaurants_screen.dart';

class LoginController extends GetxController {
  final Dio _dio = Dio();
  final email = ''.obs;
  final password = ''.obs;
  int? StatusCode;
  String? msg;
  var isLoading = false.obs;

  final Error = ''.obs;

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  late LoginModel loginModel;

  Future<void> login() async {
    try {
      isLoading(true);
      print(">>>>>>>>>>>>>>>>>>>>");
      print(isLoading.value);
      Dio dio = ApiConstants.get();
      await dio.post( 'VanSales/Users/authenticate', data: {
        "name": email.value,
        "password": password.value,
      }).then((value) {
        StatusCode = value.statusCode;
        if (value.statusCode == 200) {
          isLoading(false);
          print(isLoading.value);
          sharedPref!.setInt("id",1);
          Get.offAll( LayoutView());
          loginModel = LoginModel.fromJson(value.data);
          print("Setting Start>>>>>>>>>>>>>>>>>>>>>");

          CacheHelper.setString("userid", loginModel.userproperty![0].userid);
          CacheHelper.setCompanyPath(
              loginModel.userproperty![0].compenypath.checkNull());
          CacheHelper.setString(
              "userName", loginModel.userproperty![0].username);
          CacheHelper.setString(CustomerHelper.USER_NAME,
              loginModel.userproperty![0].userName.toString());

          CacheHelper.setString(CustomerHelper.YEAR,
              loginModel.userproperty![0].uyear.toString());
          if (loginModel.settings![0].automaticpoststock != null) {
            CacheHelper.setBool(CustomerHelper.AUTOMATIC_POIST_STOCK,
                loginModel.settings![0].automaticpoststock);
          }
          if (loginModel.settings![0].automaticpostacc != null) {
            CacheHelper.setBool(CustomerHelper.AUTOMATIC_POIST_ACC,
                loginModel.settings![0].automaticpostacc);
          }
          if (loginModel.settings![0].showpayinmobcash != null) {
            CacheHelper.setBool(CustomerHelper.SHOW_PAY_IN_MOB_CASH,
                loginModel.settings![0].showpayinmobcash);
          }
          print("Setting ends >>>>>>>>>>>>>>>>>>>>>");

          print(value.data);
          Get.snackbar('نجاح', "تم تسجيل الدخول بنجاح",
              padding: const EdgeInsets.all(10),
              colorText: CupertinoColors.white,
              // snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(.9),
              animationDuration: const Duration(milliseconds: 500));
        }
        update();
      }).catchError((error) {
        print(error.toString());
        isLoading(false);
        print(isLoading.value);
        Get.snackbar('خطا', "اسم المستخدم او كلمه المرور خاطئه",
            padding: const EdgeInsets.all(10),
            colorText: CupertinoColors.white,
            // snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(.9),
            animationDuration: const Duration(milliseconds: 500));
      });
    } catch (error) {
      isLoading(false);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(isLoading.value);
      Error('An error occurred. Please try again.');
      print('Login failed: $error');
    }
  }
}
