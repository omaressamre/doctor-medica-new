// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unnecessary_new, empty_constructor_bodies

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/patient/find_doctor_near.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/doctor/doctor_profile_navpage.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/profile_icons_icons.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class patient_profiledata extends StatelessWidget {
  /*  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }*/

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    dynamic email = '';
    dynamic name = '';
    dynamic picture = '';
    if (user != null) {
      email = user.email;
      name = user.displayName;
      picture = user.photoURL;
    }
    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        Get.to(() => doctor_profilenav());
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/images/appointment.svg',
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: name,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: size.height * 0.87,
                  decoration: BoxDecoration(
                      color: profilegrey,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(75))),
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    right: size.width * 0.08,
                    left: size.width * 0.08,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          CustomText(
                            text: '   Username',
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                                color: Color(0xff300C92),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextButton(
                          style: TextButton.styleFrom(
                            maximumSize:
                                Size(double.infinity, size.height * 0.070),
                            minimumSize:
                                Size(double.infinity, size.height * 0.070),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                //side:
                                // BorderSide(
                                //   color: Colors.grey,
                                //   width: 1,
                                //   style: BorderStyle.solid
                                //   ),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          onPressed: null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/images/User.svg'),
                                SizedBox(width: size.width * 0.04),
                                CustomText(
                                  text: name,
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: size.height * 0.04),
                      Row(
                        children: [
                          CustomText(
                            text: '   Email',
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                                color: Color(0xff300C92),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextButton(
                          style: TextButton.styleFrom(
                            maximumSize:
                                Size(double.infinity, size.height * 0.070),
                            minimumSize:
                                Size(double.infinity, size.height * 0.070),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                //   side:
                                // BorderSide(
                                //   color: Colors.grey,
                                //   width: 1,
                                //   style: BorderStyle.solid
                                //   ),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          onPressed: null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/images/Mail.svg'),
                                SizedBox(width: size.width * 0.04),
                                CustomText(
                                  text: email,
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: size.height * 0.41),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.040),
                          CustomText(
                            text: 'Version 1.0',
                            textStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 9,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
////////////////////////////////////////////navigation////////////////////////////////////////////////////////
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // padding: EdgeInsets.only(
                  //   top: size.height * 0.02,
                  //   right: size.width * 0.1,
                  //   left: size.width * 0.1,
                  // ),
                  width: double.infinity,
                  height: size.height * 0.080,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(() => patient_home());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/homeNavBarHome.svg',
                                  color: primaryColorOutOfFocus),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Home',
                                textStyle:
                                    TextStyle(color: primaryColorOutOfFocus),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => patient_book());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/clipboardNavBarHome.svg',
                                  color: primaryColorOutOfFocus),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Consult',
                                textStyle:
                                    TextStyle(color: primaryColorOutOfFocus),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/message-circleNavBarHome.svg',
                                  color: primaryColorOutOfFocus),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Chat',
                                textStyle:
                                    TextStyle(color: primaryColorOutOfFocus),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => doctor_profilenav());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/UserNavBarHome.svg',
                              ),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Profile',
                                textStyle: TextStyle(color: linkColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
