import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/doctor/doctor_home.dart';
import 'package:medica/myAppointments.dart';
import 'package:medica/screens/cart_screen.dart';
import 'package:medica/screens/home_page.dart';
import 'package:medica/view/widgets/catalog_products.dart';

import '../doctor/doctor_profile_navpage.dart';
import '../view/widgets/constance.dart';
import '../view/widgets/custom_background.dart';
import '../view/widgets/custom_text.dart';
import '../view/widgets/profile_icons_icons.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

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
        Get.to(() => doctor_home());
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MyAppointments());
                        },
                        child: Icon(
                          ProfileIcons.logout,
                          color: Colors.white,
                          // textDirection: TextDirection.RTL
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
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
                      TextButton(
                        onPressed: () {
                          Get.to(() => CartScreen());
                        },
                        child: SvgPicture.asset(
                          'assets/icons/shopping-cart.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                      )
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
                          margin: EdgeInsets.only(bottom: size.height * 0.02),
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
                                  text: 'Popular Products',
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
                        Scrollbar(
                          child: Container(
                            padding: EdgeInsets.only(
                              right: size.width * 0.08,
                              left: size.width * 0.08,
                            ),
                            // width: double.infinity,
                            // color: Colors.amber,
                            height: size.height * 0.65,
                            child: Column(
                              // alignment: WrapAlignment.spaceBetween,
                              // crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                CatalogProducts(),
                              ],
                            ),
                          ),
                        ),
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
                          Get.to(() => doctor_home());
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
// SafeArea(
//         child: Column(
//           children: [
//             CatalogProducts(),
//             ElevatedButton(
//               onPressed: () => Get.to(() => CartScreen()),
//               child: Text('Go to Cart'),
//             ),
//           ],
//         ),
//       ),