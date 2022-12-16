import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) {
    final colorScheme = ColorScheme.light(
      primary: HexColor('FF73F1'),
      primaryContainer: HexColor('FFAFCC'),
      secondary: HexColor('FFA776'),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'M_PLUS_1p',
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
