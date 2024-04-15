import 'package:get/get.dart';

import '../view_model/Login_Controller.dart';
import '../view_model/cart_view_model.dart';
import '../view_model/category_items_view_model.dart';
import '../view_model/control_home_view_model.dart';
import '../view_model/details_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlHomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => DetailsViewModel());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => CategoryItemsViewModel());
  }
}
