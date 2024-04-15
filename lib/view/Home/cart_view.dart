import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/IconBroken.dart';
import '../../core/constants.dart';
import '../../core/widgets/cart_listview.dart';
import '../../model/product_model.dart';
import '../../view_model/cart_view_model.dart';
import '../checkout/checkout_view.dart';
import '../empty_cart_view.dart';

class CartView extends StatefulWidget {

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<ProductModel> transportProductList = [
    ProductModel(
      name: "Luxury Sedan",
      productImage: "assets/images/car.jpg",
      description: "Travel in style with our luxurious sedan service",
      size: "Standard",
      price: 100,
      productId: "transport001",
    ),
    ProductModel(
      name: "SUV Shuttle",
      productImage: "assets/images/car.jpg",
      description: "Comfortable SUV shuttle for group transportation",
      size: "Group",
      price: 150,
      productId: "transport002",
    ),
    ProductModel(
      name: "Private Jet Charter",
      productImage: "assets/images/car.jpg",
      description: "Experience luxury travel with a private jet charter",
      size: "VIP",
      price: 1000,
      productId: "transport003",
    ),
    ProductModel(
      name: "City Taxi",
      productImage: "assets/images/car.jpg",
      description: "Quick and convenient city taxi service",
      size: "Individual",
      price: 30,
      productId: "transport004",
    ),
    ProductModel(
      name: "Classic Car Rental",
      productImage: "assets/images/car.jpg",
      description: "Rent a classic car for a nostalgic journey",
      size: "Individual",
      price: 80,
      productId: "transport005",
    ),
    ProductModel(
      name: "High-Speed Train",
      productImage: "assets/images/car.jpg",
      description: "Travel swiftly with our high-speed train service",
      size: "Group",
      price: 120,
      productId: "transport006",
    ),
    ProductModel(
      name: "Cruise Ship Transfer",
      productImage: "assets/images/car.jpg",
      description: "Transfer service to and from cruise ships",
      size: "Group",
      price: 50,
      productId: "transport007",
    ),
    ProductModel(
      name: "Bicycle Rental",
      productImage: "assets/images/car.jpg",
      description: "Explore the city on a rented bicycle",
      size: "Individual",
      price: 15,
      productId: "transport008",
    ),
    ProductModel(
      name: "Electric Scooter",
      productImage: "assets/images/car.jpg",
      description: "Convenient electric scooter rental for city travel",
      size: "Individual",
      price: 20,
      productId: "transport009",
    ),
    ProductModel(
      name: "Helicopter Tour",
      productImage: "assets/images/car.jpg",
      description: "Experience a thrilling city tour from above in a helicopter",
      size: "VIP",
      price: 500,
      productId: "transport010",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: transportProductList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Get.to(FoodDetailsView(productModel: productList[index]));
              },
              child: Container(
                  width: double.infinity,
                  //height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                               clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 50,
                                    width: 50,
                                    child: Image.asset('assets/images/user2.jpg',fit: BoxFit.cover,))),
                          ),
                          Text("Ahmed Mohamed",style: TextStyle(fontSize: 18,color: KPrimaryColor),)
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  transportProductList[index]!.productImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transportProductList[index].name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black87.withOpacity(0.7),
                                    )),
                                Text(transportProductList[index].description!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );

  }
}
