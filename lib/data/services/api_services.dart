import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {
  static final Dio _dio = Dio();

  /// Making a GET request
  static Future<dynamic> getRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers),
      );

      debugPrint("\nGET Request Successful: ${response.data}\n");
      return response.data;
    } on DioException catch (e) {
      debugPrint("\nGET Request Failed: ${e.response?.statusCode} - ${e.response?.data}\n");
      return null;
    } catch (error) {
      debugPrint("\nError in GET Request: $error\n");
      return null;
    }
  }

  /// Making a POST request
  static Future<dynamic> postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: headers ?? {"Content-Type": "application/json"}),
      );

      debugPrint("\nPOST Request Successful: ${response.data}\n");
      return response.data;
    } on DioException catch (e) {
      debugPrint("\nPOST Request Failed: ${e.response?.statusCode} - ${e.response?.data}\n");
      return null;
    } catch (error) {
      debugPrint("\nError in POST Request: $error\n");
      return null;
    }
  }
}