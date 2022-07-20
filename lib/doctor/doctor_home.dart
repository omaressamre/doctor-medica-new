// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unnecessary_new, empty_constructor_bodies

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/doctor/doctor_getstarted.dart';
import 'package:medica/doctor/doctor_login.dart';
import 'package:medica/doctor/doctor_profile_navpage.dart';
import 'package:medica/doctor/selectSpeciality.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class doctor_home extends StatelessWidget {
  doctor_home() : _name = "DEFAULT";

  doctor_home.withuser(this._name);

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
        Get.to(() => doctor_getstarted());
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
                      Image.asset('assets/images/Menu.png'),
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'What are you looking for?',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: size.width * 0.04,
                    endIndent: size.width * 0.06,
                    thickness: 1,
                    height: 1,
                  ),
                ],
              ),
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomPaint(
                  size: Size(
                      double.infinity,
                      (size.height * 0.45 * 1.9280575539568345)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: HomeCurve(),
                ),
              ]),
              Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.26,
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
                            Wrap(spacing: 10, children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                // child: depts[0],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                // child: depts[1],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                // child: depts[2],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                // child: depts[3],
                              ),
                            ]),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    maximumSize: Size(
                                        double.infinity, size.height * 0.085),
                                    minimumSize: Size(
                                        double.infinity, size.height * 0.085),
                                    // minimumSize: ,
                                    // foregroundColor: secondaryColor,
                                    backgroundColor: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)))),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/meds.svg'),
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
                                    maximumSize: Size(
                                        double.infinity, size.height * 0.085),
                                    minimumSize: Size(
                                        double.infinity, size.height * 0.085),
                                    // foregroundColor: secondaryColor,
                                    backgroundColor: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)))),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/search-for-symptoms.svg'),
                                      CustomText(
                                        text: 'Know about symptoms',
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 19),
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.white,
                                        minimumSize: Size(size.width * 0.38,
                                            size.height * 0.215),
                                        maximumSize: Size(size.width * 0.38,
                                            size.height * 0.215),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
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
                                                            Radius.circular(
                                                                50)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 2,
                                                          spreadRadius: 1,
                                                          offset:
                                                              Offset(0, 1.5))
                                                    ]),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.1,
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.white,
                                        minimumSize: Size(size.width * 0.38,
                                            size.height * 0.215),
                                        maximumSize: Size(size.width * 0.38,
                                            size.height * 0.215),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
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
                                                            Radius.circular(
                                                                50)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 2,
                                                          spreadRadius: 1,
                                                          offset:
                                                              Offset(0, 1.5))
                                                    ]),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.1,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                text: 'Online Consult!',
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
                  )),
            ]),
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
