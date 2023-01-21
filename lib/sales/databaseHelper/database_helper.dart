import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper{
  DBHelper.internal();
  static final DBHelper dbHelper = DBHelper.internal();
  factory DBHelper() => dbHelper;

  static  const dealerTable = 'dealerTable';
  static  const productTable = 'productTable';
  static  const cartTable = 'cartTable';
  static  const cartDetailsTable = 'cartDetailsTable';
  static  const workNoteTable = 'workNote';
  static final _version = 1;
  static Database? _db;

  Future<Database?> get db async {
    if (_db !=null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path,'salesforce.db');
    print(dbPath);
    var openDb = await openDatabase(dbPath,version: _version,
        onCreate: (Database db,int version) async{
          await db.execute("""
        CREATE TABLE $dealerTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          xso VARCHAR(150), 
          xcus VARCHAR(150), 
          xorg VARCHAR(150), 
          xterritory VARCHAR(150),
          xsubcat VARCHAR(150),
          xareaop VARCHAR(150),
          xdivisionop VARCHAR(150)
          )""");
          await db.execute("""
        CREATE TABLE $productTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          xitem VARCHAR(150), 
          xdesc VARCHAR(150), 
          xrate VARCHAR(150), 
          xvatrate VARCHAR(150), 
          xvatamt VARCHAR(150),
          totrate VARCHAR(150), 
          xpackqty VARCHAR(150), 
          xunitsel VARCHAR(150),
          xdiscstatus VARCHAR(150),
          xdisc VARCHAR(150),
          note VARCHAR(150)
          )""");
          await db.execute("""
        CREATE TABLE $cartTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cartID VARCHAR(150),
          xso VARCHAR(150), 
          xcus VARCHAR(150),
          xorg VARCHAR(150),
          xterritory VARCHAR(150),
          xareaop VARCHAR(150),
          xdivision VARCHAR(150),
          xsubcat VARCHAR(150),
          xdelivershift VARCHAR(150),
          total REAL,
          xstatus VARCHAR(150),
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          )""");
          await db.execute("""
        CREATE TABLE $cartDetailsTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cartID VARCHAR(150) NOT NULL,          
          xitem VARCHAR(150),          
          xdesc VARCHAR(150),
          xunit VARCHAR(150),
          xrate REAL,
          xqty REAL,
          subTotal REAL,
          FOREIGN KEY (cartID) REFERENCES $cartTable(cartID)
          )""");
          await db.execute("""
        CREATE TABLE $workNoteTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,     
          tsoId VARCHAR(150),          
          note VARCHAR(150),          
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          )""");
        },
        onUpgrade: (Database db, int oldversion,int newversion)async{
          if (oldversion<newversion) {
            print("Version Upgrade");
          }
        }
    );
    return openDb;
  }

}