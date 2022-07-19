import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';

// ignore_for_file: prefer_const_constructors, unused_field

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          // Get.to(doctor_getstarted());
          Get.back();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'About us',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        topRight: Radius.circular(75)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                    left: size.width * 0.08,
                    right: size.width * 0.08,
                    // top: size.height * 0.05,
                  ),
                  // color: Colors.green,
                  height: size.height * 0.88,

                  width: double.infinity,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: 'Ahmed Nabil Mahran',
                                  textStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: 'Team Leader',
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    'Worked on the Back-end part and some parts of the Front-end coding,\nFull part of Machine-learning.',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: "Kareem Ayman Na'eem",
                                  textStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    'Worked on almost the entire Front-end Coding part and some parts of Back-end.',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: 'Omar Essam Mohamed',
                                  textStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    'Worked on the User-Interface Design (Adobe XD),\nWorked on some Front-end & Back-end parts.',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: 'Mai Farah Hanafy',
                                  textStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    'Worked on some parts of Front-end and Back-end,\nWorked on some parts of UI Design.',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                  text: 'Hadeer Ahmed',
                                  textStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    'Worked on almost the entire documentaion part.\n',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                      ]),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
