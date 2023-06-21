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
    } else if (response.statusCode == 400) {
      throw BadRequestException('Bad request');
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      throw Exception("Unauthorized access");
    } else {
      throw Exception("Something went wrong");
    }
  }
}

//
class MYException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _errorType;
  MYException([this._message, this._errorType]);
  //

  @override
  String toString() {
    return "$_errorType $_message";
  }
}

// bad request error
class BadRequestException extends MYException {
  BadRequestException([String? meassage]) : super(meassage, 'error');
}

// wrong name error
class NameErrorException extends MYException {
  NameErrorException([String? meassage]) : super(meassage, 'Wrong Name');
}
