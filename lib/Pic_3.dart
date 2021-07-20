import 'package:flutter/material.dart';

// ignore: camel_case_types
class Pic_3 extends StatelessWidget {
  // const Pic_3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/Pic_5.jpg",
      fit: BoxFit.cover,
      );
  }
}