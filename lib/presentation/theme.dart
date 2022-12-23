import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../util/assets/fonts.gen.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) {
    final colorScheme = ColorScheme.light(
      primary: HexColor('FF73F1'),
      primaryContainer: HexColor('FFAFCC'),
      secondary: HexColor('FFA776'),
      surfaceVariant: HexColor('EEDEE7'),
      onSurfaceVariant: HexColor('4E444B'),
      outline: HexColor('837377'),
      background: HexColor('FFFFFF'),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: FontFamily.mPLUS1p,
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
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  },
);
