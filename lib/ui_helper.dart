// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


class AppColors {
  static const Color witheColor = Color(0xffffffff);
  static const Color grayColors = Color(0xffF6F6F6);
  static const Color greenColors = Color(0xff1A1B32);
  static const Color blackColors = Color(0xff2BA943);
  static const Color redColors = Color(0xFFFF0000);
}

Widget hSpacer({mHight = 15.0}) {
  return SizedBox(
    height: mHight,
  );
}

Widget wSpacer({width = 11.0}) {
  return SizedBox(
    width: width,
  );
}

button(String text) {
  return Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(10)),
    child: Center(child: Text(text)),
  );
}

TextStyle loginTop1() {
  return const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins");
}

TextStyle loginMid2() {
  return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

TextStyle textStyles18() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textStyles16() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
}

TextStyle midTextStyles(Color) {
  return const TextStyle(fontSize: 16);
}
