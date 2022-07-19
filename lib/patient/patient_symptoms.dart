// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/allConstants/all_constants.dart';
import 'package:medica/doctor/doctor_profile.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/patient/doctor_profile.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_profile.dart';
import 'package:medica/patient/patient_register.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/symptoms/symptom1.dart';
import 'package:medica/symptoms/symptom2.dart';
import 'package:medica/symptoms/symptom3.dart';
import 'package:medica/symptoms/symptom4.dart';
import 'package:medica/symptoms/symptom5.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/catalog_products.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/find_doctor.dart';
import 'package:medica/view/widgets/symptom_card.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class patient_symptoms extends StatelessWidget {
  patient_symptoms() : _name = "DEFAULT";

  patient_symptoms.withuser(this._name);
  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  List symptoms = [
    symptomCard(
      primary: 'Diabetes',
      secondary: 'if you have any of the following...',
      imageAddress: 'assets/images/symptoms/diabetes.jpg',
      imageFit: BoxFit.fitWidth,
      onPressed: () {
        Get.to(() => symptom1());
      },
    ),
    symptomCard(
        primary: 'COVID-19',
        secondary: 'People with COVID-19 have had a wide...',
        imageAddress: 'assets/images/symptoms/covid.jpg',
        imageFit: BoxFit.fitWidth,
        onPressed: () {
          Get.to(() => symptom2());
        }),
    symptomCard(
        primary: 'Cancer',
        secondary: 'Signs and symptoms caused by cancer will...',
        imageAddress: 'assets/images/symptoms/cancer.jpg',
        imageFit: BoxFit.fitWidth,
        onPressed: () {
          Get.to(() => symptom3());
        }),
    symptomCard(
        primary: 'Heart disease',
        secondary: 'A buildup of fatty plaques in your arteries...',
        imageAddress: 'assets/images/symptoms/heart.jpg',
        imageFit: BoxFit.fitWidth,
        onPressed: () {
          Get.to(() => symptom4());
        }),
    symptomCard(
        primary: 'Bone disease',
        secondary: 'Most people who have Pagets disease...',
        imageAddress: 'assets/images/symptoms/bone.jpg',
        imageFit: BoxFit.fitWidth,
        onPressed: () {
          Get.to(() => symptom5());
        }),
  ];

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
        Get.to(() => patient_home());
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
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                  color: whitegrayish,
                ),
                // padding: EdgeInsets.only(
                //   // left: size.width * 0.08,
                //   // right: size.width * 0.08,
                //   // top: size.height * 0.05,
                // ),
                // color: Colors.green,
                height: size.height * 0.85,

                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          child: CustomText(
                            text: "Know about symptoms",
                            textStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: size.width * 0.08,
                        left: size.width * 0.08,
                      ),
                      height: size.height * 0.68,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            symptoms[0],
                            symptoms[1],
                            symptoms[2],
                            symptoms[3],
                            symptoms[4],
                          ],
                        ),
                      ),
                    ),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }
}
