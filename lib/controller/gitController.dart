import 'dart:developer';

import 'package:get/get.dart';
import 'package:gitman/model/UserModel.dart';
import 'package:gitman/networking/apiProvider.dart';
import 'package:gitman/networking/url.dart';

class GitController extends GetxController {
  final RxBool isLoading = false.obs;
  User? user;
  //
  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  //
  Future<void> getUserData(String name) async {
    final url = '${Api.api}/users/${name.trim()}';
    try {
      final response = await ApiProvider().get(url);
      user = User(
        name: response['name'] ?? 'No user found',
        bio: response['bio'] ?? 'No Bio...',
        followers: response['followers'] ?? 0,
        followings: response['followings'] ?? 0,
        imageUrl: response['avatar_url'] ?? '',
        joinedDate: response['created_at'],
        publicRepo: response['public_repos'] ?? 0,
        email: response['email'] ?? 'no email',
        twitterUsername: response['twitter_username'] ?? 'no twitter',
        username: response['login'] ?? 'No user found',
      );
      log('Name is ${user!.name}');

      update();
    } catch (e) {
      print(e);
    }
  }
}
