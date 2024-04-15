// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../view/checkout/address_view.dart';
// import '../view/checkout/confirm_view.dart';
//
// class CheckoutViewModel extends GetxController {
//   double progress = 0.2;
//   var activeStep = 0.obs;
//   var selectedPagexNumber = 0.obs;
//
//   bool get isLastPage => selectedPagexNumber.value == pages.length - 1;
//
//   bool get isFirstPage => selectedPagexNumber.value == 0;
//   String? defaultAddress = '12 شارع هارون من ميدان الدقى الجيزة';
//   String? newAddress;
//
//   final formKey = GlobalKey<FormState>();
//
//   // change both index
//   void changeStepperAndPageviewIndex(int index) {
//     if (index == 0) {
//       selectedPagexNumber.value = 0;
//       activeStep.value = index;
//     } else if (index == 1) {
//       formKey.currentState?.save();
//       if (formKey.currentState!.validate()) {
//         selectedPagexNumber.value = 1;
//         activeStep.value = index;
//       }
//     }
//     // change stepper index
//
//     print('stepper index :<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');
//
//     print(activeStep);
//   }
//
//   // for next button
//   forwardAct() {
//     if (selectedPagexNumber == 0) {
//       formKey.currentState?.save();
//
//       if (formKey.currentState!.validate()) {
//         selectedPagexNumber.value += 1;
//         changeStepperAndPageviewIndex(selectedPagexNumber.value);
//       }
//     } else if (selectedPagexNumber == 1) {}
//   }
//
//   // for back button
//   backAct() {
//     if (selectedPagexNumber == 1) {
//       selectedPagexNumber.value -= 1;
//       changeStepperAndPageviewIndex(selectedPagexNumber.value);
//     }
//   }
//
//   List<Widget> pages = [
//     AddressView(),
//     const SummaryView(),
//   ];
// }

///////////////////////////////////////////////

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/enum.dart';
import '../view/checkout/address_view.dart';
import '../view/checkout/confirm_view.dart';

class CheckoutViewModel extends GetxController {
  double progress = 0.2;
  var activeStep = 0.obs;
  var selectedPagexNumber = 0.obs;

  bool get isLastPage => selectedPagexNumber.value == pages.length - 1;

  bool get isFirstPage => selectedPagexNumber.value == 0;

  final formKey = GlobalKey<FormState>();

  // change both index
  void changeStepperAndPageviewIndex(int index) {
    if (index == 0) {
      selectedPagexNumber.value = 0;
      activeStep.value = index;
    } else if (index == 1) {
      if (addresss.value == Address.DifferentAddress) {
        formKey.currentState?.save();
        if (formKey.currentState!.validate()) {
          selectedPagexNumber.value = 1;
          activeStep.value = index;
        }
      } else if (addresss.value == Address.DefaultAddress) {
        selectedPagexNumber.value = 1;
        activeStep.value = index;
      }
    }
    // change stepper index
    print('stepper index : $activeStep');
  }

  Rx<Address> addresss = Address.DefaultAddress.obs;
  String? defaultAddress = '12 شارع هارون من ميدان الدقى الجيزة';

  String? theAddress = '12 شارع هارون من ميدان الدقى الجيزة';
  String? newAddress;

  void updateAddress(Address address) {
    addresss.value = address;
    if (address == Address.DefaultAddress) {
      theAddress = defaultAddress;
      update();
    } else if (address == Address.DifferentAddress) {
      formKey.currentState?.save();
      if (true) {
        theAddress = newAddress;
      }

      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      print(theAddress);
      print(newAddress);
      update();
    }
    update();
  }

  // for next button
  void forwardAct() {
    if (selectedPagexNumber.value == 0) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(selectedPagexNumber.value);
      if (addresss.value == Address.DifferentAddress) {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        print(addresss.value);
        formKey.currentState?.save();
        if (formKey.currentState!.validate()) {
          selectedPagexNumber.value += 1;
          changeStepperAndPageviewIndex(selectedPagexNumber.value);
        }
      } else if (addresss.value == Address.DefaultAddress) {
        selectedPagexNumber.value += 1;
        changeStepperAndPageviewIndex(selectedPagexNumber.value);
      }
    } else if (selectedPagexNumber.value == 1) {}
  }

  // for back button
  void backAct() {
    if (selectedPagexNumber.value == 1) {
      selectedPagexNumber.value -= 1;
      changeStepperAndPageviewIndex(selectedPagexNumber.value);
    }
  }

  List<Widget> pages = [
    AddressView(),
     SummaryView(),
  ];
}
