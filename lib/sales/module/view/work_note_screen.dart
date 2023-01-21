import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:aygazhcm/sales/module/controller/worknote_controller.dart';
import '../../constant/dimensions.dart';
import '../../widget/big_text.dart';

class WorkNoteScreen extends StatefulWidget {
  const WorkNoteScreen({Key? key}) : super(key: key);

  @override
  State<WorkNoteScreen> createState() => _WorkNoteScreenState();
}

class _WorkNoteScreenState extends State<WorkNoteScreen> {
  WorkNoteController noteController = Get.put(WorkNoteController());
  LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    // TODO: implement initState
    noteController;
    noteController.getWorkLists(loginController.data!.xsp);
    super.initState();
  }

  void showForm(int? id) async{
    if(id != null){
     final existingWorkList = noteController.workList.firstWhere((element) => element['id']== id);
     noteController.textController.text = existingWorkList['note'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        backgroundColor: Colors.transparent,
        builder: (_){
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
              )
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: Dimensions.height320),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: noteController.textController,
                  decoration: const InputDecoration(
                      hintText: 'Please write your note',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w400)
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColor.appBarColor),
                    onPressed: () async{
                      if(noteController.textController.text.isEmpty){
                        Get.snackbar(
                            'Warning !',
                            'Input field cannot be empty',
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 2)

                        );
                      }else{
                        if(id == null){
                          await noteController.addNotes(noteController.textController.text, loginController.data!.xsp);
                        }
                        else if(id != null){
                          await noteController.updateNotes(id, noteController.textController.text, loginController.data!.xsp);
                        }
                        noteController.textController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: BigText(text: id == null ? 'Save' : 'Update', color: AppColor.defWhite,)
                )
              ],
            ),
          );
    });
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
            title: BigText(text: "Work Note", color: AppColor.defWhite, size: 25,),
          ),
          body: Obx((){
            return noteController.isLoading.value
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
                itemCount: noteController.workList.length,
                itemBuilder: (context, index){
                  return Card(
                    color: AppColor.appBarColor,
                    elevation: 5,
                    margin: EdgeInsets.all(15.0),
                    child: ListTile(
                      title: BigText(text: noteController.workList[index]['note'].toString(), color: AppColor.defWhite,),
                      //subtitle:BigText(text: noteController.workList[index]['createdAt'].toString(), color: AppColor.defWhite, size: 10,),
                      trailing: IconButton(
                          onPressed: (){
                            noteController.deleteNotes(noteController.workList[index]['id'], loginController.data!.xsp);
                          },
                          icon: Icon(MdiIcons.deleteCircle, size: 40,), color: AppColor.defWhite),
                    ),
                  );
                });
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: const Icon(MdiIcons.plus, size: 30,),
            onPressed: (){
              showForm(null);
            },
          ),
        ),
    );
  }
}
