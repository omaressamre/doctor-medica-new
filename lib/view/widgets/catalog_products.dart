import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/controllers/cart_controller.dart';
import 'package:medica/controllers/productController.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());

  CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Obx(
      
      () => Flexible(
        child: GridView.builder(

            // scrollDirection: ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // mainAxisExtent: 3,
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: ((size.width + size.height) / 2) * 0.016,
              mainAxisSpacing: ((size.width + size.height) / 2) * 0.016,
            ),
            scrollDirection: Axis.vertical,
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProductCard(index: index);
            }),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;

  CatalogProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
          // horizontal: 10,
          // vertical: 20,
          ),
      height: size.height * 0.0,
      // width: size.width * 0.38,
      // margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.008,
                  right: size.width * 0.02,
                  left: size.width * 0.02,
                ),
                height: size.height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                        productController.products[index].imageUrl,
                      ),
                    )),
              ),
              // CircleAvatar(
              //   radius: 40,
              //   backgroundImage: NetworkImage(
              //     productController.products[index].imageUrl,
              //   ),
              // ),
              SizedBox(height: size.height * 0.02),
              Container(
                child: Wrap(
                  children: [
                    Text(
                      productController.products[index].name,
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          fontFamily: 'DMSans'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  '\u1d31\u1d33\u1d3e${productController.products[index].price}',
                  style: TextStyle(
                    color: medicaCyan,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset('assets/icons/shopping-cart-right.svg'),
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width * 0.02,
                    ),
                    child: CustomText(
                      text: 'ADD TO CART',
                      textStyle: TextStyle(
                          fontFamily: 'inter',
                          color: Colors.white,
                          fontSize: 12),
                    ),
                  )
                ]),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                    backgroundColor: primarybutton,
                    // primary: Colors.transparent,
                    minimumSize: Size(double.infinity, size.height * .07)),
                onPressed: () {
                  cartController.addProduct(productController.products[index]);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
