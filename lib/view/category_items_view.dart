import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantapp/core/widgets/animated_loading.dart';

import '../core/constants.dart';
import '../view_model/showCategories_controller.dart';
import 'Home/details_view.dart';

class CategoryItemsView extends StatelessWidget {
  String groupName;

  CategoryItemsView({super.key, required this.groupName});

  String basePhoto =
      "http://148.113.1.230:2060/vansales/Emplyee/getimg?imgpath=c:\\company_data\\circle_2_test";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<ShowCategoriesController>(
      init: ShowCategoriesController(),
      builder: (controller) => controller.isLoadingCat.value
          ? const Scaffold(body: AnimatedLoading())
          : Scaffold(
              appBar: AppBar(
                title: Text(groupName),
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
              ),
              body: SizedBox(
                height: screenSize.height,
                child: GridView.builder(
                  itemCount: controller.itemInCategoryModel.data?.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print(">>>>>>>>>>>>>>>>>>>");
                        }
                        Get.to(FoodDetailsView(
                          categoryItem:
                              controller.itemInCategoryModel.data![index],
                        ));
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                width: 150,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${basePhoto}${controller.itemInCategoryModel.data?[index].itempic}",
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: KPrimaryColor.withOpacity(.5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        " ${controller.itemInCategoryModel.data![index].itemname}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.black.withOpacity(0.7),
                                        )),
                                    Text(
                                      " ${controller.itemInCategoryModel.data![index].itemtypename}",
                                      style: const TextStyle(
                                        color: KTextColorBlack,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${controller.itemInCategoryModel.data![index].fprice!}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: KPrimaryColor,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
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
            ),
    );
  }
}
