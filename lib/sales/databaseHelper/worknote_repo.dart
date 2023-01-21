import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class WorkNoteRepo{
  final conn = DBHelper.dbHelper;
  DBHelper dbHelper = DBHelper();

  Future<int> insertNote(String note, String tsiId) async{
    var dbClient = await conn.db;
    final dataNote = {'note' : note, 'tsoId' : tsiId};
    final id = await dbClient!.insert(
        DBHelper.workNoteTable,
        dataNote,
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    return id;
  }

  Future<void> deleteNote(int id) async{
    var dbClient = await conn.db;
    try{
      await dbClient!.delete(
        DBHelper.workNoteTable,
        where: 'id = ?',
        whereArgs: [id],
      );
    }catch(e){
      print('Something went wrong when deleting Item: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getNotes(String tsoId) async{
    var dbClient = await conn.db;
    //return dbClient!.rawQuery("SELECT * FROM ${DBHelper.workNoteTable} order by id desc");
    return dbClient!.query(DBHelper.workNoteTable, where: "tsoId= ?", whereArgs: [tsoId], orderBy: 'id desc');
  }

  Future<List<Map<String, dynamic>>> getSingleNotes(int id) async{
    var dbClient = await conn.db;
    return dbClient!.query(DBHelper.workNoteTable, where:  "id = ?", whereArgs: [id], limit: 1);
  }

  Future<int> updateNote(int id, String note) async{
    var dbClient = await conn.db;
    final updatedData = {
      'note' : note,
      'createdAt' : DateTime.now().toString()
    };
    final result = await dbClient!.update(DBHelper.workNoteTable, updatedData, where: "id = ?", whereArgs: [id]);
    return result;
    }

}