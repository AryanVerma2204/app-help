import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class Textstyles {
  final BuildContext context;

  Textstyles(this.context);

  static TextStyle w60026 = TextStyle(
      fontSize: Dimensions.size_26,
      fontWeight: FontWeight.w600,
      color: ColorPalettes.headerColor);

  static TextStyle w70026 = TextStyle(
      fontSize: Dimensions.size_26,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.headerColor);

  static TextStyle w40016 = TextStyle(
      fontSize: Dimensions.size_16,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.headerColor);

  static TextStyle w40012 = TextStyle(
      fontSize: Dimensions.size_12,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.pencilColor);

  static TextStyle w80022 = TextStyle(
      fontSize: Dimensions.size_22,
      fontWeight: FontWeight.w800,
      color: ColorPalettes.darkBrownColor);

  static TextStyle w70016 = TextStyle(
      fontSize: Dimensions.size_16,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.darkOrangeColor);

  static TextStyle w70014 = TextStyle(
      fontSize: Dimensions.size_14,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.darkBrownColor);

  static TextStyle w40014 = TextStyle(
      fontSize: Dimensions.size_14,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.quoteTextColor);
  static TextStyle w50014 = TextStyle(
      fontSize: Dimensions.size_14,
      fontWeight: FontWeight.w500,
      color: ColorPalettes.darkBrownColor);
}
