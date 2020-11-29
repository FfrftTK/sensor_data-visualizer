import 'package:flutter/material.dart';

ThemeData buildTheme() {
  // ダークテーマをベースにアプリのテーマを改変
  final baseTheme = ThemeData.dark();

  return ThemeData(
//    accentColor: Colors.black12,
    colorScheme: baseTheme.colorScheme,
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      colorScheme: baseTheme.buttonTheme.colorScheme.copyWith(),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
