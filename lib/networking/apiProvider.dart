import 'dart:developer' show log;
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:gitman/networking/url.dart';

class ApiProvider {
  final dio = Dio();
  // get
  Future<Response> get(String url) async {
    log("url --- : $url ${Api.token}");

    final response = await dio.get(
      url,
      options: Options(
        headers: {'Authorization': 'token ${Api.token}'},
      ),
    );

    return response;
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
