import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constance.dart';
import 'custom_text.dart';

class patientAppointmentCard extends StatelessWidget {
  String speciality;
  String numberOfDoctor;
  String description;
  String imageaddress;
  BoxFit imageFit;
  patientAppointmentCard({
    Key? key,
    required this.speciality,
    required this.numberOfDoctor,
    required this.description,
    this.imageaddress = 'assets/images/logo.png',
    this.imageFit = BoxFit.fitHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        right: size.width * 0.01,
        left: size.width * 0.01,
        bottom: size.height * 0.01,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: primaryColorShadow,
            blurRadius: 300,
            // spreadRadius: 1,
            // blurStyle: BlurStyle.normalc,
            offset: Offset(0, 60))
      ]),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
              minimumSize: Size(size.width * 0.393, size.height * 0.25),
              maximumSize: Size(size.width * 0.393, size.height * 0.25),
              padding: EdgeInsets.all(8)),
          onPressed: () {},
          child: Column(
            children: [
              Container(
                height: size.height * 0.13,
                // color: Colors.amber,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: AssetImage(imageaddress),
                      fit: imageFit,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  CustomText(
                    text: speciality,
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/Doc.svg'),
                  CustomText(
                    text: " " + numberOfDoctor + "Doctors available",
                    textStyle: TextStyle(
                      fontSize: 12,
                      // fontFamily: 'Inter',
                      color: medicaCyan,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Wrap(
                children: [
                  CustomText(
                    text: description,
                    textAlign: TextAlign.left,
                    textStyle: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
