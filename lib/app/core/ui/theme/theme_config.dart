import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(color: ColorsApp.i.darkGrey, width: 1),
  );

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextStyles.i.labelTextField,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
    ),
  );
}
