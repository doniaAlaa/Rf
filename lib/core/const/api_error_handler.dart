import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test2/core/const/widgets/api_exception_widget.dart';

enum SendRequestFrom { button, fullPage, widget }

class DioApisExceptions implements Exception {
  handleDioError(
      Object error, SendRequestFrom requestFrom, BuildContext context) {
    if (error is DioException) {
      print('////${error.response?.statusCode}');

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Timeout occurred while sending or receiving";

        case DioExceptionType.sendTimeout:
          return "Timeout occurred while sending or receiving";
        case DioExceptionType.receiveTimeout:
          return "Timeout occurred while sending or receiving";
        case DioExceptionType.badCertificate:

          return "Timeout occurred while sending or receiving";
        case DioExceptionType.badResponse:
          // if (error.response?.statusCode == 404) {
          //   print('Not Found');
          //   return "Not Found";
          // } else {
          //   print('errror');
          // }
          switch (error.response?.statusCode) {
            case 400:
              print('400');

              return const ApiExceptionWidget(
                title: 'bad request',
              );
            case 404:
              print('404');

              switch (requestFrom) {
                case SendRequestFrom.button:
                  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error.response?.statusMessage ?? 'Not Found'),
                  ));

                case SendRequestFrom.fullPage:
                  return const ApiExceptionWidget(
                    title: 'bad request',
                  );
                case SendRequestFrom.widget:
                  return const ApiExceptionWidget(
                    title: 'bad request',
                  );
              }
            // return const ApiExceptionWidget(
            //   title: 'Not Found',
            // );
            case 401:
            case SendRequestFrom.button:
              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error.response?.statusMessage ??
                    'Opps ..Something Went Wrong'),
              ));
            case 500:
              if (requestFrom == SendRequestFrom.button) {
                return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      error.response?.statusMessage ?? 'Opps , Server error !'),
                ));
              }
              print('50000000');
              return const ApiExceptionWidget(
                title: 'Server Error',
              );
          }

        case DioExceptionType.cancel:
          return "Timeout occurred while sending or receiving";
        case DioExceptionType.connectionError:
          return "Timeout occurred while sending or receiving";
        case DioExceptionType.unknown:
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.response?.statusMessage ?? 'Invalid host uri'),
          ));
      }
    }
  }
}
