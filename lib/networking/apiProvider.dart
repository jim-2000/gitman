import 'dart:developer' show log;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gitman/networking/url.dart';

class ApiProvider {
  final dio = Dio();
  // get
  Future<dynamic> get(String url) async {
    log("url --- : $url ${Api.token}");
    dynamic responseJson;

    final response = await dio.get(url,
        options: Options(headers: {'Authorization': 'token ${Api.token}'}));
    responseJson = response.data as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      Get.snackbar("", "Something went wrong");
      return null;
    }
  }
}

//
class MYException implements Exception {}
