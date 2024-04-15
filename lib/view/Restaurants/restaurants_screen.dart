import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:resturantapp/core/constants.dart';
import 'package:resturantapp/view/Home/layout_view.dart';
class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Restaurants",style: TextStyle(
          color: KPrimaryColor,
          fontFamily: "pacifico",
          fontSize: 25
        ),),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing:1,
              crossAxisSpacing:5,
              pattern: [
                WovenGridTile(0.5),
                WovenGridTile(
                  4 / 7,
                  crossAxisRatio: 1,
                  alignment: AlignmentDirectional.center,
                  
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Tile(index: index),
              childCount: 12,

            ),
          ),
        ),
      ),
    );

  }
}

class Tile extends StatelessWidget {
  final int index;
  final List<String> imageUrls = [
    'assets/images/R1.png',
    'assets/images/R2.png',
    'assets/images/R3.png',
    'assets/images/R4.png',
    'assets/images/R1.png',
    'assets/images/R2.png',
    'assets/images/R3.png',
    'assets/images/R4.png',
    'assets/images/R1.png',
    'assets/images/R2.png',
    'assets/images/R3.png',
    'assets/images/R4.png',

  ];
  final List<Color> colors = [
    KPrimaryColor.withOpacity(.2),
    Colors.red.shade50,
    Colors.deepPurple.shade50,
    Colors.lightGreen.shade50,
    Colors.blue.shade50
  ];

   Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = colors[index % colors.length];

    return InkWell(
      onTap:(){
        Get.to(LayoutView());
      },
      child: Container(
        color: color,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Restaurant Name $index',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "pacifico"
              ),
            ),
          ],
        ),
      ),
    );
  }
}