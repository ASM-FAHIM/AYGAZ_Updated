// import 'dart:convert';
//
// import 'package:hrandsells/data_model/notification_model.dart';
// import 'package:http/http.dart' as http;
//
// class fetchnotification {
//   var data = [];
//   List<NotificationModel> results = [];
//   String urlList = 'http://103.150.48.235:2165/API/monyeem/notification.php';
//
//   Future<List<NotificationModel>> getnoteList({String? query}) async {
//     var url = Uri.parse(urlList);
//     try {
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//
//         data = json.decode(response.body);
//         results = data.map((e) => NotificationModel.fromJson(e)).toList();
//         if (query!= null){
//           results = results.where((element) => element.xsubtitle.toLowerCase().contains((query.toLowerCase()))).toList();
//         }
//       } else {
//         print(response.statusCode);
//       }
//     } on Exception catch (e) {
//       print('error: $e');
//     }
//     return results;
//   }
// }
