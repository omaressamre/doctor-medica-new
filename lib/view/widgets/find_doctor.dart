// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/view/map.dart';

import 'constance.dart';
import 'custom_text.dart';

class FindDoctor extends StatelessWidget {
  String docName;
  String docSpec;
  String imageAddress;
  BoxFit imageFit;
  int experienceYears;
  double? lng, lat;
  final Function onPressed;
  FindDoctor({
    Key? key,
    required this.docName,
    required this.docSpec,
    required this.onPressed,
    this.imageAddress = 'assets/images/logo.png',
    this.imageFit = BoxFit.fitHeight,
    required this.experienceYears,
    this.lat,
    this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        bottom: size.height * 0.012,
      ),
      child: TextButton(
          onPressed: () {
            onPressed();
          },
          style: TextButton.styleFrom(
              // alignment: Alignment.centerLeft,
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, size.height * 0.09),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height * 0.12,
                    width: size.width * 0.28,
                    decoration: BoxDecoration(
                      color: Color(0xffF2EEFD),
                      image: DecorationImage(
                        fit: imageFit,
                        image: AssetImage(imageAddress),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      // top: 13,
                      // right: 10,
                      left: 10,
                    ),
                    width: size.width * 0.5,
                    // height: size.height * 0.12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: docName,
                              textAlign: TextAlign.left,
                              textStyle: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        Get.to(
                                            () => map.withlatlng(lat!, lng!));
                                      },
                                      icon: Icon(Icons.location_on_outlined))
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomText(
                          text: docSpec,
                          textAlign: TextAlign.left,
                          textStyle: TextStyle(
                            color: medicaCyan, fontSize: 13,
                            fontFamily: 'Inter',
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '$experienceYears+ years overall Exp.',
                              textStyle: TextStyle(
                                color: Color(0xffFF8F6A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Divider(
                  color: primaryColor.withAlpha(20),
                  indent: size.width * 0.01,
                  endIndent: size.width * 0.01,
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.36, size.height * 0.055),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                          backgroundColor: primaryColor,
                        ),
                        child: CustomText(
                            text: 'CHAT CONSULT',
                            textStyle: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 12))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.36, size.height * 0.055),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                          backgroundColor: medicaCyan,
                        ),
                        child: CustomText(
                            text: 'book appointment',
                            textStyle: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 13))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
