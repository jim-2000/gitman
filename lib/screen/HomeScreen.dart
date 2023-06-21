import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/gitController.dart';
import 'package:gitman/controller/themeController.dart';
import 'package:gitman/screen/RepoScreen.dart';

class HomeScreen extends StatefulWidget {
  String name;
  HomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(GitController()).getUserData(widget.name);
  }

//----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    ThemeController c = Get.put(ThemeController());
    GitController g = Get.put(GitController());
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
            widget.name.toUpperCase(),
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
        body: Obx(
          () => g.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: GetBuilder<GitController>(builder: (_) {
                      if (g.user == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return displayData(g, context);
                    }),
                  ),
                ),
        ));
  }

  Column displayData(GitController g, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              g.user!.imageUrl ??
                  "https://images.unsplash.com/photo-1674574124649-778f9afc0e9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
              height: Get.height * 0.28,
              width: Get.width / 2,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    g.user!.name.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 1.6,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 1,
                          fontSize: 24,
                        ),
                  ),
                  Text(
                    g.user!.email ?? 'no mail',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 2.2,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                  ),
                  Text(
                    g.user!.twitterUsername ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 2,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 2.6,
                          fontSize: 12,
                        ),
                  ),
                  Text(
                    "🉑 ${g.user!.joinedDate}".toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 2,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 2.6,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          g.user!.bio ?? '',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Get.isDarkMode ? Colors.grey.shade400 : Colors.black54,
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
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color:
                        Get.isDarkMode ? Colors.grey.shade400 : Colors.black54,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      g.user!.followings.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.6,
                            color: Colors.deepOrange,
                            fontSize: 48,
                          ),
                    ),
                    Text(
                      "following",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
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
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color:
                        Get.isDarkMode ? Colors.grey.shade400 : Colors.black54,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      g.user!.followers.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.6,
                            color: Colors.deepOrange,
                            fontSize: 48,
                          ),
                    ),
                    Text(
                      "followers",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
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
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color:
                        Get.isDarkMode ? Colors.grey.shade400 : Colors.black54,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      g.user!.gists.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.6,
                            color: Colors.deepOrange,
                            fontSize: 48,
                          ),
                    ),
                    Text(
                      "public gist".toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
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
                Get.to(RepoScreen(
                  name: widget.name,
                ));
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                            g.user!.publicRepo.toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                          onPressed: () {
                            Get.to(RepoScreen(
                              name: widget.name,
                            ));
                          },
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
    );
  }
}
