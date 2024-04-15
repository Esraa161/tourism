import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/category_items_view.dart';
import '../../view_model/showCategories_controller.dart';
import '../constants.dart';

class CategoryListviewWidget extends StatelessWidget {
  const CategoryListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowCategoriesController>(
      init: Get.put(ShowCategoriesController()),
      builder: (controller) => controller.isLoading.value
          ? const Center(
              child: LinearProgressIndicator(
              color: KPrimaryColor,
            ))
          : SizedBox(
              height: 68,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.separated(
                  itemCount: controller.showCategoriesModel.data!.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.getItemsByCategory(
                            "${controller.showCategoriesModel.data?[index].groupid!}");
                        Get.to(() => CategoryItemsView(
                              groupName:
                                  "${controller.showCategoriesModel.data![index].groupname}",
                            ));
                      },
                      child: Container(
                        // width: 150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            color: KPrimaryColor,

                            //color: KScaffoldColor.withOpacity(.4),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${controller.showCategoriesModel.data?[index].groupname!}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
            ),
    );
  }
}
