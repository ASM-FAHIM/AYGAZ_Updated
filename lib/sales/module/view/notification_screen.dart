import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../widget/big_text.dart';
import '../../widget/small_text.dart';
import '../controller/notify_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotifyController notifyController = Get.put(NotifyController());
  LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    // TODO: implement initState
    notifyController.fetchNotification(loginController.data!.xsp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: BigText(text: "Notifications", color: AppColor.defWhite, size: 25,),

      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (notifyController.isLoading.value) {
                return Center(
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
                );
              }
              else {
                return ListView.builder(
                    itemCount: notifyController.notifyList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: '${notifyController.notifyList[index].xtornum}'),
                                  SmallText(text: '${notifyController.notifyList[index].cusname}'),
                                  SmallText(text: '${notifyController.notifyList[index].xcus}', size: 15,),
                                  BigText(text: '${notifyController.notifyList[index].xdate}', size: 25, color: AppColor.defRed,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Card(
                                  color: notifyController.changeColor('${notifyController.notifyList[index].xstatustor}'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  elevation: 5,
                                  child: Container(
                                    height: Dimensions.height45,
                                    width: Dimensions.height60 + Dimensions.height45,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        BigText(text: '${notifyController.notifyList[index].xstatustor}', color: Colors.white,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
