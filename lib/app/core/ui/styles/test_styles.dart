import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  ///  [Primary font]
  TextStyle get textPrimaryFontRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );

  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: primaryFont,
      );

  /// [Secondary Font]
  TextStyle get textSecondaryFontRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: secondaryFont,
      );

  TextStyle get textSecondaryFontMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: secondaryFont,
      );

  TextStyle get textSecondaryFontBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: secondaryFont,
      );

  TextStyle get textSecondaryFontExtraBold => textSecondaryFontRegular.copyWith(
        fontWeight: FontWeight.w800,
        color: ColorsApp.i.darkGrey,
      );

  TextStyle get labelTextField => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: secondaryFont,
      );

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(
        color: ColorsApp.i.primary,
      );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.white,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.black,
      );

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
        color: ColorsApp.i.primary,
        fontSize: 22,
      );
}

extension TextStyleExtensions on BuildContext {
  TextStyles get textStyle => TextStyles.i;
}
