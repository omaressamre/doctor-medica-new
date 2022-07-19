import 'package:flutter/material.dart';

import 'constance.dart';
import 'custom_text.dart';

class Depts extends StatelessWidget {
  final String deptName;
  final String icon;
  final Function onPressed;

  const Depts({
    Key? key,
    required this.deptName,
    required this.icon,
    required this.onPressed}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
              maximumSize: Size(
                  size.width * 0.19,
                  // 0,
                  size.height * 0.12),
              minimumSize: Size(
                  size.width * 0.19,
                  // 0,
                  size.height * 0.12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              backgroundColor: primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              CustomText(
                text: deptName,
                textStyle: TextStyle(color: Colors.white, fontSize: 13),
              ),
              SizedBox(
                height: size.height * 0.015,
              )
            ],
          )),
    );
  }
}
