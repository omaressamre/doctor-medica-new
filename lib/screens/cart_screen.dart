import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/view/widgets/cart_products.dart';
import 'package:medica/view/widgets/cart_total.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';

import '../controllers/cart_controller.dart';
import '../patient/patient_home.dart';
import '../patient/patient_profile.dart';
import '../view/widgets/custom_background.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.put(CartController());

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
        Get.back();
        return true;
      },
      child: Scaffold(
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
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
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
                      top: size.height * 0.021,
                    ),
                    // color: Colors.green,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        // topRight: Radius.circular(10),
                      ),
                      color: whitegrayish,
                    ),
                    height: size.height * 0.88,
                    width: double.infinity,
                    child: Column(
                      children: [
                        CartProducts(),
                        Container(
                          margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Order Summary',
                                    textStyle: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'dmsans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                height: size.height * 0.04,
                                thickness: 1,
                                color: primaryColor.withAlpha(100),
                                // endIndent: size.width * 0.04,
                                // indent: size.width * 0.04,
                                // indent: 0,
                                // endIndent: 0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Subtotal',
                                    textStyle: TextStyle(
                                      color: Color(0xff938BA5),
                                      fontFamily: 'inter',
                                    ),
                                  ),
                                  Obx(
                                    () => CustomText(
                                      text: '\£${controller.total}',
                                      textStyle: TextStyle(
                                        color: Color(0xff938BA5),
                                        fontFamily: 'inter',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Shipping',
                                    textStyle: TextStyle(
                                      color: Color(0xff938BA5),
                                      fontFamily: 'inter',
                                    ),
                                  ),
                                  CustomText(
                                    text: 'Free',
                                    textStyle: TextStyle(
                                      color: Color(0xff938BA5),
                                      fontFamily: 'inter',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Total',
                                    textStyle: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'dmsans',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 17),
                                  ),
                                  Obx(
                                    () => CustomText(
                                      text: '\£${controller.total}',
                                      textStyle: TextStyle(
                                          color: secondaryColor,
                                          fontFamily: 'dmsans',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: primarybutton,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )),
                                      minimumSize: Size(
                                        double.infinity,
                                        size.height * 0.062,
                                      )),
                                  onPressed: () {},
                                  child: CustomText(
                                    text: 'PROCEED TO CHECKOUT',
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
                            SvgPicture.asset('assets/images/UserNavBarHome.svg',
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
            ]),
          ],
        ),
      ),
    );
  }
}
//     return Scaffold(
//       appBar: AppBar(title: Text("Your Cart")),
//       body: Column(
//         children: [
          // CartProducts(),
//           CartTotal(),
//         ],
//       ),
//     );
//   }
// }
