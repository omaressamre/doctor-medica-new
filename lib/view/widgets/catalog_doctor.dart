import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctor/doctor_profile.dart';
import 'package:medica/patient/doctor_profile.dart';
import 'package:medica/view/widgets/constance.dart';
// import 'package:medica/doctorfirebasetest/doctor_controller.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/doctor_controller.dart';
import 'package:medica/view/map.dart';

// import '../view/widgets/constance.dart';

class CatalogDoctor extends StatelessWidget {
  final doctorController = Get.put(DoctorController());

  CatalogDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: doctorController.doctor.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogDoctorCard(index: index);
            }),
      ),
    );
  }
}

class CatalogDoctorCard extends StatelessWidget {
  final cartController = Get.put(DoctorController());
  final DoctorController doctorController = Get.find();
  final int index;

  CatalogDoctorCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        bottom: size.height * 0.012,
      ),
      child: TextButton(
          onPressed: () {
            Get.to(DoctorProfile.index(index));
          },
          style: TextButton.styleFrom(
              // alignment: Alignment.centerLeft,
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, size.height * 0.09),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height * 0.12,
                    width: size.width * 0.28,
                    decoration: BoxDecoration(
                      color: Color(0xffF2EEFD),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          doctorController.doctor[index].imageAddress,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      // top: 13,
                      // right: 10,
                      left: 10,
                    ),
                    width: size.width * 0.5,
                    // height: size.height * 0.12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text:
                                  "Dr. ${doctorController.doctor[index].name}",
                              textAlign: TextAlign.left,
                              textStyle: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        Get.to(() => map.withlatlng(
                                            double.parse(doctorController
                                                .doctor[index].lat),
                                            double.parse(doctorController
                                                .doctor[index].long)));
                                      },
                                      icon: Icon(Icons.location_on_outlined))
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomText(
                          text: doctorController.doctor[index].speciality,
                          textAlign: TextAlign.left,
                          textStyle: TextStyle(
                            color: medicaCyan, fontSize: 13,
                            fontFamily: 'Inter',
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text:
                                  '${doctorController.doctor[index].experience} + years overall Exp.',
                              textStyle: TextStyle(
                                color: Color(0xffFF8F6A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Divider(
                  color: primaryColor.withAlpha(20),
                  indent: size.width * 0.01,
                  endIndent: size.width * 0.01,
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.36, size.height * 0.055),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                          backgroundColor: primaryColor,
                        ),
                        child: CustomText(
                            text: 'CHAT CONSULT',
                            textStyle: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 12))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.36, size.height * 0.055),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                          backgroundColor: medicaCyan,
                        ),
                        child: CustomText(
                            text: 'book appointment',
                            textStyle: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 13))),
                  ],
                ),
              )
            ],
          )),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 20,
    //     vertical: 10,
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       CircleAvatar(
    //         radius: 40,
    //         backgroundImage: NetworkImage(
    //           doctorController.doctor[index].imageAddress,
    //         ),
    //       ),
    //       SizedBox(width: 20),
    //       Expanded(
    //         child: Text(
    //           doctorController.doctor[index].name,
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 18,
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Text('${doctorController.doctor[index].speciality}'),
    //       ),
    //       // IconButton(
    //       //   onPressed: () {},
    //       //   icon: Icon(
    //       //     Icons.add_circle,
    //       //   ),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
