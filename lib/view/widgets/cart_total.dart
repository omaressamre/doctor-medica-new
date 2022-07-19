import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.put(CartController());
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        '\£${controller.total}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
