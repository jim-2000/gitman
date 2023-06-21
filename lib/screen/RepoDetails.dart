import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/gitController.dart';
import 'package:gitman/controller/themeController.dart';
import 'package:gitman/model/UserRepoModel.dart';
import 'package:intl/intl.dart';

class RepoDetails extends StatelessWidget {
  Repository repo;
  RepoDetails({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final GitController g = Get.put(GitController());
    ThemeController c = Get.put(ThemeController());

    final dateTime = DateTime.parse(repo.created_at);
    final formattedDate = DateFormat('MMMM d, y', 'en_US').format(dateTime);
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
          repo.name.toUpperCase(),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      repo.owner.avatarUrl,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                repo.name,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 1.6,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      letterSpacing: 1,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                repo.description ?? '',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Get.isDarkMode
                          ? Colors.grey.shade400
                          : Colors.black54,
                      letterSpacing: 2.3,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              detailscard(
                titel: 'Owner Name',
                value: repo.owner.login.toString(),
              ),
              detailscard(
                titel: 'Language',
                value: repo.language.toString(),
              ),
              detailscard(
                titel: 'Size',
                value: repo.size.toString(),
              ),
              detailscard(
                titel: 'Branch',
                value: repo.default_branch.toString(),
              ),
              detailscard(
                titel: 'Html URL',
                value: repo.owner.htmlUrl.toString(),
              ),
              detailscard(
                titel: 'Created',
                value: formattedDate,
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

  Widget detailscard({required String titel, required String value}) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titel,
              style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                    height: 1,
                    letterSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              value,
              style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                    height: 2.2,
                    letterSpacing: 1,
                    fontSize: 14,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
