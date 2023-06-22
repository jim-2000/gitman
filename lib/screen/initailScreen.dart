import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/themeController.dart';
import 'package:gitman/screen/HomeScreen.dart';
import 'package:gitman/utils/app_utils.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeController c = Get.find<ThemeController>();
    AppUtils utils = AppUtils();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gitman".toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                letterSpacing: 2.0,
              ),
        ),
        actions: [
          GetBuilder<ThemeController>(builder: (_) {
            return CircleAvatar(
              backgroundColor:
                  Get.isDarkMode ? Colors.black : Colors.grey.shade600,
              child: IconButton(
                onPressed: () {
                  c.toggleTheme();
                  log(c.isDark.toString());
                },
                icon: c.isDark
                    ? Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.yellow.shade500,
                      )
                    : const Icon(
                        Icons.nightlight_round,
                        size: 20,
                        color: Colors.black,
                      ),
              ),
            );
          }),
          //
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              utils.textinput(
                text: "Enter User Name",
                controller: _usernameController,
                inputType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              utils.button("title", () {
                if (_usernameController.text.isNotEmpty) {
                  log(_usernameController.text);
                  Get.to(HomeScreen(name: _usernameController.text));
                  _usernameController.text = "";
                } else {
                  Get.snackbar('Enter User name', 'User name cannot be empty.');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
