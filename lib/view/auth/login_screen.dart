// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:pesa/view/widgets/custom_text.dart';
// import 'package:pesa/view/widgets/custom_text_button.dart';
// import 'package:pesa/view/widgets/custom_text_form_field.dart';

// import '../../constance.dart';

// class loginScreen extends StatelessWidget {
//   const loginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   elevation: 0.0,
//       //   backgroundColor: Colors.white,
//       // ),

//       body: Padding(
//         padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 80,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(text: "Welcome", fontSize: 30),
//                 Text(
//                   "Sign Up",
//                   style: TextStyle(color: primaryColor, fontSize: 18),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             CustomText(
//               text: 'Sign in to continue',
//               fontSize: 14,
//               color: Colors.grey,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             CustomTextFromField(
//               text: 'Email',
//               hint: 'iamkareem@gmail.com',
//               onSave: (value) {},
//               validator: (value) {},
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomTextFromField(
//                 text: 'password',
//                 hint: '**********',
//                 onSave: (value) {},
//                 validator: (value) {}),
//             SizedBox(
//               height: 20,
//             ),
//             CustomText(
//               text: 'Forget Password?',
//               fontSize: 14,
//               alignment: Alignment.topRight,
//             ),
//             CustomButton(text: 'Sign in', onPressed: () {}),
//             SizedBox(
//               height: 20,
//             ),
//             CustomText(
//               text: '-OR-',
//               alignment: Alignment.center,
//             ),
//             TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 )),
//                 child: CustomText(
//                   text: '',
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
