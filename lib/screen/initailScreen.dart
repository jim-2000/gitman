import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/themeController.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController c = Get.put(ThemeController());
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
      body: Column(
        children: [],
      ),
    );
  }
}
