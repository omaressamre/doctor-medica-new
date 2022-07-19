import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';

class doctorProfile extends StatelessWidget {
  const doctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                              image: AssetImage('assets/images/wearMask.jpg'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      width: double.infinity,
                      height: size.height * 0.68,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            text: 'Dr.Ellie',
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
                                              text:
                                                  'Dentist (MDS . Orthodontics and Dentofacial',
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(18))),
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
                                                          Radius.circular(18))),
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
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
