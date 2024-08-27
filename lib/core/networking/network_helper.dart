
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/const/api_error_handler.dart';
import 'package:test2/core/models/user_model.dart';
import 'package:test2/main.dart';


class NetworkHelper {
  late final Dio _dio;

  NetworkHelper() {
    _dio = Dio();
  }

//https://protocoderspoint.com/jsondata/superheros.json
  get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Options? options,
    // CacheOptions? cacheOptions,
    CancelToken? cancelToken,
    required BuildContext context,
  }) async {
    String?   userUrl =   await SecureStorage().getLoginUrl();

    print(userUrl);

    try {
            UserModel? userModel;
              String?   user =   await SecureStorage().getUserModel();
              if(user != null ){
    userModel = UserModel.fromJson(jsonDecode(user));
                print(userModel.macAddress);
              }
            
      final response = await _dio.get(
        '$userUrl/$endpoint',
        queryParameters: queryParams,
        options: Options(
          headers: {
            "RequesterId":"${userModel?.id}"
            // Headers.contentLengthHeader: postData.length, // Set the content-length.
          },
        ),
        // cancelToken: cancelToken ?? _cancelToken,
      );
     
print('response:${response}');
      ResponseModel result = ResponseModel.fromJson(response.data);

      print('pppp${result.data.toString()}');

      return result;
    } catch (e) {
      print('error:${e}');

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      //DioApisExceptions().handleDioError(e, SendRequestFrom.button, context);
    }
  }

  post(
      {required String endpoint,
      Map<String, dynamic>? queryParams,
      Options? options,
      Object? data,
      // CacheOptions? cacheOptions,
      CancelToken? cancelToken,
      required BuildContext context,
      required SendRequestFrom sendRequestFrom}) async {
   // try {
      String?   userUrl =   await SecureStorage().getLoginUrl();
     //  print('5555$userUrl');
      final response = await _dio.post(
        '$userUrl/$endpoint',
        queryParameters: queryParams,
        data: data,

        options: Options(
          // headers: {"key": "RequesterId", "value": "2", "type": "text"},
          headers: {"RequesterId": requesterId},
        ),
        // cancelToken: cancelToken ?? _cancelToken,
      );
      print(response.data);
      ResponseModel result = ResponseModel.fromJson(response.data!);

      return result;
    // } catch (e) {
    //   print(e);
    //   DioApisExceptions().handleDioError(e, sendRequestFrom, context);
    //   return Re
    // }
  }
}
