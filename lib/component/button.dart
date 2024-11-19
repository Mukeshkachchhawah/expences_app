import 'package:flutter/material.dart';

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
