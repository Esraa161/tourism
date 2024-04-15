import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:resturantapp/model/ItemsInCategoryModel.dart';

class DetailsViewModel extends GetxController {
  RxInt quantity = RxInt(1);
  RxDouble totalPrice = RxDouble(0);
  double itemPrice = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void initialize(CategoryItem categoryItem) {
    itemPrice = double.parse(categoryItem.vprice.toString());
    totalPrice.value = itemPrice;
    quantity.value = 1;
  }

  void incrementQuantity() {
    quantity.value++;
    totalPrice.value += itemPrice;
    update();
  }

  void decrementQuantity() {
    if (quantity.value <= 1) {
      print("null");
    } else {
      quantity.value--;
      totalPrice.value -= itemPrice;
    }
    update();
  }

  void setQuantity(int value) {
    quantity.value = value;
    totalPrice.value = itemPrice * value;
    update();
  }
}
