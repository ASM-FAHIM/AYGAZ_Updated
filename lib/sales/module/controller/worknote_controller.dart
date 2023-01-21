import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/databaseHelper/worknote_repo.dart';

class WorkNoteController extends GetxController{

  TextEditingController textController = TextEditingController();
  List<Map<String, dynamic>> workList = [];
  RxBool isLoading = false.obs;


  Future<void> getWorkLists(String tsoId) async{
    isLoading(true);
    final data = await WorkNoteRepo().getNotes(tsoId);
    workList = data;
    print('Worklist is : $workList');
    isLoading(false);
  }

  Future<void> addNotes(String note, String tsoId) async{
    await WorkNoteRepo().insertNote(note, tsoId);
    getWorkLists(tsoId);
    print('--------${workList.length}');
  }

  Future<void> updateNotes(int id, String updateNote, String tsoId) async{
    await WorkNoteRepo().updateNote(id, updateNote);
    getWorkLists(tsoId);
    print('--------${workList.length}');
  }


  Future<void> deleteNotes(int id, String tsoId) async{
    await WorkNoteRepo().deleteNote(id);
    getWorkLists(tsoId);
    print('--------${workList.length}');
  }
}