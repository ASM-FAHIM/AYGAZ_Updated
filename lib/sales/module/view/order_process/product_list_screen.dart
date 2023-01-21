import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/constant/dimensions.dart';
import 'package:aygazhcm/sales/module/controller/cart_controller.dart';
import 'package:aygazhcm/sales/module/controller/dashboard_controller.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import 'package:aygazhcm/sales/widget/small_text.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  String xcus;
  String xOrg;
  String xterritory;
  String xareaop;
  String xdivisionop;
  String xsubcat;

  ProductsScreen({
    Key? key,
    required this.xcus,
    required this.xOrg,
    required this.xterritory,
    required this.xareaop,
    required this.xdivisionop,
    required this.xsubcat,
  })
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  CartController cartController = Get.put(CartController());
  DashboardController dashboardController = Get.put(DashboardController());
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.getProductList();
    print('-------------------------');
    print('${dashboardController.productList.length}');
    print('-------------------------');
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
          title: BigText(
            text: "Products",
            color: AppColor.defWhite,
            size: 25,
          ),
          /*actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => CartScreen(
                      xcus: widget.xcus,
                      xOrg: widget.xOrg,
                      xterritory: widget.xterritory,
                      xareaop: widget.xareaop,
                      xdivisionop: widget.xdivisionop,
                      xsubcat: widget.xsubcat,
                    ));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Obx(() =>
                     Positioned(
                       right: 10,
                       top: -1,
                       child: BigText(
                         text: '${cartController.totalClick}',
                         color: Colors.white,
                       ),
                     ),
                  ),
                ],
              ),
            ),
          ],*/
        ),
        body: Container(
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: dashboardController.isLoading2.value
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
                      : ListView.builder(
                          itemCount: dashboardController.productList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cartController.addToCart(
                                    dashboardController.productList[index]["xitem"],
                                    dashboardController.productList[index]["xdesc"],
                                    dashboardController.productList[index]["xdisc"],
                                    dashboardController.productList[index]["xunitsel"],
                                );
                              },
                              highlightColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                                child: Container(
                                  height: Dimensions.height70 + Dimensions.height45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 25,
                                        offset: Offset(5, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Dimensions.height50 + Dimensions.height20,
                                        width: double.maxFinite,
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              'assets/images/lpg.png',
                                              height: Dimensions.height50,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                BigText(text: '${dashboardController.productList[index]["xdesc"]}', size: 15,),
                                                SmallText(text: '${dashboardController.productList[index]["xitem"]}', size: 12, color: Colors.grey,)
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        MdiIcons.currencyBdt,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                      Text('${dashboardController.productList[index]["totrate"]}',style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),),
                                                    ],
                                                  ),

                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      /*Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                          height: 30,
                                          width: double.maxFinite,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(20.0),
                                                bottomLeft: Radius.circular(20.0)
                                            ),

                                          ),
                                          alignment: Alignment.center,
                                          child: dashboardController.productList[index]["xdiscstatus"] == 'Yes'
                                              ? Container(
                                                width: 220,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffEDEEFD),
                                                    borderRadius: BorderRadius.circular(20.0)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(MdiIcons.brightnessPercent, color: Colors.red,size: 22,),
                                                    SizedBox(width: 20,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('${dashboardController.productList[index]["note"]}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff13083E),)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                              : Container() ,
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Get.to(() => CartScreen(
              xcus: widget.xcus,
              xOrg: widget.xOrg,
              xterritory: widget.xterritory,
              xareaop: widget.xareaop,
              xdivisionop: widget.xdivisionop,
              xsubcat: widget.xsubcat,
            ));
          },
          label: Row(
            children: [
              BigText(text: 'Total = ', color: Colors.white,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Obx(() =>
                      Positioned(
                        right: 10,
                        top: -1,
                        child: BigText(
                          text: '${cartController.totalClick}',
                          color: Colors.white,
                        ),
                      ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: AppColor.appBarColor,
        ),
      ),
    );
  }
}

/*
InkWell(
onTap: () {
cartController.addToCart(
dashboardController.productList[index]["xitem"],
dashboardController.productList[index]["xdesc"],
dashboardController.productList[index]["totrate"]);
},
highlightColor: Colors.white,
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
child: Visibility(
visible: true,
child: Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(30.0),
boxShadow: [
BoxShadow(
color: Colors.lightBlueAccent.withOpacity(0.5),
spreadRadius: 1,
blurRadius: 2,
offset: const Offset(2, 2), // changes position of shadow
),
],
),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 0),
child: Column(
children: [
Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Container(
//height and width need to give dimensions for screen management
height: Dimensions.height50,
width: Dimensions.height50 ,
decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage(
'assets/images/lpg.png',
),
),
),
),
Expanded(
child: Container(
//height and width need to give dimensions for screen management
height: Dimensions.height150 + Dimensions.height20,
margin: EdgeInsets.only(right: 10),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
BigText(
text: '${dashboardController.productList[index]["xdesc"]}', size: 20,),
SmallText(
text: '${dashboardController.productList[index]["xitem"]}', size: 18),
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(MdiIcons.currencyBdt, size: 20, color: Colors.red,),
SmallText(text: '${dashboardController.productList[index]["totrate"]}', size: 20, color: Colors.red,),
],
)
],
),
],
),
),
)
],
),
Container(
height: 70,
width: double.maxFinite,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30.0),
color: AppColor.appBlackColor
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
CircleAvatar(child: Icon(MdiIcons.accountSettings),),
Column(
children: [
BigText(text: '2 Discount claimed', color: AppColor.defWhite,),
SmallText(text: 'Expiry date 20 January 2023', color: AppColor.defWhite,),
],
),
CircleAvatar(child: Icon(MdiIcons.sailBoat),),
],
),
)
],
),
),
),
),
),
)*/
