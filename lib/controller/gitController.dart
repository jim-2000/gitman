import 'package:get/get.dart';
import 'package:gitman/model/UserModel.dart';

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
}
