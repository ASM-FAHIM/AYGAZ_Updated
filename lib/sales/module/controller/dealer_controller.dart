/*import 'dart:convert';
import 'package:get/get.dart';
import 'package:sales_app/databaseHelper/database_repo.dart';
import 'package:http/http.dart' as http;
import '../model/dealer_model.dart';

class ProductController extends GetxController {

  RxBool isLoading = false.obs;

  Future<Object> getDealerInfo() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse('http://172.20.20.69/salesforce/demo.php'));
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List).map((dealer) {
          ProductRepo().addDealer(DealerModel.fromJson(dealer));
          print('Dealer inserting: $dealer');
        }).toList();
      } else {
        isLoading(false);
        print("There is an Error ${response.statusCode}");
        return response.statusCode;
      }
    } catch (e) {
      print("Something went wrong $e");
      return isLoading(false);
    }
  }

  List list = [];
  RxBool isLoading1 = false.obs;

  Future dealerList() async {
    isLoading1(true);
    list = await ProductRepo().getDealer();
    isLoading1(false);
    for (int i = 1; i < list.length; i++) {
      print('----------${list.length}');
      print("Dealer zid : ${list[i]['zid']}");
    }
  }

  Future dropTable() async {
    ProductRepo().dropTable();
    print('Table deleted successfully');
  }

}*/
  /*//for product list
  fetchAllProduct() async{
    var product = await productRepo.getProduct();
    allProduct.value = product;
    print(allProduct);
  }

  addProduct(ProductModel productModel){
    productRepo.add(productModel);
    fetchAllProduct();
  }

  updateProduct(ProductModel productModel){
    productRepo.update(productModel);
    fetchAllProduct();
  }

  deleteProduct(int id){
    productRepo.delete(id);
    fetchAllProduct();
  }*/