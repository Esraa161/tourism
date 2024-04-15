import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/api.dart';
import '../model/ItemsInCategoryModel.dart';
import '../model/showCategories_model.dart';

class ShowCategoriesController extends GetxController {
  int? StatusCode;
  String? msg;

  final Error = ''.obs;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  late ShowCategoriesModel showCategoriesModel = ShowCategoriesModel();

  ShowCategoriesController() {
    GetCategory();
  }

  Future<void> GetCategory() async {
    try {
      _isLoading.value = true;
      print(">>>>>>>>>>>>>>>>>>>>");
      print(isLoading.value);
      Dio dio = ApiConstants.get();
      await dio.post('vansales/VacationRequest/FillData',
          options: Options(headers: ApiConstants.getFullHeader()),
          data: {
            "searchModel": {"tableName": "st_group_sel", "SearchVal": ""},
            "ParamNames": [
              {"paramName": "searchval", "paramVal": ""}
            ]
          }).then((value) {
        StatusCode = value.statusCode;
        if (value.statusCode == 200) {
          _isLoading.value = false;
          print("00000000000000lf000000000000");
          print(value.data);
          print(isLoading.value);
          showCategoriesModel = ShowCategoriesModel.fromJson(value.data);
        }
        update();
      }).catchError((error) {
        print(error.toString());
        _isLoading.value = false;
        print(isLoading.value);
      });
    } catch (error) {
      _isLoading.value = false;
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(isLoading.value);
      Error('An error occurred. Please try again.');
      print('failed: $error');
      // Handle errors, show error messages, etc.
    }
  }

  final ValueNotifier<bool> _isLoadingCat = ValueNotifier(false);

  ValueNotifier<bool> get isLoadingCat => _isLoadingCat;
  late ItemInCategoryModel itemInCategoryModel;

  Future<void> getItemsByCategory(String categoryId) async {
    _isLoadingCat.value = true;
    // _categoryItemsModel = [];

    print("/////////////////////////");
    Dio dio = ApiConstants.get();
    final response = await dio.post("vansales/VacationRequest/FillData",
        options: Options(headers: ApiConstants.getFullHeader()),
        data: {
          "searchModel": {
            "tableName": "st_items_sel_by_group_id",
            "SearchVal": ""
          },
          "ParamNames": [
            {"paramName": "groupid", "paramVal": "212"}
          ]
        });

    if (response.statusCode == 200) {
      print("**********************************");
      print(response.data);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      itemInCategoryModel = ItemInCategoryModel.fromJson(response.data);
      print("categoryItemsModel length:>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

      print(itemInCategoryModel.data?.length);

      // _categoryItemsModel = itemInCategoryModel.data!;

      // print(_categoryItemsModel.length);
      _isLoadingCat.value = false;
    }

    update();
  }
}
