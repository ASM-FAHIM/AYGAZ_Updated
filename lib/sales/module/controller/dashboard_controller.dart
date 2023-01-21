import 'dart:convert';
import 'dart:io' show Platform, exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/databaseHelper/database_repo.dart';
import 'package:http/http.dart' as http;
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:aygazhcm/sales/module/model/invoice_model.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import 'package:aygazhcm/sales/widget/small_text.dart';
import '../../constant/colors.dart';
import '../model/dealer_model.dart';
import '../model/product_model.dart';

class DashboardController extends GetxController {
  LoginController loginController = Get.find<LoginController>();
  RxBool isLoading = false.obs;

  //for exit the app
  Future<bool?> showWarningContext(BuildContext context) async => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: BigText(text: 'Exit',),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            BigText(text: 'Do you want to exit the app?',),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColor.appBarColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset.zero, // changes position of shadow
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: SmallText(text: "No", color: AppColor.defWhite,),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColor.appBarColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset.zero, // changes position of shadow
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: SmallText(text: "Yes", color: AppColor.defWhite,),
              ),
            ),
          ],
        )
      ],
    ),
  );

  //dealer fetch and insert to local db
  List<DealerModel> dealersList = [];
  Future<Object> getDealerInfo(String xsp) async{
    try{
      isLoading(true);
      var response = await http.get(Uri.parse('http://172.20.20.69/salesforce/dealerInfo.php?user=$xsp'));
      if(response.statusCode == 200){
        dealersList = dealerModelFromJson(response.body);
        print('Dealer List : $dealersList');
        await dropDealerTable();
        print('previous dealer list deleted');
        await (json.decode(response.body) as List).map((dealer) {
          DatabaseRepo().addDealer(DealerModel.fromJson(dealer));
          print('Dealer is inserting: $dealer');
        }).toList();
        isLoading(false);
        return 'Success';
      }else{
        isLoading(false);
        print("There is an Error ${response.statusCode}");
        return response.statusCode;
      }
    }catch(e){
      print("Something went wrong $e");
      return isLoading(false);
    }
  }

  List list = [];
  List<String> dealerName = [];
  List<String> dealerCode = [];
  RxBool isLoading1 = false.obs;
  RxString dealersName = ''.obs;
  Future getDealerList() async{
    isLoading1(true);
    list = await DatabaseRepo().getDealer();
    print('Dealers list: $list');
    isLoading1(false);
    //dealerName = (List<String>.from(list.map((e) => e['xorg'])));
    //dealerCode = (List<String>.from(list.map((e) => e['xcus'])));
    for(int i = 1; i<list.length; i++){
      dealerName.add(list[i]['xorg']);
      dealerCode.add(list[i]['xcus']);
      print("Dealer zid : ${list[i]['xso']}");
    }
    print('Only dealer Name: $dealerName');
  }

  List dealerListByName = [];
  Future getDealerListByName() async{
    try{
      dealerListByName = await DatabaseRepo().getDealersByName(dealersName.value);
      print('Dealers list: $dealerListByName');
      for(int i = 1; i<dealerListByName.length; i++){
        print('----------${dealerListByName[i]}');
        print("Dealer zid : ${dealerListByName[i]['xso']}");
      }
    }catch(e){
      print('Exception occured  $e');
    }
  }

  Future dropDealerTable() async{
    DatabaseRepo().dropTable();
    print('Table deleted successfully');
  }

  //product fetch and insert to local db
  RxBool isLoading3 = false.obs;
  List<ProductModel> productsList = [];
  Future<Object> getProductInfo(String xsp, String xsubcat) async{
    try{
      isLoading3(true);
      await getDealerInfo(xsp);
      var response = await http.get(Uri.parse('http://172.20.20.69/salesforce/productlist.php?type=$xsubcat'));
      if(response.statusCode == 200){
        productsList = productModelFromJson(response.body);
        await dropProductTable();
        await (json.decode(response.body) as List).map((product) {
          DatabaseRepo().addProduct(ProductModel.fromJson(product));
          print('Product inserting: $product');
        }).toList();
        isLoading3(false);
        return Get.snackbar('Success', 'Data fetched successfully',
            backgroundColor: AppColor.defWhite,
            duration: const Duration(seconds: 1));
      }else{
        isLoading3(false);
        print("There is an Error ${response.statusCode}");
        return response.statusCode;
      }
    }catch(e){
      print("Something went wrong $e");
      return isLoading3(false);
    }
  }

  List productList = [];
  RxBool isLoading2 = false.obs;
  Future getProductList() async{
    isLoading2(true);
    productList = await DatabaseRepo().getProduct();
    isLoading2(false);
    for(int i = 1; i<productList.length; i++){
      print('----------${productList[i]}');
      print("Product item : ${productList[i]['xitem']}");
    }
  }

/*  var specProduct;
  Future getSpecPInfo(String xitem) async{
    specProduct = await DatabaseRepo().getSpecificProductsInfo(xitem);
  }*/

  Future dropProductTable() async{
    DatabaseRepo().dropProductTable();
    print('Table deleted successfully');
  }

  RxBool isPressed = false.obs;
  RxBool givingAtt = false.obs;
  DateTime now = DateTime.now();

  Future<void> checkFunction() async{
    try{
      givingAtt(true);
     await loginController.periodicallyLocationTracking();
      var inOutResponse = await http.post(Uri.parse('http://172.20.20.69/salesforce/TSOattendance.php'),
          body: jsonEncode(<String, dynamic>{
            "TSOID" : loginController.data!.xsp,
            "InTime" : now.toString(),
            "OutTime" : now.toString(),
            "Latitude" : loginController.curntLat.value.toString(),
            "Longitude" : loginController.curntLong.value.toString(),
            "location" : loginController.addressInOut.value.toString()
          })
      );
      print('Attendance is given :${inOutResponse.body}');
      print('checking status :${inOutResponse.statusCode}');
    }catch(e){
      print('Fail to give attendance because of : $e');
    }
    givingAtt(false);
    isPressed.value = !isPressed.value;
  }

  RxBool isFetched = false.obs;
  InvoiceModel? invoiceModel;
  Future<void> getInvoiceInfo(String tsoId) async{
    isFetched(true);
    var invoiceRes = await http.get(Uri.parse('http://172.20.20.69/salesforce/MonthlyInvoice.php?tso=$tsoId'));
    if (invoiceRes.statusCode == 200) {
      invoiceModel = invoiceModelFromJson(invoiceRes.body);
      print(invoiceRes.body);
      isFetched(false);
    }
  }

}