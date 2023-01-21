import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/constant/dimensions.dart';
import 'package:aygazhcm/sales/module/controller/cart_controller.dart';
import 'package:aygazhcm/sales/module/view/history/order_history_details.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import '../../../widget/small_text.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.getCartHeaderList();
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
              )),
          title: BigText(text: "History", color: AppColor.defWhite, size: 25,),
          actions: [
             Obx(() => GestureDetector(
                    onTap: () {
                        cartController.uploadCartOrder();
                      },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: cartController.isUploading.value
                      ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.defWhite,),)
                      : const Icon(
                    MdiIcons.upload,
                    size: 30,
                  ),
                ))
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 10),
          child: Column(
            children: [
              Obx(() => cartController.isLoading.value
                   ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(color: AppColor.appBarColor,),
                          ),
                          Text('Loading...'),
                        ],
                      ),
                   )
                   : Expanded(
                      child: ListView.builder(
                          itemCount: cartController.listCartHeader.length,
                          itemBuilder: (context, index) {
                            var cartHeader = cartController.listCartHeader[index];
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BigText(text: '${cartHeader['cartID']}', size: 20,),
                                        BigText(text: '${cartHeader['xorg']}', size: 18,),
                                        SmallText(text: '${cartHeader['xcus']}'),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SmallText(text: '${cartHeader['total']}', size: 30, color: AppColor.defRed,),
                                            const Icon(MdiIcons.currencyBdt, color: AppColor.defRed, size: 30,),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        cartController.getCartHeaderDetailsList('${cartHeader['cartID']}');
                                        Get.to(() => HistoryDetails(cartId: '${cartHeader['cartID']}'));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Card(
                                          color: AppColor.appBarColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                          ),
                                          elevation: 5,
                                          child: Container(
                                            height: Dimensions.height45,
                                            width: Dimensions.height60 + Dimensions.height45,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SmallText(text: 'Details', size: 20,color: Colors.white,),
                                                Icon(MdiIcons.arrowRightBold,color: Colors.black, )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          );
                        }
                      )
                   )
              )
            ],
          ),
        ),
      ),
    );
  }
}
