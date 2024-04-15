import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/helper/database/cart_database_helper.dart';
import '../view/login.dart';
import 'cart_view_model.dart';

class ProfileViewModel extends GetxController {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  final CartViewModel cartViewModel = Get.find();
  var dbHelperCart = CartDatabaseHelper.db;

  Future<void> signOut() async {
    // delete user from shared prefs

    CartDatabaseHelper.clearCartDatabase();
    cartViewModel.getCartProducts();

    Get.offAll(LoginView());
  }
}
