import 'package:flutter/material.dart';
import 'package:resturantapp/core/constants.dart';

import '../../core/IconBroken.dart';
import '../../model/product_model.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

List<ProductModel> hotelProductList = [
  ProductModel(
    name: "Luxury Resort & Spa",
    productImage: "assets/images/hotel1.jpg",
    description: "Experience luxury at its finest in our resort and spa",
    size: "Standard Room",
    price: 300,
    productId: "hotel001",
  ),
  ProductModel(
    name: "City View Hotel",
    productImage: "assets/images/hotel2.jpg",
    description: "Enjoy stunning city views and modern amenities",
    size: "Deluxe Room",
    price: 200,
    productId: "hotel002",
  ),
  ProductModel(
    name: "Mountain Lodge Retreat",
    productImage: "assets/images/hotel3.jpg",
    description: "Escape to a cozy mountain lodge surrounded by nature",
    size: "Cabin",
    price: 250,
    productId: "hotel003",
  ),
  ProductModel(
    name: "Beachfront Resort",
    productImage: "assets/images/hotel1.jpg",
    description: "Relax on a private beach in our beachfront resort",
    size: "Ocean View Suite",
    price: 350,
    productId: "hotel004",
  ),
  ProductModel(
    name: "Historic Boutique Hotel",
    productImage: "assets/images/hotel2.jpg",
    description: "Step into history with a stay in our boutique hotel",
    size: "Classic Room",
    price: 180,
    productId: "hotel005",
  ),
  ProductModel(
    name: "Ski Resort Lodge",
    productImage: "assets/images/hotel3.jpg",
    description: "Ski-in/Ski-out convenience in our cozy lodge",
    size: "Ski Chalet",
    price: 280,
    productId: "hotel006",
  ),
  ProductModel(
    name: "Modern Urban Hotel",
    productImage: "assets/images/hotel1.jpg",
    description: "Experience modern luxury in the heart of the city",
    size: "Executive Suite",
    price: 220,
    productId: "hotel007",
  ),
  ProductModel(
    name: "Countryside Retreat Inn",
    productImage: "assets/images/hotel2.jpg",
    description: "Relax in a peaceful countryside retreat inn",
    size: "Country Room",
    price: 150,
    productId: "hotel008",
  ),
  ProductModel(
    name: "Family-Friendly Resort",
    productImage: "assets/images/hotel3.jpg",
    description: "Fun for the whole family in our resort with kid's activities",
    size: "Family Suite",
    price: 280,
    productId: "hotel009",
  ),
  ProductModel(
    name: "Business Hotel & Conference Center",
    productImage: "assets/images/hotel1.jpg",
    description: "Ideal for business travelers with conference facilities",
    size: "Business Suite",
    price: 200,
    productId: "hotel010",
  ),
];

class _FavouritesViewState extends State<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: hotelProductList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Get.to(FoodDetailsView(productModel: productList[index]));
              },
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 7,
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
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                              hotelProductList[index]!.productImage!,
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
                            Text(hotelProductList[index].name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black87.withOpacity(0.7),
                                )),
                            Row(
                              children: [
                                Icon(IconBroken.Star,color: Colors.amber,size: 18,),
                                Icon(IconBroken.Star,color: Colors.amber,size: 18,),
                                Icon(IconBroken.Star,color: Colors.amber,size: 18,),

                              ],
                            ),
                            Text(hotelProductList[index].description!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
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
