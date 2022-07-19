import 'package:flutter/material.dart';

Widget myDefaultBackground() {
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffE822AC), Color(0xff9E32C6)],
              // stops: [0.6, 2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)));
}
