import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/patient/appointment_time.dart';
import 'package:medica/doctor/doctor_profile_navpage.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:medica/view/widgets/doctor_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'patient_home.dart';

class DoctorProfile extends StatefulWidget {
  DoctorProfile()
      // : _docname = "DEFAULT",
      //   _docspec = "DEFAULT",
      //   _docimageAddress = "assets/images/logo.png",
      //   _docexperience = 0,
      : _index = 0;

  // DoctorProfile.withdoctor(
  //     this._docname, this._docspec, this._docexperience, this._docimageAddress);
  DoctorProfile.index(
    this._index,
  );

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
  DateTime _selectedValue = DateTime.now();
  late int _index;
  // late String _docname;

  // String get name => _docname;

  // set name(String name) {
  //   _docname = name;
  // }

  int get index => _index;

  set index(int index) {
    _index = index;
  }

  // late String _docspec;

  // String get spec => _docspec;

  // set spec(String spec) {
  //   _docspec = spec;
  // }

  // late String _docimageAddress;

  // String get imageAddress => _docimageAddress;

  // set imageAddress(String imageAddress) {
  //   _docimageAddress = imageAddress;
  // }

  // late int _docexperience;

  // int get experience => _docexperience;

  // set experience(int experience) {
  //   _docexperience = experience;
  // }
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    final doctorController = Get.put(DoctorController());

    final Size size = MediaQuery.of(context).size;
    final db = FirebaseFirestore.instance;
    dynamic _msg = '';
    dynamic pname = null;
    dynamic _selected_doc = doctorController.doctor[widget._index].name;
    dynamic _selected_day = DateTime.now();
    var patients =
        double.parse(doctorController.doctor[widget._index].patients) / 1000;
    final user = FirebaseAuth.instance.currentUser;
    dynamic email = '';
    dynamic name = '';
    dynamic id = '';
    if (user != null) {
      email = user.email;
      name = user.displayName;
      id = user.uid;
      pname = user.displayName;
    }

