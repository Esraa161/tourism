import 'package:dio/dio.dart';

import 'api_helper/cache_helper.dart';

class ApiConstants {
  late Dio dio;
  static String BASEURL = 'http://148.113.1.230:2060/';

  static getFullHeader() {
    return {
      "userid": CacheHelper.getString(CustomerHelper.USER_ID),
      "compenypath": CacheHelper.getCompanyPath(),
      "username": CacheHelper.getString(CustomerHelper.USER_NAME),
      "user_name": CacheHelper.getString(CustomerHelper.USER_NAME),
      "fyear": CacheHelper.getString(CustomerHelper.YEAR),
      "automaticpoststock":
          CacheHelper.getBool(CustomerHelper.AUTOMATIC_POIST_STOCK),
      "automaticpostacc":
          CacheHelper.getBool(CustomerHelper.AUTOMATIC_POIST_ACC),
      "showpayinmobcash":
          CacheHelper.getBool(CustomerHelper.SHOW_PAY_IN_MOB_CASH),
      "actionnumkey": -1,
      "actionnumber": 0,
      "content-type": "application/json"
    };
  }

  static get() {
    return Dio(BaseOptions(
        baseUrl: BASEURL,
        connectTimeout: const Duration(seconds: 60 * 1000), // 60 seconds
        receiveTimeout: const Duration(seconds: 60 * 1000) // 60 seconds
        ));
  }
}
