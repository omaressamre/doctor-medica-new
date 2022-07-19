// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/allConstants/all_constants.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_profile.dart';
import 'package:medica/patient/patient_register.dart';
import 'package:medica/patient/patient_symptoms.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/symptom_card.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class symptom1 extends StatelessWidget {
  symptom1() : _name = "DEFAULT";

  symptom1.withuser(this._name);
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
        Get.to(() => patient_symptoms());
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
                            textAlign: TextAlign.left,
                            text: "Diabetes Symptoms",
                            textStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 22,
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
                            Container(
                              padding: EdgeInsets.only(
                                right: size.width * 0.03,
                                left: size.width * 0.04,
                              ),
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "If you have any of the following diabetes symptoms, see your doctor about getting your blood sugar tested:",
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Container(
                              height: 150.0,
                              width: 250.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/symptoms/diabetes.jpg'),
                                      fit:BoxFit.fill
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                right: size.width * 0.09,
                                left: size.width * 0.02,
                              ),
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "\u2022 Urinate (pee) a lot, often at night. \n\u2022 Are very thirsty. \n\u2022 Lose weight without trying. \n\u2022 Are very hungry.  \n\u2022 Have blurry vision.  \n\u2022 Feel very tired.  \n\u2022 Have very dry skin.  \n\u2022 Have sores that heal slowly.  \n\u2022 Have more infections than usual. ",
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: " Symptoms of Type 1 Diabetes:",
                                    textStyle: TextStyle(
                                      color: Color.fromARGB(221, 56, 96, 182),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.only(
                                right: size.width * 0.03,
                                left: size.width * 0.04,
                              ),
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "People who have type 1 diabetes may also have nausea, vomiting, or stomach pains. Type 1 diabetes symptoms can develop in just a few weeks or months and can be severe. Type 1 diabetes usually starts when you’re a child, teen, or young adult but can happen at any age.",
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              child: Row(
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: " Symptoms of Type 2 Diabetes:",
                                    textStyle: TextStyle(
                                      color: Color.fromARGB(221, 56, 96, 182),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.only(
                                right: size.width * 0.03,
                                left: size.width * 0.04,
                              ),
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "Type 2 diabetes symptoms often take several years to develop. Some people don’t notice any symptoms at all. Type 2 diabetes usually starts when you’re an adult, though more and more children and teens are developing it. Because symptoms are hard to spot, it’s important to know the risk factors for type 2 diabetes. Make sure to visit your doctor if you have any of them.",
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              child: Row(
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: " Symptoms of Type 3 Diabetes:",
                                    textStyle: TextStyle(
                                      color: Color.fromARGB(221, 56, 96, 182),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.only(
                                right: size.width * 0.03,
                                left: size.width * 0.04,
                              ),
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "Gestational diabetes (diabetes during pregnancy) usually doesn’t have any symptoms. If you’re pregnant, your doctor should test you for gestational diabetes between 24 and 28 weeks of pregnancy. If needed, you can make changes to protect your health and your baby’s health.",
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
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
