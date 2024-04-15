// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../core/constants.dart';
// import '../../core/widgets/custom_text_form_field.dart';
// import '../../view_model/checkout_view_model.dart';
//
// class AddressView extends StatelessWidget {
//   const AddressView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CheckoutViewModel>(
//       init: CheckoutViewModel(),
//       builder: (controller) => SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Form(
//             key: controller.formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Text(
//                     'Default Address',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey.shade700),
//                   ),
//                 ),
//                 Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                       //  color: KPrimaryColor,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: KPrimaryColor)),
//                   child: const SizedBox(
//                     height: 40,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         // Icon(
//                         //   Icons.radio_button_checked_sharp,
//                         //   color: KPrimaryColor,
//                         //   size: 22,
//                         // ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'The default address ',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Text(
//                     'New Address',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey.shade700),
//                   ),
//                 ),
//                 Container(
//                   height: 600,
//                   decoration: BoxDecoration(
//                       //  color: KPrimaryColor,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: KPrimaryColor)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 20),
//                     child: Column(
//                       children: [
//                         CustomTextFormField1(
//                           text: 'Floor ',
//                           //  hint: '21, Alex Davidson Avenue',
//                           onSave: (value) {
//                             controller.street1 = value;
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please Enter floor";
//                             }
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         CustomTextFormField1(
//                           text: 'Building No ',
//                           //  hint: '21, Alex Davidson Avenue',
//                           onSave: (value) {
//                             controller.street1 = value;
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please Enter floor";
//                             }
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         CustomTextFormField1(
//                           text: 'Street ',
//                           //  hint: '21, Alex Davidson Avenue',
//                           onSave: (value) {
//                             controller.street1 = value;
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please Enter Street 1";
//                             }
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         CustomTextFormField1(
//                           text: 'City',
//                           //  hint: 'Victoria Island',
//                           onSave: (value) {
//                             controller.city = value;
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please Enter City";
//                             }
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../core/enum.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../view_model/checkout_view_model.dart';

class AddressView extends GetView<CheckoutViewModel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Obx(() => RadioListTile<Address>(
                    activeColor: KPrimaryColor,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => KPrimaryColor),
                    value: Address.DefaultAddress,
                    groupValue: controller.addresss.value,
                    onChanged: (Address? value) {
                      controller.updateAddress(
                        Address.DefaultAddress,
                      );
                    },
                    title: const Text(
                      "Default Address",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            controller.defaultAddress ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              color: KTextColorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Obx(() =>
                  RadioListTile<Address>(
                    fillColor: MaterialStateColor.resolveWith(
                            (states) => KPrimaryColor),
                    value: Address.DifferentAddress,
                    groupValue: controller.addresss.value,
                    onChanged: (Address? value) {
                      controller.updateAddress(Address.DifferentAddress);
                    },
                    title: const Text(
                      "Different Address",
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: CustomTextFormField1(
                      text: '',
                      onSave: (value) {
                        controller.newAddress = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Address";
                        }
                      },
                      hint: 'Enter the new Address',
                    ),
                    activeColor: KPrimaryColor,
                    autofocus: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
