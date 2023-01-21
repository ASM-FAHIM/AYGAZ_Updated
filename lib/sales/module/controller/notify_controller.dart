import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/notification_model.dart';


class NotifyController extends GetxController {
  var notifyList = <NotificationModel>[].obs;
  var isLoading = true.obs;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   fetchNotification();
  //   super.onInit();
  // }

  void fetchNotification(String tsoId) async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse("http://172.20.20.69/salesforce/TSO_notification.php?tso=$tsoId"));
      var notify = notificationModelFromJson(response.body);
      notifyList.assignAll(notify!.map((e) => e as NotificationModel));
    } finally {
      isLoading(false);
    }
  }

  //switch case for color combination
  changeColor(String statusdemo){

    switch(statusdemo){
      case "Applied":
        return Colors.blueAccent;

      case "Approved":
        return Colors.green;

      case "Rejected":
        return Colors.red;

      case "Recommended":
        return Color(0xff5E9CF9);

      default:
        return Colors.purple;

    }

  }
}

/*
class NotificationAPI {
  Future<List<NotificationModel>> notifiGetAPI() async {
    var response =
    await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) debugPrint('--------------');
    log('Successfully fetched');
    debugPrint('--------------');
    return notificationModelFromJson(response.body);
  }
}*/
