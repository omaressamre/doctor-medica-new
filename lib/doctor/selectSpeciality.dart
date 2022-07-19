import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctor/doctor_register.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/speciality_icons_icons.dart';

// ignore_for_file: prefer_const_constructors, unused_field

class selectSpeciality extends StatelessWidget {
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
                              text: 'Select a Speciality',
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
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      height: size.height * 0.81,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Allergy and Immunology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.allergy,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Allergy and Immunology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Andrology and Male Infertility'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.andrology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Andrology and Male Infertility',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Audiology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.audiology,
                                    size: 22,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.035,
                                  ),
                                  CustomText(
                                    text: 'Audiology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Cardiology and Thoracic Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons
                                        .cardiology_and_thoracic_surgery,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Cardiology and Thoracic Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Cardiology and Vascular Disease'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons
                                        .cardiology_and_vascular_disease,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Cardiology and Vascular Disease',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Chest and Respiratory'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.chest,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Chest and Respiratory',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Dentistry'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.dentistry,
                                    size: 26,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Dentistry',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Dermatology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.dermatology,
                                    size: 25,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Dermatology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Diabetes and Endocrinology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons
                                        .gastroenterology_and_endoscopy,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Diabetes and Endocrinology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Diagnostic Radiology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.diagnostic_radiology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Diagnostic Radiology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Dietitian and Nutrition'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.dietitian_and_nutrition,
                                    size: 18,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: '  Dietitian and Nutrition',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Ear,Nose and Throat'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.ear_nose_throat,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Ear,Nose and Throat',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Family Medicine'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.family,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Family Medicine',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Gastroenterology and Endoscopy'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.gastroenterology,
                                    size: 25,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Gastroenterology and Endoscopy',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('General Practice'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.general_practice,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'General Practice',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('General Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.general,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'General Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Geriatrics'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.geriatrics,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Geriatrics',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Gynaecology and Infertility'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.gynaecology_and_infertility,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Gynaecology and Infertility',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Hematology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.hematology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Hematology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Hepatology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.hepatology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Hepatology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Internal Medicine'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.internal_medicine,
                                    size: 18,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  CustomText(
                                    text: 'Internal Medicine',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('IVF and Infertility'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.ivf,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'IVF and Infertility',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Laboratories'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.labortaries,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Laboratories',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Nephrology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.nephrology,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.035,
                                  ),
                                  CustomText(
                                    text: 'Nephrology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Neurology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.neurology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Neurology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Neurosurgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.neurosurgery,
                                    size: 22,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.035,
                                  ),
                                  CustomText(
                                    text: 'Neurosurgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Obesity and Laparoscopic Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.laparoscopic_,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Obesity and Laparoscopic Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Oncology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.oncology,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Oncology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Oncology Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.oncology,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Oncology Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Ophthamology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.opthalmology,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Ophthamology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Orthopedics'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.orthopedics,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Orthopedics',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Oncology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.oncology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Oncology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Osteopathy'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.physiotherapy,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Osteopathy',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Pain Managment'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.pain_management,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Pain Managment',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Pediatric Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.pediatrics,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Pediatric Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Pediatrics and New Born'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.pediatrics_and_new_born,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Pediatrics and New Born',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Phoniatrics'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.phoniatrics,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Phoniatrics',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register.getspeciality(
                                    'Physiotherapy and Sport Injuries'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.sport_injuries,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Physiotherapy and Sport Injuries',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Plastic Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.plastic_surgery,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Plastic Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Psychiatry'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.psychiatry,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Psychiatry',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Rheumatology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.rheumatology,
                                    size: 28,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Rheumatology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Spinal Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.spinal_surgery_2,
                                    size: 26,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Spinal Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() =>
                                    doctor_register.getspeciality('Urology'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.urology,
                                    size: 24,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Urology',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Get.to(() => doctor_register
                                    .getspeciality('Vascular Surgery'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  Icon(
                                    SpecialityIcons.vascular_surgery,
                                    size: 26,
                                    color: Color(0xffF95DDE),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.027,
                                  ),
                                  CustomText(
                                    text: 'Vascular Surgery',
                                    textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xff3E1E96),
                              indent: size.width * 0.02,
                              endIndent: size.width * 0.02,
                              height: 1,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.014,
                            ),
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
                      height: size.height * 0.035,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                    )
                  ],
                ),
              )
            ]),
          ])),
    );
  }
}
