import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/controller/themeController.dart';
import 'package:gitman/screen/InitailScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gitman/theme/ThemeData.dart';
import 'package:gitman/utils/pref_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController c = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      debugShowCheckedModeBanner: false,
      home: const InitialScreen(),
    );
  }
}
