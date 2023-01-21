import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/module/controller/cart_controller.dart';

import '../../../constant/colors.dart';
import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';


class HistoryDetails extends StatefulWidget {
  String cartId;
  HistoryDetails({Key? key, required this.cartId}) : super(key: key);

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  CartController cartController = Get.find<CartController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.getCartHeaderDetailsList(widget.cartId);
  }

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
          title: BigText(text: '${widget.cartId} details', color: AppColor.defWhite, size: 25,),

        ),
        body: Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => cartController.isLoading1.value
                  ? Center(child: CircularProgressIndicator(),)
                  : Expanded(
                  child: ListView.builder(
                      itemCount: cartController.listCartHeaderDetails.length,
                      itemBuilder: (context, index) {
                        var cartHeaderDetails = cartController.listCartHeaderDetails[index];
                        return Card(
                          elevation: 2,
                          color: AppColor.defWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: '${cartHeaderDetails['xitem']}', size: 20,),
                                SmallText(text: '${cartHeaderDetails['xdesc']}', size: 18,),
                                Row(
                                  children: [
                                    SmallText(text: '${cartHeaderDetails['xqty']} X', size: 25,),
                                    SmallText(text: ' ${cartHeaderDetails['xrate']} = ', size: 25,),
                                    SmallText(text: '${cartHeaderDetails['subTotal']}', size: 25, color: AppColor.defRed,),
                                    Icon(MdiIcons.currencyBdt, size: 25, color: AppColor.defRed,)
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      })
              ))
            ],
          ),
        ),
      ),
    );
  }
}
