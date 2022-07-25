// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unnecessary_new, empty_constructor_bodies

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medica/doctor/doctor_getstarted.dart';
import 'package:medica/doctor/doctor_login.dart';
import 'package:medica/doctor/doctor_profile_navpage.dart';
import 'package:medica/doctor/selectSpeciality.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/screens/catalog_screen.dart';
import 'package:medica/screens/home_page.dart';
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
import 'package:get/get.dart';

import '../allConstants/all_constants.dart';
import '../allConstants/color_constants.dart';
import '../allConstants/size_constants.dart';

class doctor_home extends StatefulWidget {
  doctor_home() : _name = "DEFAULT";

  doctor_home.withuser(this._name);

  String _name;

  @override
  State<doctor_home> createState() => _doctor_homeState();
}

class _doctor_homeState extends State<doctor_home> {
  String get name => widget._name;

  set name(String name) {
    widget._name = name;
  }

  // final numbers = List.generate(100, (index) => '$index');
  // final numbers = List.generate(100, (index) => '$index');
  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return SimpleDialog(
            backgroundColor: AppColors.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Exit Application',
                  style: TextStyle(color: AppColors.white),
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dimen_10),
            ),
            children: [
              vertical10,
              const Text(
                'Are you sure?',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: AppColors.white, fontSize: Sizes.dimen_16),
              ),
              vertical15,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: AppColors.spaceCadet),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  dynamic patientnames = [];
  late String? docname = auth.currentUser?.displayName;
  dynamic days = [];
  dynamic times = [];
  @override
  Widget build(BuildContext context) {
    var user_appointment_codes = [];

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

        return onBackPress();
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
              // padding: EdgeInsets.symmetric(
              //   horizontal: size.width * 0.05,
              // ),
              // color: Colors.green,
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
                      Icon(
                        ProfileIcons.logout,
                        color: Colors.white,
                        // textDirection: TextDirection.RTL
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(right: size.width * 0.03),
                                  child: picture != ''
                                      ? CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(picture))
                                      : CircleAvatar(
                                          backgroundColor: Colors.green)),
                              CustomText(
                                text: name,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: size.height * 0.86,
                decoration: BoxDecoration(
                    color: whitegrayish,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(75))),
                padding: EdgeInsets.only(
                  top: size.height * 0.04,
                  right: size.width * 0.08,
                  left: size.width * 0.08,
                ),
              )
            ]),
            Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.20,
                        right: size.width * 0.08,
                        left: size.width * 0.08,
                      ),
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: size.height * 0.01,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.baseline,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              CustomText(
                                text: 'Dashboard',
                                textStyle: TextStyle(
                                    color: primaryColor,
                                    fontSize: 22,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  maximumSize:
                                      Size(double.infinity, size.height * 0.12),
                                  minimumSize:
                                      Size(double.infinity, size.height * 0.12),
                                  // minimumSize: ,
                                  // foregroundColor: secondaryColor,
                                  backgroundColor: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              onPressed: () {
                                Get.to(() => MyAppointments());
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/appointment.svg",
                                      color: primaryColor,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    CustomText(
                                      text: 'My Appointments',
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      child: Image.asset(
                                          'assets/images/whiteArrow.png'),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.white,
                                minimumSize:
                                    Size(double.infinity, size.height * 0.215),
                                // maximumSize:
                                //     Size(double.infinity, size.height * 0.215),
                              ),
                              onPressed: () {
                                Get.to(() => CatalogScreen());
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        // child: Image.asset(
                                        //     'assets/images/doctor.jpg'),
                                        height: size.height * 0.2,
                                        // color: Colors.amber,
                                        decoration: BoxDecoration(
                                            // color: Colors.amber,
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: AssetImage(
                                                    'assets/images/pharmacy.jpg')),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(
                                              //     top: size.height * 0.1),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/medicine.svg',
                                                    // fit: BoxFit.,
                                                    height: size.height * 0.03,
                                                    color: primaryColor,
                                                  )
                                                ],
                                              ),
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 2,
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 1.5))
                                                  ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.01),
                                    padding: EdgeInsets.only(
                                        bottom: size.height * 0.02),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: 'Buy Medicine',
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  color: primaryColor),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text:
                                                  'The Most requested medications',
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Inter',
                                                  color: secondaryTextColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
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
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/homeNavBarHome.svg'),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Home',
                                textStyle: TextStyle(color: linkColor),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => HomePage());
                          },
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
                                  color: primaryColorOutOfFocus),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              CustomText(
                                text: 'Profile',
                                textStyle:
                                    TextStyle(color: primaryColorOutOfFocus),
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
