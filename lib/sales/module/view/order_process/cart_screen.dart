import 'package:flutter/material.dart';
import 'package:aygazhcm/sales/base/no_data_page.dart';
import 'package:aygazhcm/sales/module/controller/cart_controller.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import '../../../constant/colors.dart';
import 'package:get/get.dart';
import '../../../widget/cart_products.dart';
import '../../../widget/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartController cartController = Get.find<CartController>();
  String xcus;
  String xOrg;
  String xterritory;
  String xareaop;
  String xdivisionop;
  String xsubcat;
  CartScreen({
    Key? key,
    required this.xcus,
    required this.xOrg,
    required this.xterritory,
    required this.xareaop,
    required this.xdivisionop,
    required this.xsubcat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
            ),
          ),
          title: BigText(
            text: 'Your Cart',
            color: AppColor.defWhite,
            size: 25,
          ),
          actions: [
            SizedBox(
              width: 107,
              child: Obx(() => DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: AppColor.appBarColor,
                value: cartController.dropDownValue.value,
                onChanged: (String? newValue) {
                  cartController.dropDownValue.value = newValue!;
                  print('Selected DropDown value is : ${cartController.dropDownValue.value}');
                },
                items: <String>[
                  "Any time",
                  "Morning",
                  "Evening"].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
              )),
            ),
          ],
        ),
        body: cartController.addedProducts.isEmpty
            ? const NoDataPage(text: 'No products added yet !')
            : Column(
                children: [
                  CartProducts(),
                  CartTotal(
                    xCus: xcus,
                    xOrg: xOrg,
                    xterritory: xterritory,
                    xareaop: xareaop,
                    xdivisionop: xdivisionop,
                    xsubcat: xsubcat,
                  )
                ],
              ),
      ),
    );
  }
}
