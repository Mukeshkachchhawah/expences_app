import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialMediaButton extends StatelessWidget {
  String images;
  double scaleValue;
  String textValue;
  SocialMediaButton({super.key, required this.images, required this.scaleValue, required this.textValue});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
         // image: DecorationImage(image: NetworkImage(images), scale: 50 ),
         ),
          child:   Image(image: NetworkImage(images, scale: scaleValue)),
    );
  }
}


