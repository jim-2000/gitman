import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/screen/initailScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gitman/theme/ThemeData.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const InitialScreen(),
    );
  }
}
