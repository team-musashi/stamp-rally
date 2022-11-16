import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    primarySwatch: Colors.blue,
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  ),
);