    //  _selectedValue;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(doctorController
                                  .doctor[widget._index].imageAddress),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter)),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.3,
                        ),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        width: double.infinity,
                        // height: size.height * 0.65,
                        decoration: BoxDecoration(
                          color: whitegrayish,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(75),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.05),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.08),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 0.5,
                                    // color: Colors.green,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: doctorController
                                                  .doctor[widget._index].name,
                                              // textAlign: TextAlign.left,
                                              textStyle: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: doctorController
                                                    .doctor[widget._index]
                                                    .speciality,
                                                textStyle: TextStyle(
                                                  color: Colors.grey.shade500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.315,
                                    height: size.height * 0.065,
                                    // color: Colors.green.shade800,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              launch(
                                                  "tel:+2${doctorController.doctor[widget._index].phone}");
                                            },
                                            style: TextButton.styleFrom(
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                18))),
                                                minimumSize: Size(
                                                    ((size.height +
                                                            size.width / 2) *
                                                        0.055),
                                                    ((size.height +
                                                            size.width / 2) *
                                                        0.055)),
                                                backgroundColor:
                                                    Color(0xff00E160)),
                                            child: SvgPicture.asset(
                                                'assets/icons/phone.svg')),
                                        TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                18))),
                                                minimumSize: Size(
                                                    ((size.height +
                                                            size.width / 2) *
                                                        0.055),
                                                    ((size.height +
                                                            size.width / 2) *
                                                        0.055)),
                                                backgroundColor:
                                                    Color(0xffF1AF05)),
                                            child: SvgPicture.asset(
                                                'assets/icons/chat.svg')),
                                        // TextButton(
                                        //     onPressed: () {},
                                        //     style: TextButton.styleFrom(
                                        //       backgroundColor: Color(0xffF1AF05),
                                        //       elevation: 5,
                                        //     ),
                                        //     child: SvgPicture.asset(
                                        //         'assets/icons/chat.svg')),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.015,
                                left: size.width * 0.08,
                                right: size.width * 0.08,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.055,
                                  vertical: size.height * 0.015),
                              // height: size.height * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Colors.white,
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset('assets/icons/Exp.svg',
                                            width: size.height * 0.022),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text: 'Experience',
                                          textStyle: TextStyle(
                                            color: primaryColor.withAlpha(120),
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text:
                                              // widget._docexperience.toString(),
                                              doctorController
                                                  .doctor[widget._index]
                                                  .experience,
                                          textStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: primaryColor.withAlpha(40),
                                      endIndent: 10,
                                      indent: 10,
                                      // width: 40,
                                      thickness: 1,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset('assets/icons/Pat.svg',
                                            width: size.height * 0.03),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text: 'Patients',
                                          textStyle: TextStyle(
                                            color: primaryColor.withAlpha(120),
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text:
                                              "${patients.toStringAsFixed(0)}K",
                                          textStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: primaryColor.withAlpha(40),
                                      endIndent: 10,
                                      indent: 10,
                                      // width: 40,
                                      thickness: 1,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Certi.svg',
                                            width: size.height * 0.022),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text: 'Certification',
                                          textStyle: TextStyle(
                                            color: primaryColor.withAlpha(120),
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        CustomText(
                                          text: doctorController
                                              .doctor[widget._index]
                                              .certificates,
                                          textStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.015,
                                left: size.width * 0.08,
                                right: size.width * 0.08,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: 'Schedule',
                                        textStyle: TextStyle(
                                          color: primaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: size.height * 0.015,
                                      left: size.width * 0.02,
                                      right: size.width * 0.02,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        DatePicker(
                                          DateTime.now(),
                                          initialSelectedDate: DateTime.now(),
                                          daysCount: 7,
                                          selectionColor: secondaryColor,
                                          selectedTextColor: Colors.white,
                                          deactivatedColor: Colors.white,
                                          dayTextStyle: TextStyle(
                                            color: Color(0xffFF8F6A),
                                          ),
                                          onDateChange: (date) {
                                            // New date selected
                                            setState(() {
                                              widget._selectedValue = date;
                                              print(widget._selectedValue
                                                  .toString());
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   alignment: Alignment.topLeft,
                            //   margin: EdgeInsets.only(
                            //     top: size.height * 0.015,
                            //     left: size.width * 0.08,
                            //     right: size.width * 0.08,
                            //   ),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       CustomText(
                            //         text: 'Visiting Hours',
                            //         textStyle: TextStyle(
                            //           color: primaryColor,
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //     margin: EdgeInsets.only(
                            //       left: size.width * 0.08,
                            //       top: size.height * 0.02,
                            //     ),
                            //     child: appTime(
                            //       categories: [
                            //         "8:00AM",
                            //         "9:00AM",
                            //         "10:00AM",
                            //         "11:00AM",
                            //         "12:00PM",
                            //         "1:00PM",
                            //         "2:00PM",
                            //         "3:00PM",
                            //         "4:00PM",
                            //         "5:00PM",
                            //         "6:00PM",
                            //         "7:00PM",
                            //         "8:00PM",
                            //       ],
                            //     )),
                            Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.03,
                                left: size.width * 0.08,
                                right: size.width * 0.08,
                              ),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      final user =
                                          FirebaseAuth.instance.currentUser;
                                      var uid = user?.uid;
                                      db
                                          .collection('users')
                                          .doc(uid)
                                          .get()
                                          .then((value) {
                                        if (value.data() != null) {
                                          if (pname != null &&
                                              // description != null &&
                                              // _selected_doc != null &&
                                              widget._selectedValue != null) {
                                            var time = [0, 0];
                                            db.collection('appointments').add({
                                              'patient': pname,
                                              'patient_id': uid,
                                              'doctor': _selected_doc,
                                              'day': widget._selectedValue
                                                  .toString(),
                                              // 'disease': description,
                                              'status': 'pending',
                                              'timestamp':
                                                  FieldValue.serverTimestamp(),
                                              'time': time,
                                            }).then((value) {
                                              print(value.id);
                                              db
                                                  .collection('users')
                                                  .doc(uid)
                                                  .update({
                                                'appointments':
                                                    FieldValue.arrayUnion(
                                                        [value]),
                                                'doctorname':
                                                    FieldValue.arrayUnion(
                                                        [_selected_doc]),
                                                // 'patientname':
                                                //     FieldValue.arrayUnion(
                                                //         [pname]),
                                                'day': FieldValue.arrayUnion([
                                                  widget._selectedValue
                                                      .toString()
                                                ]),
                                              }).then((value) {
                                                print('success');
                                              }).catchError((e) => setState(() {
                                                        _msg = e.message;
                                                      }));
                                            }).catchError((e) => setState(() {
                                                  _msg = e.message;
                                                }));
                                          }
                                        } else {
                                          print('Fields can\'t be empty');
                                        }
                                      }).catchError((e) => print(e.toString()));
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25),
                                      )),
                                      backgroundColor: primaryColor,
                                      minimumSize: Size(
                                          double.infinity, size.height * 0.08),
                                    ),
                                    child: CustomText(
                                      text: "MAKE APPOINTMENT",
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
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
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
