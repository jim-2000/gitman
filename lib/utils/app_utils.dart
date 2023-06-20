import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  // button
  Widget button(String title, void Function()? onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        height: 55,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // input
  Widget textinput({
    required String text,
    InputDecoration? decoration,
    required TextEditingController controller,
    int? minline,
    int? maxline,
    TextInputType? inputType,
    FocusNode? focusNode,
  }) {
    return TextField(
      minLines: minline,
      maxLines: maxline,
      controller: controller,
      keyboardType: inputType,
      focusNode: focusNode,
      style: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        label: Text(
          text,
          style: Theme.of(Get.context!).textTheme.bodySmall,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
