import 'package:get/get.dart';

class GitController extends GetxController {
  //
  final RxBool isLoading = false.obs;
  //
  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }
}
