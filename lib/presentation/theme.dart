import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: const Color.fromRGBO(255, 115, 241, 1),
      secondary: const Color.fromRGBO(255, 167, 118, 1),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
      ),
    );
  },
);
