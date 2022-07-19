// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_profile.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/screens/login_page.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/patient_book_card.dart';
import 'package:medica/view/widgets/symptom_card.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';

class patient_book extends StatelessWidget {
  List book = [
    patientAppointmentCard(
        speciality: 'Orthopedist',
        numberOfDoctor: '20 ',
        description: 'The point of using Lor Ipsum letters...'),
    patientAppointmentCard(
        speciality: 'Dentist',
        numberOfDoctor: '20 ',
        description: 'The point of using Lor Ipsum letters...'),
    patientAppointmentCard(
        speciality: 'Ear Nose Throat',
        numberOfDoctor: '20 ',
        description: 'The point of using Lor Ipsum letters...'),
    patientAppointmentCard(
        speciality: 'Pediatrain',
        numberOfDoctor: '20 ',
        description: 'The point of using Lor Ipsum letters...'),
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
                      SvgPicture.asset(
                        'assets/images/appointment.svg',
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: size.width * 0.03),
                          child: picture != ''
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(picture))
                              : CircleAvatar(backgroundColor: Colors.green)),
                      CustomText(
                        text: name,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                ],
              ),
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      // right: size.width * 0.08,
                      // left: size.width * 0.08,
                      top: size.height * 0.04,
                    ),
                    // color: Colors.green,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        // topRight: Radius.circular(10),
                      ),
                      color: whitegrayish,
                    ),
                    height: size.height * 0.86,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          // padding: EdgeInsets.only(bot),
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          child: Wrap(
                            // alignment: WrapAlignment.start,
                            // direction: Axis.horizontal,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  right: size.width * 0.08,
                                  left: size.width * 0.08,
                                ),
                                child: CustomText(
                                  textAlign: TextAlign.left,
                                  text:
                                      "Book Appointments with Top Specialists!",
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
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          // width: double.infinity,
                          // color: Colors.amber,
                          height: size.height * 0.65,
                          child: SingleChildScrollView(
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              // crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                book[0],
                                book[1],
                                book[2],
                                book[3],
                                book[3],
                                book[3],
                                book[3],
                                book[3],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
                                  color: primaryColorOutOfFocus,
                                ),
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
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/clipboardNavBarHome.svg'),
                                SizedBox(
                                  height: size.height * 0.008,
                                ),
                                CustomText(
                                  text: 'Consult',
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
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
