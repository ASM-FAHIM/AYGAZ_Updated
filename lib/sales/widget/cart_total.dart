import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import '../constant/colors.dart';
import '../constant/dimensions.dart';
import '../module/controller/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController cartController = Get.find();
  LoginController loginController = Get.find<LoginController>();
  String xCus;
  String xOrg;
  String xterritory;
  String xareaop;
  String xdivisionop;
  String xsubcat;

  CartTotal({
    Key? key,
    required this.xCus,
    required this.xOrg,
    required this.xterritory,
    required this.xareaop,
    required this.xdivisionop,
    required this.xsubcat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('=======${cartController.addedProducts.length}');
    print('=======${cartController.addedProducts}');
    return Obx(() =>
    cartController.addedProducts.isEmpty
        ? Container()
        : Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 30),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(MdiIcons.currencyBdt, size: 25, color: Colors.red,),
                BigText(text: '${cartController.totalPrice.value}', size: 25, color: Colors.red,),
              ],
            ),
          ),
          SizedBox(height:  20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: Dimensions.height50,
                width:  Dimensions.height150 - Dimensions.height20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.hardEdge,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (BuildContext context){
                      return ReusableAlert(cartController: cartController, xsp: loginController.data!.xsp, xCus: xCus, xOrg: xOrg, xterritory: xterritory, xareaop: xareaop, xdivisionop: xdivisionop, xsubcat: xsubcat);
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: AppColor.appBarColor,),
                  child:  BigText(text: 'Sync now', color: AppColor.defWhite,),
                ),
              ),
              SizedBox(width: 20,),

              Container(
                height: Dimensions.height50,
                width:  Dimensions.height150 - Dimensions.height10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.hardEdge,
                child: ElevatedButton(
                    onPressed: () async{
                     await cartController.insertToCart(loginController.data!.xsp, xCus, xOrg, xterritory, xareaop, xdivisionop, xsubcat,'Open');
                    },
                    style: ElevatedButton.styleFrom(primary: AppColor.appBarColor,),
                    child: cartController.saving.value
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Place order', color: AppColor.defWhite,),
                        SizedBox(width: 10,),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}

class ReusableAlert extends StatelessWidget {
  const ReusableAlert({
    Key? key,
    required this.cartController,
    required this.xsp,
    required this.xCus,
    required this.xOrg,
    required this.xterritory,
    required this.xareaop,
    required this.xdivisionop,
    required this.xsubcat,
  }) : super(key: key);

  final CartController cartController;
  final String xsp;
  final String xCus;
  final String xOrg;
  final String xterritory;
  final String xareaop;
  final String xdivisionop;
  final String xsubcat;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Text(
          'Instant upload',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Do you want to upload order now?',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'No',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: cartController.isSync.value
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(),
                )
                : Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            onPressed: () async{
              Navigator.pop(context);
              await cartController.syncNow(
                  xsp,
                  xCus,
                  xOrg,
                  xterritory,
                  xareaop,
                  xdivisionop,
                  xsubcat, context);
            },
          ),
        ],
      );
    });
  }
}