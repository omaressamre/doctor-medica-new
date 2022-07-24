// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unnecessary_new, empty_constructor_bodies

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:medica/screens/home_page.dart';
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
                                text: 'New patients',
                                textStyle: TextStyle(
                                    color: primaryColor,
                                    fontSize: 22,
                                    fontFamily: 'DMSans',
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

                          SizedBox(
                            height: size.height * 0.015,
                          ),
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
                              children: [],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            // Container(
            //   padding: EdgeInsets.only(
            //     right: size.width * 0.08,
            //     left: size.width * 0.08,
            //   ),
            //   child: StreamBuilder(
            //       stream: store
            //           .collection('appointments')
            //           .where('user',
            //               isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            //           .snapshots(),
            //       builder: (context, snapshot) {
            //         if (!snapshot.hasData) {
            //           store
            //               .collection('doctors')
            //               .doc(FirebaseAuth.instance.currentUser?.uid)
            //               .get()
            //               .then((value) {
            //             user_appointment_codes = value.data()?['appointments'];
            //             patientnames = value.data()?['patientname'];
            //             docname = user?.displayName as String;
            //             days = value.data()?['day'];
            //           });
            //           return Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //         // user_appointment_codes = FirebaseFirestore.instance.collection('appointments').doc()
            //         int index = 0;
            //         print(user_appointment_codes);
            //         if (user_appointment_codes == null) {
            //           return Center(child: Text("No Appointments Found"));
            //         } else {
            //           return ListView.builder(
            //               itemCount: user_appointment_codes.length,
            //               itemBuilder: (BuildContext context, index) {
            //                 return Card(
            //                   child: ListTile(
            //                     leading: Icon(Icons.calendar_today),
            //                     title: Text(
            //                       patientnames[index],
            //                       style: TextStyle(fontSize: 18),
            //                     ),
            //                     trailing: Text(
            //                       days[index],
            //                       style: TextStyle(
            //                           fontSize: 15, color: Colors.greenAccent),
            //                     ),
            //                   ),
            //                 );
            //               });
            //         }
            //       }),
            // ),
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
