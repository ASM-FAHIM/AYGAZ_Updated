import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/widget/small_text.dart';
import '../base/no_data_page.dart';
import '../constant/dimensions.dart';
import '../module/controller/cart_controller.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('------------------------------------------------------------');
    print('AddedProduct: ${controller.addedProducts}');
    print('------------------------------------------------------------');
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        height: Dimensions.height320 + Dimensions.height200 + Dimensions.height70,
        child: controller.addedProducts.isEmpty
            ? const Center(
            child: NoDataPage(text: 'No products added yet !',),
            )
            : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.addedProducts.length,
            itemBuilder: (BuildContext context, int index) {
              controller.addedProducts[index][0];
              controller.addedProducts[index][1];
              return CartProductsCard(
                  controller: controller,
                  xItem: controller.addedProducts[index][0],
                  qty: controller.addedProducts[index][1],
                  pDesc: controller.addedProducts[index][2],
                  pPrice: controller.addedProducts[index][3],
                  xUnit: controller.addedProducts[index][4],);
            }),
      );
    });
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final String xItem;
  final String qty;
  final String pDesc;
  final String pPrice;
  final String xUnit;

  const CartProductsCard(
      {Key? key,
        required this.controller,
        required this.xItem,
        required this.qty,
        required this.pDesc,
        required this.pPrice,
        required this.xUnit,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.green,
          boxShadow: const [
            BoxShadow(
              // color: Colors.greenAccent[200],
              offset: Offset(
                0.01,
                0.01,
              ),
              blurRadius: 1.10,
              spreadRadius: .05,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/gas.png'),
                  ),
                ),
                onTap: () {
                  controller.increment(xItem);
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pDesc,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(MdiIcons.currencyBdt, size: 25, color: Colors.red,),
                      SmallText(text: pPrice, size: 25, color: Colors.red,),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.decrement(xItem);
                      },
                      child: Icon(
                        MdiIcons.minusCircle,
                        size: 40,
                        color: AppColor.appBarColor,
                      ),
                    ),
                    Text(
                      '${qty}',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        // controller.generateSoNumber();
                        controller.increment(xItem);
                      },
                      child: Icon(
                        MdiIcons.plusCircle,
                        size: 40,
                        color: AppColor.appBarColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}