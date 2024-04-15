import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantapp/core/constants.dart';
import 'package:resturantapp/model/ItemsInCategoryModel.dart';

import '../../core/IconBroken.dart';
import '../../model/cart_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/details_view_model.dart';

class FoodDetailsView extends StatelessWidget {
  FoodDetailsView({super.key, required this.categoryItem});

  final CategoryItem categoryItem;
  String basePhoto =
      "http://148.113.1.230:2060/vansales/Emplyee/getimg?imgpath=c:\\company_data\\circle_2_test";

  @override
  Widget build(BuildContext context) {
    DetailsViewModel detailsViewModel = Get.put(DetailsViewModel());
    detailsViewModel.initialize(categoryItem);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 100,
                height: 60,
                child: Center(
                    child: GetBuilder<DetailsViewModel>(
                      init: DetailsViewModel(),
                      builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '\$',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: KPrimaryColor),
                              ),
                              Text(
                                controller.totalPrice.toString(),
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))),
            const Spacer(),
            GetBuilder<CartViewModel>(
              builder: (controller) => Container(
                width: 200,
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: KSecondryColor),
                child: MaterialButton(
                  onPressed: () {
                    controller.addProductToCart(CartModel(
                        name: categoryItem.itemname,
                        productImage: "${basePhoto}${categoryItem.itempic}",
                        quantity: detailsViewModel.quantity.value,
                        itemPrice: categoryItem.vprice.toString(),
                        productId: categoryItem.itemid.toString(),
                        totalPrice:
                            detailsViewModel.totalPrice.value.toString()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Add To Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: 30,
              ),
              child: Icon(
                IconBroken.Heart,
                color: KPrimaryColor,
              ),
              // child: Icon(
              //   Icons.favorite,
              //   size: 24,
              //   color: Colors.red,
              // ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),

              CachedNetworkImage(
                width: 180,
                fit: BoxFit.cover,
                imageUrl: "${basePhoto}${categoryItem.itempic}",
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: KPrimaryColor.withOpacity(.5),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade50),
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "\$ ",
                              style:
                                  TextStyle(color: KPrimaryColor, fontSize: 16),
                            ),
                            Text(
                              '${categoryItem.vprice} ',
                              style: const TextStyle(
                                  fontSize: 16, color: KSecondryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  const Spacer(),
                  GetBuilder<DetailsViewModel>(
                    init: DetailsViewModel(),
                    builder: (controller) {
                      TextEditingController counterController =
                      TextEditingController(
                          text: controller.quantity.value.toString());

                      return Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: KPrimaryColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    controller.decrementQuantity();
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 24,
                                  )),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                    controller
                                        .setQuantity(int.tryParse(value) ?? 1);
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsetsDirectional.only(
                                          top: 100),
                                      fillColor: Colors.black,
                                      hoverColor: Colors.black,
                                      focusColor: Colors.black,
                                      border: InputBorder.none,
                                      counterText: "${controller.quantity}",
                                      hintText: "${controller.quantity}",
                                      counterStyle: const TextStyle(
                                          color: Colors.transparent)),
                                ),
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    controller.incrementQuantity();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24,
                                  )),
                            ],
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    categoryItem.itemname ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8)),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.timer_outlined,
                    color: KPrimaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("10-15 Mins")
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ExpandableText(
                categoryItem.itemtypename ?? "",
                expandText: 'show more',
                collapseText: 'show less',
                linkColor: KPrimaryColor,
                maxLines: 3,
                style: const TextStyle(
                    fontSize: 14, color: Colors.grey, letterSpacing: 0.5),
              ),
              const SizedBox(
                height: 80,
              ),
              // RatingBar(
              //   updateOnDrag: true,
              //   itemSize: 30,
              //   glowRadius: 5,
              //   initialRating: 3,
              //   direction: Axis.horizontal,
              //   allowHalfRating: false,
              //   itemCount: 5,
              //   ratingWidget: RatingWidget(
              //     full: const Image(
              //       image: AssetImage(
              //         "assets/images/full_heart.png",
              //       ),
              //       color: KPrimaryColor,
              //     ),
              //     half: const Image(
              //       image: AssetImage("assets/images/half_heart.png"),
              //       color: KPrimaryColor,
              //     ),
              //     empty: const Image(
              //       image: AssetImage("assets/images/empty_heart.png"),
              //       color: KPrimaryColor,
              //     ),
              //   ),
              //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              //   onRatingUpdate: (rating) {
              //     print(rating);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
