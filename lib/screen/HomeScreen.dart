import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/themeController.dart';

class HomeScreen extends StatelessWidget {
  String name;
  HomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController c = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.lightBlue,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          name.toUpperCase(),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1674574124649-778f9afc0e9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                    height: Get.height * 0.28,
                    width: Get.width / 2,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "John Doe".toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: 1.6,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              letterSpacing: 2.6,
                              fontSize: 28,
                            ),
                      ),
                      Text(
                        "email.me.@gmail.com",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 2.2,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              letterSpacing: 2.6,
                              fontSize: 12,
                            ),
                      ),
                      Text(
                        "Me.twitter",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 2,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              letterSpacing: 2.6,
                              fontSize: 12,
                            ),
                      ),
                      Text(
                        "🉑 25-jun-2020".toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 2,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              letterSpacing: 2.6,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "It's important to handle state management, side effects, and resource cleanup in the appropriate lifecycle methods to ensure correct behavior and optimal performance in your Flutter applications. Understanding and utilizing the widget lifecycle effectively will help you build robust and efficient UIs.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Get.isDarkMode
                          ? Colors.grey.shade400
                          : Colors.black54,
                      letterSpacing: 2.3,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      height: 200,
                      width: Get.width / 2 - 20,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Get.isDarkMode
                              ? Colors.grey.shade400
                              : Colors.black54,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            80.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      height: 1.6,
                                      color: Colors.deepOrange,
                                      fontSize: 48,
                                    ),
                          ),
                          Text(
                            "following",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 2.6,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      height: 200,
                      width: Get.width / 2 - 20,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Get.isDarkMode
                              ? Colors.grey.shade400
                              : Colors.black54,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            480.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      height: 1.6,
                                      color: Colors.deepOrange,
                                      fontSize: 48,
                                    ),
                          ),
                          Text(
                            "followers",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 2.6,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      height: 200,
                      width: Get.width / 2 - 20,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Get.isDarkMode
                              ? Colors.grey.shade400
                              : Colors.black54,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            4.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      height: 1.6,
                                      color: Colors.deepOrange,
                                      fontSize: 48,
                                    ),
                          ),
                          Text(
                            "public gist".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 2.6,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    onTap: () {
                      // route to repos
                    },
                    child: Card(
                      elevation: 3.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: 200,
                        width: Get.width / 2 - 20,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: Get.isDarkMode
                                ? Colors.grey.shade400
                                : Colors.black54,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  29.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        height: 1.6,
                                        color: Colors.deepOrange,
                                        fontSize: 48,
                                      ),
                                ),
                                Text(
                                  "public Repos".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        letterSpacing: 2.6,
                                      ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 40,
                                  color: Colors.teal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
