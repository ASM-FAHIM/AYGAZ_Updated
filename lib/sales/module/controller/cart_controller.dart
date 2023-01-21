import 'dart:convert';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/module/model/so_model.dart';
import '../../databaseHelper/database_repo.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  LoginController loginController = Get.find<LoginController>();

  RxString dropDownValue = 'Any time'.obs;
  // RxString zauserid = ''.obs;
  // RxString xidsup = ''.obs;
  // RxString xpreparer = ''.obs;


  // Define the custom ID string
  RxString customId = ''.obs;
  List<List<String>> addedProducts = [];

  Future<void> generateSoNumber() async{
    var response = await http.get(Uri.parse('http://172.20.20.69/salesforce/getsonum.php'));
    if(response.statusCode == 200) {
      SoModel? data = soModelFromJson(response.body);
      print('So number : ${data!.sOnum}');

      // Define the regular expression for the custom ID format
      final RegExp idFormat = RegExp(r'^SO[0-9]{2}[0-9]{2}[0-9]{4,}$');

      // Define a function to generate the custom ID
      // Get the current date
      var now = DateTime.now();

      // Get the year and month as two digits each
      var year = now.year.toString().substring(2, 4);
      var month = now.month.toString().padLeft(2, '0');

      // Assemble the custom ID string
      customId.value = 'SO$year$month${data.sOnum}';
      print('Actual So number is : ${customId.value}');

      // Validate the custom ID using the regular expression
      if (!idFormat.hasMatch(customId.value)) {
        throw Exception(
            'Generated custom ID does not match the required format');
      }
    }
  }


  void addToCart(String productId, String pName, String pPrice, String xUnit) {
    if (addedProducts.isNotEmpty) {
      bool flag = false;
      for (int i = 0; i < addedProducts.length; i++) {
        if (addedProducts[i][0] == productId) {
          flag = true;
          int tempCount;
          tempCount = int.parse(addedProducts[i][1]);
          addedProducts[i][1] = (tempCount + 1).toString();
        }
      }
      if (!flag) {
        addedProducts.add([productId, '1', pName, pPrice, xUnit]);
      }
    } else {
      addedProducts.add([productId, '1', pName, pPrice, xUnit]);
    }
    totalClicked();
    update();
  }

  void increment(String productId) {
    for (int i = 0; i < addedProducts.length; i++) {
      if (addedProducts[i][0] == productId) {
        int tempCount;
        tempCount = int.parse(addedProducts[i][1]);
        addedProducts[i][1] = (tempCount + 1).toString();
      }
    }
    totalClicked();
    update();
  }

  void decrement(String productId) {
    for (int i = 0; i < addedProducts.length; i++) {
      if (addedProducts[i][0] == productId) {
        if (addedProducts[i][1] == '1') {
          addedProducts.removeAt(i);
        } else {
          int tempCount;
          tempCount = int.parse(addedProducts[i][1]);
          addedProducts[i][1] = (tempCount - 1).toString();
        }
      }
    }
    totalClicked();
    update();
  }

  RxInt totalClick = 0.obs;
  final totalPrice = 0.0.obs;
  void totalClicked() {
    try{
      int totalQty = 0;
      double subTotalPrice = 0.0;
      for (int i = 0; i < addedProducts.length; i++) {
        int temp = int.parse(addedProducts[i][1]);
        totalQty += temp;
        double tempPrice = double.parse(addedProducts[i][3]);
        subTotalPrice += tempPrice * temp;
      }
      totalClick.value = totalQty;
      totalPrice.value = subTotalPrice;

      print('total clicked is: $totalClick');
      print('total price is: $totalPrice');
    }catch(e){
      print('There is an error : $e');
    }

  }

  //for getting CartId and Insert it to the cart Table as well as Cart_details Table
  RxInt cartTableMax = 0.obs;
  RxBool saving = false.obs;
  Future<void> insertToCart(String tsoId, String cusId, String xOrg, String xterritory, String xareaop, String xdivision, String xsubcat, String status) async {
    try{
      saving(true);
      cartTableMax.value = await DatabaseRepo().getCartID();
      var cartID = 'C-00${(cartTableMax + 1)}';
      print('$cartID================');
      Map<String, dynamic> cartInsert = {
        'cartID': cartID,
        'xso': tsoId,
        'xcus': cusId,
        'xorg': xOrg,
        'xterritory': xterritory,
        'xareaop': xareaop,
        'xdivision': xdivision,
        'xsubcat': xsubcat,
        'xdelivershift': dropDownValue.value,
        'total': totalPrice.toDouble(),
        'xstatus': status
      };
      DatabaseRepo().cartInsert(cartInsert);
      for (int i = 0; i < addedProducts.length; i++) {
        String xItem = addedProducts[i][0];
        double qty = double.parse(addedProducts[i][1]);
        String xDesc = addedProducts[i][2];
        double itemPrice = double.parse(addedProducts[i][3]);
        double subTotal = qty * itemPrice;
        String xunit = addedProducts[i][4];
        Map<String, dynamic> cartDetailsInsert = {
          'cartID': cartID,
          'xitem': xItem,
          'xdesc': xDesc,
          'xunit': xunit,
          'xrate': itemPrice,
          'xqty': qty,
          'subTotal': subTotal,
        };
        print("From Header: $tsoId, $cusId, $totalPrice");
        DatabaseRepo().cartDetailsInsert(cartDetailsInsert);
      }
      Get.back();
      Get.back();
      Get.snackbar(
          'Successful',
          'Order added successfully',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2)
      );
      saving(false);
    }catch(error){
      print('There are some issue: $error');
    }
  }

  //for getting cart_List from cart table
  List listCartHeader = [];
  RxBool isLoading = false.obs;
  Future getCartHeaderList() async{
    try{
      isLoading(true);
      listCartHeader = await DatabaseRepo().getCartHeader();
      isLoading(false);
    }catch(error){
      print('There are some issue: $error');
    }
  }


  //for getting cart_List from cart table
  List listCartHeaderDetails = [];
  RxBool isLoading1 = false.obs;
  Future<void> getCartHeaderDetailsList(String cartId) async{
    try{
      isLoading1(true);
      listCartHeaderDetails = await DatabaseRepo().getCartHeaderDetails(cartId);
      print(listCartHeaderDetails);
      isLoading1(false);
    }catch(error){
      print('There are some issue: $error');
    }
  }


  //for uploading cartHeader and details to-gather
  RxBool isUploading = false.obs;
  Future<void> uploadCartOrder() async{
    try{
      isUploading(true);
      await getCartHeaderList();
      if(listCartHeader.isEmpty){
        Get.snackbar(
            'Warning!',
            'Your cart history is empty',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 1)
        );
        isUploading(false);
      }else{
        for(int i = 0; i< listCartHeader.length; i++){
          await generateSoNumber();
          var dataHeader = jsonEncode(<String, dynamic>{
            /*'cartid' : listCartHeader[i]['cartID'],
          'xso' : listCartHeader[i]['xso'],
          'xcus': listCartHeader[i]['xcus'],
          'xtime' : '${listCartHeader[i]['createdAt']}',
          'xdelivershift' : dropDownValue.value,
          'total' : listCartHeader[i]['total'],
          'xstatus' : 'Applied',*/

            "zauserid" : loginController.zauserid.value,
            "xtornum" : customId.value,
            "xdate" : "${listCartHeader[i]['createdAt']}",
            "xfwh" : "02",
            "xstatustor" : "Applied",
            "xcus" : "${listCartHeader[i]['xcus']}",
            "xidsup" : loginController.xidsup.value,
            "xpreparer" : loginController.xpreparer.value,
            "xterritory" : "${listCartHeader[i]['xterritory']}",
            "xareaop" : "${listCartHeader[i]['xareaop']}",
            "xdivisionop" : "${listCartHeader[i]['xdivision']}",
            "xsubcat" : "${listCartHeader[i]['xsubcat']}",
            "xtso" : "${listCartHeader[i]['xso']}",
            "xtotamt" : "${listCartHeader[i]['total']}",
            "xdeltime" : dropDownValue.value

          });
          var responseHeader = await http.post(
              Uri.parse('http://172.20.20.69/salesforce/SOtableInsert.php'),
              body: dataHeader);
          print('---===---===---${responseHeader.body}');
          var tempHeader = '${listCartHeader[i]['cartID']}';
          await getCartHeaderDetailsList(tempHeader);
          for(int j = 0; j< listCartHeaderDetails.length; j++){
            var dataDetails = jsonEncode(<String, dynamic>{
              /* 'cartid' : listCartHeaderDetails[j]['cartID'],
            'xrow' : listCartHeaderDetails[j]['id'],
            'xitem': listCartHeaderDetails[j]['xitem'],
            'xqty' : listCartHeaderDetails[j]['xqty'],
            'subtotal' : listCartHeaderDetails[j]['subTotal'],
            'rate' : listCartHeaderDetails[j]['xrate'],*/

              "zauserid" : loginController.zauserid.value,
              "xtornum" : customId.value,
              "xrow" : "${j+1}",
              "xitem" : listCartHeaderDetails[j]['xitem'],
              "xunit" : listCartHeaderDetails[j]['xunit'],
              "qty" : listCartHeaderDetails[j]['xqty']

            });
            var responseDetails = await http.post(
                Uri.parse('http://172.20.20.69/salesforce/SOdetailsTableInsert.php'),
                body: dataDetails);
            print('---===---===---${responseDetails.body}');
            await DatabaseRepo().dropCartDetailsTable(listCartHeaderDetails[j]['cartID']);
          }
          var updateSO = await http.get(
              Uri.parse('http://172.20.20.69/salesforce/TRNincrement.php'));
          if(updateSO.statusCode == 200){
            print('Successfully updated');
          }
        }
        await DatabaseRepo().dropCartHeaderTable();
        await getCartHeaderList();
        Get.snackbar(
            'Successful',
            'File uploaded successfully',
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 1)

        );
        isUploading(false);
      }
    }catch(error){
      print('There are some issue: $error');
    }
  }

  RxBool isSync = false.obs;
  Future<void> syncNow(String tsoId, String cusId, String xOrg, String xterritory, String xareaop, String xdivision, String xsubcat, BuildContext context) async{
     isSync(true);
     try{
      await insertToCart(tsoId, cusId, xOrg, xterritory, xareaop, xdivision, xsubcat,'Applied');
      await getCartHeaderList();
      int i = (listCartHeader.length - 1);
      await generateSoNumber();
      var dataHeader = jsonEncode(<String, dynamic>{
        /*'cartid' : listCartHeader[i]['cartID'],
        'xso' : listCartHeader[i]['xso'],
        'xcus': listCartHeader[i]['xcus'],
        'xtime' : '${listCartHeader[i]['createdAt']}',
        'xdelivershift' : dropDownValue.value,
        'total' : listCartHeader[i]['total'],
        'xstatus' : 'Applied',*/
        "zauserid" : loginController.zauserid.value,
        "xtornum" : customId.value,
        "xdate" : "${listCartHeader[i]['createdAt']}",
        "xfwh" : "02",
        "xstatustor" : "Applied",
        "xcus" : "${listCartHeader[i]['xcus']}",
        "xidsup" : loginController.xidsup.value,
        "xpreparer" : loginController.xpreparer.value,
        "xterritory" : "${listCartHeader[i]['xterritory']}",
        "xareaop" : "${listCartHeader[i]['xareaop']}",
        "xdivisionop" : "${listCartHeader[i]['xdivision']}",
        "xsubcat" : "${listCartHeader[i]['xsubcat']}",
        "xtso" : "${listCartHeader[i]['xso']}",
        "xtotamt" : "${listCartHeader[i]['total']}",
        "xdeltime" : dropDownValue.value

      });
      var responseHeader = await http.post(
          Uri.parse('http://172.20.20.69/salesforce/SOtableInsert.php'),
          body: dataHeader);
      print('---===---===---${responseHeader.body}');
      var tempHeader = '${listCartHeader[i]['cartID']}';
      print('Header Cart ID: $tempHeader');
      print('Header CartDetails length: ${listCartHeaderDetails.length}');
      await getCartHeaderDetailsList(tempHeader);
      for(int j = 0; j< listCartHeaderDetails.length; j++){
        var dataDetails = jsonEncode(<String, dynamic>{
          /*'cartid' : listCartHeaderDetails[j]['cartID'],
          'xrow' : listCartHeaderDetails[j]['id'],
          'xitem': listCartHeaderDetails[j]['xitem'],
          'xqty' : listCartHeaderDetails[j]['xqty'],
          'subtotal' : listCartHeaderDetails[j]['subTotal'],
          'rate' : listCartHeaderDetails[j]['xrate'],*/

          "zauserid" : loginController.zauserid.value,
          "xtornum" : customId.value,
          "xrow" : "${j+1}",
          "xitem" : listCartHeaderDetails[j]['xitem'],
          "xunit" : listCartHeaderDetails[j]['xunit'],
          "qty" : listCartHeaderDetails[j]['xqty']

        });
        var responseDetails = await http.post(
            Uri.parse('http://172.20.20.69/salesforce/SOdetailsTableInsert.php'),
            body: dataDetails);
        print('---===---===---${responseDetails.body}');
      }
      print("------------------------------------------${listCartHeader[i]['cartID']}");
      //await DatabaseRepo().updateCartHeaderTable(listCartHeader[i]['cartID']);
      var updateSO = await http.get(
          Uri.parse('http://172.20.20.69/salesforce/TRNincrement.php'));
      if(updateSO.statusCode == 200){
        print('Successfully updated');
      }
      isSync(false);
    }catch(e){
      print('Error occured $e');
    }
  }
}
