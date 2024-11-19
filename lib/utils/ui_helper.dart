// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget hSpace({mHight = 20.0}) {
  return SizedBox(
    height: mHight,
  );
}

Widget wSpace({width = 20.0}) {
  return SizedBox(
    width: width,
  );
}

/// Custom fonts custom button fonts size forget password
TextStyle textStyleFonts10(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.w500,
        fontSize: 11,
      );
}

TextStyle textStyleFonts16(BuildContext context,
    {colors = Colors.black, FontFamily = 'Poppins'}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontFamily: FontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
}

TextStyle textStyleFonts18(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
}

/// Custom fonts custom button fonts size forget password
TextStyle textStyleFonts28(BuildContext context,
    {colors = Colors.black, FontFamily = 'Poppins'}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontFamily: FontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      );
}
