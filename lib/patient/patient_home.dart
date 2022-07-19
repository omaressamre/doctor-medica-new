// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unnecessary_new, empty_constructor_bodies

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/Covid19Detector.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/patient/find_doctor_near.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/patient/patient_getstarted.dart';
import 'package:medica/patient/patient_profile.dart';
import 'package:medica/patient/patient_register.dart';
import 'package:medica/patient/patient_symptoms.dart';
import 'package:medica/screens/catalog_screen.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/screens/login_page.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';

class patient_home extends StatelessWidget {
  patient_home() : _name = "DEFAULT";

  patient_home.withuser(this._name);

  List depts = [
    Depts(
      deptName: 'Cardio',
      icon: 'assets/images/depts/Cardio.png',
      onPressed: () {
        Get.to(() => patient_find());
      },
    ),
    Depts(
      deptName: 'Biochem',
      icon: 'assets/images/depts/BioChem.png',
      onPressed: () {
        Get.to(() => patient_symptoms());
      },
    ),
    Depts(
      deptName: 'Research',
      icon: 'assets/images/depts/Research.png',
      onPressed: () {
        Get.to(() => patient_book());
      },
    ),
    Depts(
      deptName: 'Neurology',
      icon: 'assets/images/depts/Neurology.png',
      onPressed: () {},
    ),
  ];

  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  // final numbers = List.generate(100, (index) => '$index');

//   Widget buildGridView() => GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//         itemCount: numbers.length,
//         itemBuilder: (context, index) {
//           final item = numbers[index];
//           return buildNumber(item);
//         },
//       );
//   Widget buildNumber(String number) => Container(
//     child: GridTile(header: Text,),
//   );

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
        Get.to(() => patient_getstarted());
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
                      Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => MyAppointments());
                                },
                                child: SvgPicture.asset(
                                  'assets/images/appointment.svg',
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                      Column(
                        children: [
                          Image.asset('assets/images/Notify.png'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: size.height * 0.86,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(75))),
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    right: size.width * 0.08,
                    left: size.width * 0.08,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            text: 'Departments',
                            textStyle: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      // SizedBox(
                      //   height: size.height * 0.01,
                      // ),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            depts[0],
                            depts[1],
                            depts[2],
                            depts[3],
                            depts[3],
                            depts[3],
                            depts[3],
                            depts[3],
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              maximumSize:
                                  Size(double.infinity, size.height * 0.085),
                              minimumSize:
                                  Size(double.infinity, size.height * 0.085),
                              // minimumSize: ,
                              // foregroundColor: secondaryColor,
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            Get.to(() => Covid19Detector());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/covid4.svg",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.scaleDown,
                                ),
                                CustomText(
                                  text: 'Covid-19 Detector',
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
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
                        height: size.height * 0.015,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              maximumSize:
                                  Size(double.infinity, size.height * 0.085),
                              minimumSize:
                                  Size(double.infinity, size.height * 0.085),
                              // minimumSize: ,
                              // foregroundColor: secondaryColor,
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            Get.to(() => CatalogScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/images/meds.svg'),
                                CustomText(
                                  text: 'Buy Medicines',
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
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
                        height: size.height * 0.015,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              maximumSize:
                                  Size(double.infinity, size.height * 0.082),
                              minimumSize:
                                  Size(double.infinity, size.height * 0.082),
                              // foregroundColor: secondaryColor,
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            Get.to(() => patient_symptoms());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/search-for-symptoms.svg'),
                                CustomText(
                                  text: 'Know about symptoms',
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
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
                      SizedBox(height: size.height * 0.02),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: primaryColorShadow,
                              blurRadius: 70,
                              spreadRadius: 15,
                              // blurStyle: BlurStyle.normalc,
                              offset: Offset(0, 60))
                        ]),
                        child: Wrap(
                          spacing: 20,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                      size.width * 0.38, size.height * 0.215),
                                  maximumSize: Size(
                                      size.width * 0.38, size.height * 0.215),
                                ),
                                onPressed: () {
                                  Get.to(() => patient_find());
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          // child: Image.asset(
                                          //     'assets/images/doctor.jpg'),
                                          height: size.height * 0.13,
                                          // color: Colors.amber,
                                          decoration: BoxDecoration(
                                              // color: Colors.amber,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/doctor.jpg')),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/Map.svg')
                                                ],
                                              ),
                                              height: 30,
                                              width: 30,
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'Find Doctors',
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'The points of using to',
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              color: secondaryTextColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                      size.width * 0.38, size.height * 0.215),
                                  maximumSize: Size(
                                      size.width * 0.38, size.height * 0.215),
                                ),
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          // child: Image.asset(
                                          //     'assets/images/doctor.jpg'),
                                          height: size.height * 0.13,
                                          // color: Colors.amber,
                                          decoration: BoxDecoration(
                                              // color: Colors.amber,
                                              image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: AssetImage(
                                                      'assets/images/onlineConsult.jpg')),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/video.svg')
                                                ],
                                              ),
                                              height: 30,
                                              width: 30,
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'Online consult',
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'The points of using to',
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              color: secondaryTextColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
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
                            Get.to(() => patient_profile());
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
