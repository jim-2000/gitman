import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/gitController.dart';
import 'package:gitman/controller/themeController.dart';
import 'package:gitman/screen/RepoDetails.dart';
import 'package:intl/intl.dart';

class RepoScreen extends StatefulWidget {
  String name;
  RepoScreen({super.key, required this.name});

  @override
  State<RepoScreen> createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  bool isGridview = false;
  int page = 1;
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Get.put(GitController()).fetchRepositories(widget.name, page);
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final GitController g = Get.put(GitController());
    ThemeController c = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (g.repositories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total repositories ${g.repositories.length}"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isGridview = !isGridview;
                          });
                        },
                        icon: Icon(
                          isGridview ? Icons.grid_view : Icons.list_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height - 160,
                  // child: listviewofrepos(g),
                  child: isGridview
                      ? gridveiwrepos(g, context)
                      : listviewofrepos(g),
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget gridveiwrepos(GitController g, BuildContext context) {
    return GridView.builder(
      itemCount: g.repositories.length,
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3),
      ),
      itemBuilder: (c, i) {
        final repo = g.repositories[i];
        final dateTime = DateTime.parse(repo.created_at);
        final formattedDate = DateFormat('MMMM d, y', 'en_US').format(dateTime);
        return GestureDetector(
          onTap: () => Get.to(RepoDetails(repo: repo)),
          child: Card(
            elevation: 3.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.grey.shade400 : Colors.black54,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    repo.name.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          letterSpacing: 1,
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    repo.language ?? 'undefined language',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 2.2,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                  ),
                  Text(
                    formattedDate.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 2.2,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ListView listviewofrepos(
    GitController g,
  ) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: g.repositories.length,
      controller: scrollController,
      itemBuilder: (context, i) {
        final repo = g.repositories[i];
        final dateTime = DateTime.parse(repo.created_at);
        final formattedDate = DateFormat('MMMM d, y', 'en_US').format(dateTime);
        return GestureDetector(
          onTap: () => Get.to(RepoDetails(repo: repo)),
          child: Card(
            child: ListTile(
              title: Text(
                repo.name.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 2.2,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                repo.language ?? 'undefined language',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 2.2,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
              ),
              trailing: Text(
                formattedDate.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 2.2,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }

//
  Future<void> _scrollListener() async {
    GitController g = Get.put(GitController());
    if (g.isLoading.value) return; // don't fetch coz alrady in request
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        page = page + 1;
      });
      g.fetchRepositories(widget.name, page);
    }
  }
}
