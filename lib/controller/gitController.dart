import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gitman/model/UserModel.dart';
import 'package:gitman/model/UserRepoModel.dart';
import 'package:gitman/networking/apiProvider.dart';
import 'package:gitman/networking/url.dart';

class GitController extends GetxController {
  final RxBool isLoading = false.obs;
  User? user;
  //
  RxList<Repository> repositories = <Repository>[].obs;

  //
  Future<void> getUserData(String name) async {
    final url = '${Api.api}/users/${name.trim()}';
    startLoading();
    try {
      final res = await ApiProvider().get(url);
      if (res.statusCode == 404) {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'User Not Found',
          ),
        );
        Get.back();
      } else if (res.statusCode == 200) {
        final response = res.data;
        user = User(
          name: response['name'] ?? '',
          bio: response['bio'] ?? 'No Bio...',
          followers: response['followers'] ?? 0,
          followings: response['followings'] ?? 0,
          imageUrl: response['avatar_url'] ??
              'https://images.unsplash.com/photo-1674574124649-778f9afc0e9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
          joinedDate: response['created_at'] ?? 'Unknown',
          publicRepo: response['public_repos'] ?? 0,
          gists: response['public_gists'] ?? 0,
          email: response['email'] ?? 'no email',
          twitterUsername: response['twitter_username'] ?? 'no twitter',
          username: response['login'] ?? 'no username',
        );
        log('Name is ${response['name']}');
        update();
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Something went wrong',
          ),
        );
        Get.back();
      }

      stopLoading();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      Get.back();
      stopLoading();
    }
  }

// call repo
  Future<void> fetchRepositories(String username, int page) async {
    log('call');
    final url = 'https://api.github.com/users/$username/repos?page=$page';
    final response = await ApiProvider().get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final List<Repository> repos = data.map((repo) {
        return Repository(
          name: repo['name'],
          description: repo['description'] ?? 'no description...',
          created_at: repo['created_at'] ?? '',
          default_branch: repo['default_branch'] ?? 'null',
          full_name: repo['full_name'] ?? '',
          size: repo['size'] ?? 0,
          language: repo['language'] ?? '',
          owner: RepoOwner(
            login: repo['owner']['login'] ?? 'null',
            url: repo['owner']['url'] ?? 'null',
            htmlUrl: repo['owner']['html_url'] ?? 'null',
            avatarUrl: repo['owner']['avatar_url'] ??
                ' "https://images.unsplash.com/photo-1674574124649-778f9afc0e9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"',
          ),
        );
      }).toList();

      // ignore: invalid_use_of_protected_member
      repositories.value = repositories.value + repos;
    } else {
      repositories.value = [];
    }
  }

  //
  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }
}
