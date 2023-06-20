import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.grey.shade300,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.deepOrange,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Colors.deepOrange,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Colors.deepOrange,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
