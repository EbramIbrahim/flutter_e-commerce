import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;

  DioHelper() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  getRequest({
    required String endPoitns,
    Map<String, dynamic>? queryMaps,
  }) async {
    try {
      final response = await dio!.get(endPoitns, queryParameters: queryMaps);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  postRequest({
    required String endPoints,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio!.post(endPoints, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
