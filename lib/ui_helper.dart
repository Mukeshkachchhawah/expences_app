// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'constructor/social_media.dart';

class App_Colors {
  static final Color witheColor = Color(0xffffffffff);
  static final Color grayColors = Color(0xffF6F6F6);
  static final Color greenColors = Color(0xff1A1B32);
  static final Color blackColors = Color(0xff2BA943);
  static final Color redColors = Color(0xFFFF0000);
}

Widget hSpacher({hight = 11.0}) {
  return SizedBox(
    height: hight,
  );
}

Widget wSpacher({width = 11.0}) {
  return SizedBox(
    width: width,
  );
}

buttom(String text) {
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
  return TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins");
}

TextStyle loginmid2() {
  return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

TextStyle textStyles18() {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

TextStyle midtextStyles(Color) {
  return TextStyle(fontSize: 16);
}
