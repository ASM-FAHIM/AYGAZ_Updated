import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/module/controller/dashboard_controller.dart';
import 'package:aygazhcm/sales/module/view/order_process/product_list_screen.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import 'package:aygazhcm/sales/widget/small_text.dart';
import '../../../constant/dimensions.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  TextEditingController name = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.getDealerList();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                size: 25,)
          ),
          title: BigText(text: "Dealers", color: AppColor.defWhite, size: 25,),

        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }else{
                      List<String> matches = <String>[];
                      matches.addAll(dashboardController.dealerName);

                      matches.retainWhere((s){
                        return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                      return matches;
                    }
                  },
                  onSelected: (String selection) {
                    dashboardController.dealersName.value = selection;
                    dashboardController.getDealerListByName();
                    print('You just selected ${dashboardController.dealersName.value}');
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: dashboardController.dealerListByName.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: SizedBox(
                          height: Dimensions.height50 + Dimensions.height20,
                          child: ListTile(
                            onTap: (){
                              Get.to(() => ProductsScreen(
                                xcus: dashboardController.dealerListByName[index]['xcus'].toString(),
                                xOrg: dashboardController.dealerListByName[index]['xorg'].toString(),
                                xterritory: dashboardController.dealerListByName[index]['xterritory'].toString(),
                                xareaop: dashboardController.dealerListByName[index]['xareaop'].toString(),
                                xdivisionop: dashboardController.dealerListByName[index]['xdivisionop'].toString(),
                                xsubcat: dashboardController.dealerListByName[index]['xsubcat'].toString(),
                              ));
                            },
                            tileColor: AppColor.appBarColor,
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: dashboardController.dealerListByName[index]['xorg'].toString(), size: 16, color: AppColor.defWhite,)
                              ],),
                            subtitle: Column(
                              children: [
                                Row (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(text: dashboardController.dealerListByName[index]['xcus'], size: 14,),
                                    SmallText(text: dashboardController.dealerListByName[index]['xterritory'], size: 14,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
ListView.builder(
itemCount: dashboardController.list.length,
itemBuilder: (context, index) {
return Padding(
padding: const EdgeInsets.only(top: 5, bottom: 5),
child: SizedBox(
height: Dimensions.height50 + Dimensions.height20,
child: ListTile(
onTap: (){
Get.to(() => ProductsScreen(
xcus: dashboardController.list[index]['xcus'].toString(),
xOrg: dashboardController.list[index]['xorg'].toString(),
xterritory: dashboardController.list[index]['xterritory'].toString(),
xareaop: dashboardController.list[index]['xareaop'].toString(),
xdivisionop: dashboardController.list[index]['xdivisionop'].toString(),
xsubcat: dashboardController.list[index]['xsubcat'].toString(),
));
},
tileColor: AppColor.appBarColor,
title: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
BigText(text: dashboardController.list[index]['xorg'].toString(), size: 16, color: AppColor.defWhite,)
],),
subtitle: Column(
children: [
Row (
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
SmallText(text: dashboardController.list[index]['xcus'], size: 14,),
SmallText(text: dashboardController.list[index]['xterritory'], size: 14,),
],
),
],
),
),
),
);
})*/
