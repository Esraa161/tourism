import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/cart_view_model.dart';
import '../constants.dart';

class SummaryListview extends StatelessWidget {
  const SummaryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
         // height: MediaQuery.of(context).size.height/1.5,
          child:ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.cartProductModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top:24.0,right: 16,left: 16),
                child: ExpansionTile(
                  collapsedIconColor: Colors.black,
                  backgroundColor: Colors.white,
                  trailing:Icon(Icons.arrow_drop_down_outlined),
                  leading: Icon(Icons.fastfood_sharp,color: KPrimaryColor,),
                  iconColor:KPrimaryColor,
                  title: Text("الوجبة ${index+1}"),
                  children: [
                  // CachedNetworkImage(
                  //             width: 140,
                  //             fit: BoxFit.cover,
                  //             imageUrl:
                  //                 controller.cartProductModel[index].productImage ?? "",
                  //             errorWidget: (context, url, error) =>
                  //                 const Icon(Icons.error),
                  //           ),

                            // Container(
                            //   clipBehavior: Clip.antiAliasWithSaveLayer,
                            //   decoration:
                            //       BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            //   child: Image(
                            //       width: 150,
                            //       height: 150,
                            //       fit: BoxFit.cover,
                            //       image: AssetImage(
                            //         controller.cartProductModel[index].productImage ?? "",
                            //       )),
                            // ),

                            const SizedBox(
                              height:10,
                            ),
                            Row(
                              children: [

                                Text(
                                  '\$${controller.cartProductModel[index].totalPrice}',
                                  style: const TextStyle(
                                      color: KPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.5),
                                ),
                                Text(
                                  '          x ${controller.cartProductModel[index].quantity}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: KTextColorBlack,
                                      fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  controller.cartProductModel[index].name ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: KSecondryColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                  ],
                  ),);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
          //Column(
          //  children: [

          // Padding(
          // padding: EdgeInsets.only(top:24.0,right: 16,left: 16),
          // child: ExpansionTile(
          //   collapsedIconColor: Colors.black,
          //   backgroundColor: Colors.white,
          //   trailing:Icon(Icons.arrow_drop_down_outlined),
          //   leading: Icon(Icons.fastfood_sharp,color: KPrimaryColor,),
          //   iconColor:KPrimaryColor,
          //   title: Text("الوجبة 1"),),),
              // ListView.separated(
              //   scrollDirection: Axis.vertical,
              //   physics: const BouncingScrollPhysics(),
              //   itemCount: controller.cartProductModel.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       width: 150,
              //       decoration: BoxDecoration(
              //           color: Colors.white, borderRadius: BorderRadius.circular(15)),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           CachedNetworkImage(
              //             width: 140,
              //             fit: BoxFit.cover,
              //             imageUrl:
              //                 controller.cartProductModel[index].productImage ?? "",
              //             errorWidget: (context, url, error) =>
              //                 const Icon(Icons.error),
              //           ),
              //
              //           // Container(
              //           //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //           //   decoration:
              //           //       BoxDecoration(borderRadius: BorderRadius.circular(5)),
              //           //   child: Image(
              //           //       width: 150,
              //           //       height: 150,
              //           //       fit: BoxFit.cover,
              //           //       image: AssetImage(
              //           //         controller.cartProductModel[index].productImage ?? "",
              //           //       )),
              //           // ),
              //           Text(
              //             controller.cartProductModel[index].name ?? "",
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 14,
              //                 color: KTextColorBlack),
              //           ),
              //           const SizedBox(
              //             height: 2,
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                 '\$${controller.cartProductModel[index].totalPrice}',
              //                 style: const TextStyle(
              //                     color: KPrimaryColor,
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 14,
              //                     height: 1.5),
              //               ),
              //               Text(
              //                 '          x ${controller.cartProductModel[index].quantity}',
              //                 style: const TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: KTextColorBlack,
              //                     fontSize: 14),
              //               )
              //             ],
              //           ),
              //           const SizedBox(
              //             height: 25,
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   separatorBuilder: (BuildContext context, int index) {
              //     return const SizedBox(
              //       width: 8,
              //     );
              //   },
              // ),
         //   ],
         // ),
        ),
      ),
    );
  }
}
