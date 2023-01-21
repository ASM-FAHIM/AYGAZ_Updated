import '../module/model/dealer_model.dart';
import '../module/model/product_model.dart';
import 'database_helper.dart';

class DatabaseRepo{
  final conn = DBHelper.dbHelper;
  DBHelper dbHelper = DBHelper();


  ///Dealer Table Section

  Future<int> addDealer(DealerModel dealerModel) async{
    var dbClient = await conn.db;
    int result = 0;
    try{
      result = await dbClient!.insert(DBHelper.dealerTable, dealerModel.toJson());
      print("-------------$result");
    }catch(e){
      print('There are some issues: $e');
    }
    return result;
  }

  Future<int?> updateDealer(DealerModel dealerModel) async{
    var dbClient = await conn.db;
    int? result;
    try{
      result = await dbClient!.update(DBHelper.dealerTable, dealerModel.toJson(), where: "id=?", whereArgs: [dealerModel.id]);
    }catch(e){
      print('There are some issues: $e');
    }
    return result;
  }

  Future getDealer() async{
    var dbClient = await conn.db;
    List dealerList = [];
    try{
      List<Map<String, dynamic>> maps = await dbClient!.query(DBHelper.dealerTable);
      for(var dealers in maps){
        dealerList.add(dealers);
      }
    }catch(e){
      print("There are some issues: $e");
    }
    return dealerList;
  }

  Future<List<Map<String, dynamic>>> getDealersByName(String name) async {
    // Open the connection to the database
    var dbClient = await conn.db;
    List<Map<String, dynamic>> dealerNameList = [];
    try{
      List<Map<String, dynamic>> maps = await dbClient!.query(DBHelper.dealerTable, where: 'xorg=?', whereArgs: [name]);
      for(var dealers in maps){
        dealerNameList.add(dealers);
      }
      return dealerNameList;
    }catch(e){
      print("There are some issues: $e");
    }
    return dealerNameList;
  }

  Future<void> dropTable() async {
    var dbClient = await conn.db;
    dbClient!.delete(DBHelper.dealerTable);
    print("Table deleted successfully");
  }

  /*Future<int> deleteDealer(int zid) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(dbHelper.tableDealer, where: "zid = ?", whereArgs: [zid]);
  }*/

  ///Product Tbale Section

  //for product table CRUD
  Future<int> addProduct(ProductModel productModel) async{
    var dbClient = await conn.db;
    int result = 0;
    try{
      result = await dbClient!.insert(DBHelper.productTable, productModel.toJson());
      print("-------------$result");
    }catch(e){
      print('There are some issues inserting product: $e');
    }
    return result;
  }


  Future<int?> updateProduct(ProductModel productModel) async{
    var dbClient = await conn.db;
    int? result;
    try{
      result = await dbClient!.update(DBHelper.productTable, productModel.toJson(), where: "id=?", whereArgs: [productModel.id]);
    }catch(e){
      print('There are some issues updating products: $e');
    }
    return result;
  }

  Future getProduct() async{
    var dbClient = await conn.db;
    List productList = [];
    try{
      List<Map<String, dynamic>> maps = await dbClient!.query(DBHelper.productTable);
      for(var products in maps){
        productList.add(products);
      }
    }catch(e){
      print("There are some issues getting products : $e");
    }
    return productList;
  }

  Map<String, dynamic>? _product;
  Future getSpecificProductsInfo(String xitem) async{
    var dbClient = await conn.db;
    List productList = [];
    try{
      productList = await dbClient!.query(
        DBHelper.productTable,
        where: 'xitem = ?',
        whereArgs: [xitem],
      );
      _product = productList.first;
      print('Product: $_product');
      return _product;
    }catch(e){
      print("There are some issues: $e");
    }
    return productList;
  }

  Future<void> dropProductTable() async {
    var dbClient = await conn.db;
    dbClient!.delete(DBHelper.productTable);
    print("Table deleted successfully");
  }

  ///Cart table Section

  //For inserting into cart table and cart_details table
  Future<int> cartInsert(Map<String, dynamic> data ) async{
    var dbClient = await conn.db;
    int result = 0;
    try{
      result = await dbClient!.insert(DBHelper.cartTable, data);
      print("Inserted Successfully in header table: -------------$result");
    }catch(e){
      print('There are some issues inserting product: $e');
    }
    return result;
  }

  //first need cartId for insert value in details table
  Future<int> getCartID() async{
    var dbClient = await conn.db;
    List cartId = [];
    try{
      cartId = await dbClient!.rawQuery('SELECT COUNT(*) as cartID from ${DBHelper.cartTable} order by id desc');
    }catch(e){
      print("There are some issues: $e");
    }
    return cartId.isEmpty ? 0 : cartId[0]['cartID'];
  }

  //inserting cart_details table
  Future<int> cartDetailsInsert(Map<String, dynamic> data ) async{
    var dbClient = await conn.db;
    int result = 0;
    try{
      result = await dbClient!.insert(DBHelper.cartDetailsTable, data);
      // print("Inserted Successfully in details table : -------------$result");
    }catch(e){
      print('There are some issues inserting product: $e');
    }
    return result;
  }

  //cartHeaderInfo
  Future getCartHeader() async{
    var dbClient = await conn.db;
    List cartList = [];
    try{
      List<Map<String, dynamic>> maps = await dbClient!.rawQuery("SELECT * FROM ${DBHelper.cartTable} WHERE xstatus = 'Open' order by id desc");
      for(var products in maps){
        cartList.add(products);
      }
    }catch(e){
      print("There are some issues getting products : $e");
    }
    // print("All cart product from Header: $cartList");
    return cartList;
  }

  //delete cart header Table
  Future<void> dropCartHeaderTable() async {
    var dbClient = await conn.db;
    dbClient!.delete(DBHelper.cartTable);
    print("Table deleted successfully");
  }

  //delete cart details info
  Future<void> dropCartDetailsTable(String cartId) async {
    var dbClient = await conn.db;
    await dbClient!.rawQuery('DELETE FROM ${DBHelper.cartDetailsTable} WHERE cartId = ?', [cartId]);
  }



/*  Map<String, dynamic>? singleHeader;
  Future deleteSingleCartInfo(String cartId) async{
    var dbClient = await conn.db;
    List singleCartList = [];
    try{
      singleCartList = await dbClient!.rawQuery('DELETE FROM ${DBHelper.cartDetailsTable} WHERE cartId = ?', [cartId]);
      cartHeaderList = await dbClient.rawQuery('DELETE FROM ${DBHelper.cartTable} WHERE cartId = ?', [cartId]);
      singleHeader = cartHeaderList.first;
      print('CartHeader: $singleHeader');
      return singleHeader;
    }catch(e){
      print("There are some issues: $e");
    }
    return singleHeader;
  }*/

  Future updateCartHeaderTable(String cartId) async{
    var dbClient = await conn.db;
    dbClient!.rawQuery("UPDATE ${DBHelper.cartTable} SET xstatus = 'Applied' WHERE cartID = ?",[cartId]);
    print(getCartHeader());
  }

  Future getCartHeaderDetails(String cartId) async{
    var dbClient = await conn.db;
    List cartHeaderDetails = [];
    try{
      cartHeaderDetails = await dbClient!.query(
        DBHelper.cartDetailsTable,
        where: 'cartId = ?',
        whereArgs: [cartId],
        orderBy: 'cartId DESC',
      );
      print('Product: $cartHeaderDetails');
    }catch(e){
      print("There are some issues: $e");
    }
    return cartHeaderDetails;
  }

}