import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../core/helper/database/cart_database_helper.dart';
import '../model/cart_model.dart';

class CartViewModel extends GetxController {
  void setQuantity(int index, int value) {
    double oldPrice = double.parse(_cartProductModel[index].itemPrice!);
    int oldQuantity = _cartProductModel[index].quantity;

    _cartProductModel[index].quantity = value;
    _totalPriceCart -= oldPrice * oldQuantity;
    _totalPriceCart += oldPrice * value;
    update();
  }

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartModel> _cartProductModel = [];

  List<CartModel> get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;

  double _totalPriceCart = 0.0;

  double get totalPrice {
    return _totalPriceCart ??
        0.0; // Return the private variable with a default value of 0
  }

  set totalPrice(double newTotal) {
    if (newTotal >= 0.0) {
      _totalPriceCart = newTotal;
    }
  }

  CartViewModel() {
    getCartProducts();
    getTotalPrice();
  }

  addProductToCart(CartModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        Get.snackbar('Already Exist', "Item is Already Exist in Cart",
            instantInit: true,
            padding: const EdgeInsets.all(10),
            isDismissible: true,
            colorText: CupertinoColors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: KSecondryColor.withOpacity(.9),
            animationDuration: const Duration(milliseconds: 500));

        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    Get.snackbar('Added', "Item Have Added to Cart",
        colorText: CupertinoColors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: KSecondryColor.withOpacity(.9),
        animationDuration: const Duration(milliseconds: 500));

    _totalPriceCart += (double.parse(cartProductModel.itemPrice!) *
        cartProductModel.quantity.toInt());
    update();
  }

  getCartProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getCartProducts();
    if (kDebugMode) {
      print(_cartProductModel.length);
    }
    _loading.value = false;
    getTotalPrice();
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = (_cartProductModel[index].quantity + 1);

    _totalPriceCart += (double.parse(_cartProductModel[index].itemPrice!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProductModel[index].quantity > 1) {
      _cartProductModel[index].quantity =
          (_cartProductModel[index].quantity - 1);

      _totalPriceCart -= (double.parse(_cartProductModel[index].itemPrice!));
      await dbHelper.updateProduct(_cartProductModel[index]);

      update();
    }
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPriceCart += (double.parse(_cartProductModel[i].itemPrice!) *
          _cartProductModel[i].quantity.toInt());
      if (kDebugMode) {
        print(_totalPriceCart);
      }
      update();
    }
  }

  deleteProductFromCart(String productId, int index) async {
    _totalPriceCart -= (double.parse(_cartProductModel[index].itemPrice!)) *
        _cartProductModel[index].quantity;
    await dbHelper.deleteProductFromCart(productId);
    _cartProductModel.removeWhere((product) => product.productId == productId);
    Get.snackbar('Deleted', "Item Have Deleted from Cart",
        padding: const EdgeInsets.all(10),
        colorText: CupertinoColors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: KSecondryColor.withOpacity(.9),
        animationDuration: const Duration(milliseconds: 500));

    update();
  }
}
