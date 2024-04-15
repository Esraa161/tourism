import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../view/empty_cart_view.dart';
import '../../view_model/cart_view_model.dart';
import '../IconBroken.dart';
import '../constants.dart';

class CartListview extends StatelessWidget {
  const CartListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        builder: (controller) =>
        controller.cartProductModel.isNotEmpty
            ? Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.cartProductModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: IconBroken.Delete,
                      label: 'Delete',
                      onPressed: (BuildContext context) {
                        controller.deleteProductFromCart(
                            controller
                                .cartProductModel[index].productId ??
                                "",
                            index);
                      },
                    ),
                  ],
                ),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          width: 140,
                          fit: BoxFit.cover,
                          imageUrl: controller
                              .cartProductModel[index].productImage ??
                              "",
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                      .cartProductModel[index].name ??
                                      "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: KTextColorBlack),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${controller.cartProductModel[index]
                                          .totalPrice}',
                                      style: const TextStyle(
                                          color: KPrimaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          height: 1.5),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      'x ${controller.cartProductModel[index]
                                          .quantity}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: KTextColorBlack,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                // GetBuilder<CartViewModel>(
                                //   init: CartViewModel(),
                                //   builder: (controller) => Container(
                                //       height: 40,
                                //       width: 170,
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(25),
                                //           color: KPrimaryColor.withOpacity(
                                //               0.74)),
                                //       child: Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.center,
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceAround,
                                //         children: [
                                //           IconButton(
                                //               padding: EdgeInsets.zero,
                                //               onPressed: () {
                                //                 controller.decreaseQuantity(
                                //                     index);
                                //               },
                                //               icon: const Icon(
                                //                 Icons.remove,
                                //                 size: 24,
                                //               )),
                                //           Expanded(
                                //             child: TextFormField(
                                //               onChanged: (value) {
                                //                 controller.setQuantity(
                                //                     index,
                                //                     int.tryParse(value) ??
                                //                         1);
                                //               },
                                //               textAlign: TextAlign.center,
                                //               keyboardType:
                                //                   TextInputType.number,
                                //               textDirection:
                                //                   TextDirection.rtl,
                                //               style: TextStyle(
                                //                 fontSize: 13,
                                //                 fontWeight: FontWeight.w600,
                                //                 color: Colors.black
                                //                     .withOpacity(0.8),
                                //               ),
                                //               decoration: InputDecoration(
                                //                   contentPadding:
                                //                       const EdgeInsetsDirectional
                                //                           .only(top: 0),
                                //                   fillColor: Colors.black,
                                //                   hoverColor: Colors.black,
                                //                   focusColor: Colors.black,
                                //                   border: InputBorder.none,
                                //                   counterText:
                                //                       "${controller.cartProductModel[index].quantity}",
                                //                   hintText:
                                //                       "${controller.cartProductModel[index].quantity}",
                                //                   counterStyle:
                                //                       const TextStyle(
                                //                           color: Colors
                                //                               .transparent)),
                                //             ),
                                //           ),
                                //           IconButton(
                                //               padding: EdgeInsets.zero,
                                //               onPressed: () {
                                //                 controller.increaseQuantity(
                                //                     index);
                                //               },
                                //               icon: const Icon(
                                //                 Icons.add,
                                //                 size: 24,
                                //               )),
                                //         ],
                                //       )),
                                // ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 7,
              );
            },
          ),
        )
            : EmptyCartView());
  }
}
