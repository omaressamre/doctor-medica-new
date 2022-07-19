import 'package:flutter/material.dart';

import 'custom_text.dart';

class sliderCard extends StatelessWidget {
  final String text;
  final String graph;
  const sliderCard({
    Key? key,
    required this.text,
    required this.graph,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
// ignore: prefer_const_literals_to_create_immutables
          children: [
            CustomText(
              text: text,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Color(0xffFEB197),
              indent: 150,
              endIndent: 150,
              height: 30,
              thickness: 2,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomText(
                text: graph,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w400,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
            const Divider(
              color: Color(0xffFEB197),
              indent: 150,
              endIndent: 150,
              height: 30,
              thickness: 2,
            ),
          ]),
    );
  }
}
