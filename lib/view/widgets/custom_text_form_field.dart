// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String text;
  final int fontSize;
  final Color color;
  final String hint;
  final Icon? icon_name;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  CustomTextFromField({
    required this.text,
    required this.fontSize,
    required this.color,
    required this.hint,
    this.icon_name,
    this.controller,
    this.focusNode,
    this.onSave,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: text,
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
        TextFormField(
          obscureText: obscureText,
          onSaved: onSave,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: icon_name,
              hintStyle: TextStyle(
                  color: Color(0xff6D6487),
                  fontSize: 15,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.normal),
              fillColor: Colors.white,
              border: InputBorder.none),
        ),
      ],
    ));
  }
}
