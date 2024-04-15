import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';
import '../constants.dart';

class PopularListview extends StatelessWidget {
  PopularListview({
    super.key,
  });

  List<ProductModel> productList = [
    ProductModel(
      name: "Tour Package 1",
      productImage: "assets/images/1.jpg",
      description: "Explore exciting destinations with our guided tour package",
      size: "Small",
      price: 500,
      productId: "tour001",
    ),
    ProductModel(
      name: "Adventure Tour",
      productImage: "assets/images/2.jpg",
      description: "Embark on thrilling adventures in scenic locations",
      size: "Medium",
      price: 800,
      productId: "tour002",
    ),
    ProductModel(
      name: "Cruise Vacation",
      productImage: "assets/images/3.jpg",
      description: "Relax and enjoy a luxurious cruise with stunning views",
      size: "Medium",
      price: 1200,
      productId: "tour003",
    ),
    ProductModel(
      name: "Historical Tour",
      productImage: "assets/images/4.jpg",
      description: "Discover the rich history and culture of ancient landmarks",
      size: "Small",
      price: 600,
      productId: "tour004",
    ),
    ProductModel(
      name: "Safari Expedition",
      productImage: "assets/images/5.jpg",
      description: "Experience wildlife up close on an exciting safari adventure",
      size: "Medium",
      price: 1000,
      productId: "tour005",
    ),
    ProductModel(
      name: "Beach Getaway",
      productImage: "assets/images/6.jpg",
      description: "Relax on pristine beaches and enjoy the sun and surf",
      size: "Large",
      price: 900,
      productId: "tour006",
    ),
    ProductModel(
      name: "Mountain Retreat",
      productImage: "assets/images/7.jpg",
      description: "Escape to the mountains for a serene and peaceful retreat",
      size: "Small",
      price: 700,
      productId: "tour007",
    ),
    ProductModel(
      name: "Island Paradise",
      productImage: "assets/images/8.jpeg",
      description: "Discover paradise on beautiful tropical islands",
      size: "Medium",
      price: 950,
      productId: "tour009",
    ),
    ProductModel(
      name: "Winter Wonderland",
      productImage: "assets/images/9.jpg",
      description: "Experience the magic of winter with snowy landscapes",
      size: "Large",
      price: 850,
      productId: "tour010",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 250,
        child: GridView.builder(
          itemCount: productList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print(">>>>>>>>>>>>>>>>>>>");
                }
              //  Get.to(FoodDetailsView(productModel: productList[index]));
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: double.infinity,
                        //padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                          child: Image(
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                productList[index].productImage ?? "",
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(productList[index].name ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.7),
                                )),
                            Text(
                              productList[index].description ?? "",
                              style: const TextStyle(
                                color: KTextColorBlack,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "\$ ${productList[index].price}",
                            //       style: const TextStyle(
                            //         fontSize: 16,
                            //         color: KPrimaryColor,
                            //       ),
                            //     ),
                            //     const Spacer(),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 270),
        ),
      ),
    );
  }
}
