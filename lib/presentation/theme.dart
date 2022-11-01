import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) => ThemeData(
    primarySwatch: Colors.blue,
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  ),
);
