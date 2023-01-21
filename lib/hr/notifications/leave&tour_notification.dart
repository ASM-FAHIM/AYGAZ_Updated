// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:aygazhcm/data_model/notification_model.dart';
// // import 'package:aygazhcm/home_page.dart';
// // import 'package:aygazhcm/hr/viewNotification.dart';
// // import 'package:aygazhcm/screen/notification_api.dart';
// // //import 'package:aygazhcm/hr/viewNotification.dart';
// // import 'package:http/http.dart' as http;
// //
// // class NotificationList extends StatefulWidget {
// //   //const NotificationList({Key? key}) : super(key: key);
// //
// //   NotificationList({required this.xposition});
// //   String xposition;
// //
// //   @override
// //   _NotificationListState createState() => _NotificationListState();
// // }
// //
// // class _NotificationListState extends State<NotificationList> {
// //   // fetchnotification _noteList = fetchnotification();
// //   //fetchnotification _noteList = fetchnotification();
// //
// //   @override
// //
// //   // Future<List<NotificationModel>>? futurePost;
// //   //
// //   // Future<List<NotificationModel>> fetchNotification() async {
// //   //   var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
// //   //   jsonEncode(<String, String>{
// //   //     "xposition": widget.xposition,
// //   //   })
// //   //   );
// //   //   print(response.statusCode);
// //   //   print(response.body);
// //   //
// //   //   if (response.statusCode == 200) {
// //   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //   //
// //   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
// //   //   } else {
// //   //     throw Exception('Failed to load album');
// //   //   }
// //   // }
// //
// //
// //   Future<List<NotificationModel>>? futurePost;
// //
// //
// //
// //   Future<List<NotificationModel>> fetchPost() async {
// //     var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
// //     jsonEncode(<String, String>{
// //       "xposition": widget.xposition,
// //     })
// //     );
// //
// //
// //
// //     if (response.statusCode == 200) {
// //       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //
// //       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
// //     } else {
// //       throw Exception('Failed to load album');
// //     }
// //   }
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // submitData();
// //     futurePost = fetchPost();
// //
// //     fetchPost().whenComplete(() => futurePost);
// //   }
// //
// //
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Notification List'),
// //         backgroundColor: Color(0xFF8CA6DB),
// //       ),
// //
// //       body: Container(
// //         padding: EdgeInsets.all(20),
// //
// //         child: FutureBuilder<List<NotificationModel>>(
// //           future: futurePost,
// //           builder: (context, snapshot) {
// //             if (snapshot.hasData) {
// //               return ListView.builder(
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (_, index) => Container(
// //                   child: Column(
// //                     children: [
// //                       TextButton(
// //                         color: Colors.white70,
// //                         height: 70,
// //                         onPressed: (){
// //                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
// //                         },
// //                         child:  Row(
// //                           children: [
// //                             CircleAvatar(
// //                               backgroundColor: Colors.lightBlueAccent,
// //                               child: Icon(Icons.notifications_active_outlined),
// //                             ),
// //                             SizedBox(
// //                               width: 100,
// //                             ),
// //                             Column(
// //                               children: [
// //                                 Text("${snapshot.data![index].xtitle}",
// //                                   style: TextStyle(fontSize: 20,),
// //                                   textAlign: TextAlign.start,
// //                                 ),
// //                                 Text("${snapshot.data![index].xsubtitle}",
// //                                   style: TextStyle(fontSize: 15),
// //                                 ),
// //                               ],
// //                             ),
// //                             // SizedBox(
// //                             //   width: 100,
// //                             // ),
// //
// //                             //Icon(Icons.delete, color: Colors.grey,),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                 ),
// //               );
// //             } else {
// //               return Center(
// //                 child: Image(image: AssetImage("images/loading.gif")),
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:aygazhcm/data_model/notification_model.dart';
// import 'package:aygazhcm/data_model/notification_model/leave&tour_notification_model.dart';
// import 'package:aygazhcm/home_page.dart';
// import 'package:aygazhcm/hr/viewNotification.dart';
// import 'package:aygazhcm/screen/notification_api.dart';
// //import 'package:aygazhcm/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class LeaveTour_NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   LeaveTour_NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _LeaveTour_NotificationListState createState() => _LeaveTour_NotificationListState();
// }
//
// class _LeaveTour_NotificationListState extends State<LeaveTour_NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<LeaveTourNotificationModel>>? futurePost;
//
//
//
//   Future<List<LeaveTourNotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://10.1.2.7/api/leavenotification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<LeaveTourNotificationModel>((json) => LeaveTourNotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leave & Tour Notification'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<LeaveTourNotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       TextButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].status)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].status}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].applyDate.date}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:aygazhcm/data_model/notification_model.dart';
// import 'package:aygazhcm/home_page.dart';
// import 'package:aygazhcm/hr/viewNotification.dart';
// import 'package:aygazhcm/screen/notification_api.dart';
// //import 'package:aygazhcm/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _NotificationListState createState() => _NotificationListState();
// }
//
// class _NotificationListState extends State<NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<NotificationModel>>? futurePost;
//
//
//
//   Future<List<NotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification List'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<NotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       TextButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].xtitle}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].xsubtitle}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:aygazhcm/data_model/notification_model/leave&tour_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:aygazhcm/hr/viewNotification.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class LeaveTour_NotificationList extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  LeaveTour_NotificationList({required this.xposition});
  String xposition;

  @override
  _LeaveTour_NotificationListState createState() =>
      _LeaveTour_NotificationListState();
}

class _LeaveTour_NotificationListState
    extends State<LeaveTour_NotificationList> {
  // fetchnotification _noteList = fetchnotification();
  //fetchnotification _noteList = fetchnotification();

  @override

  // Future<List<NotificationModel>>? futurePost;
  //
  // Future<List<NotificationModel>> fetchNotification() async {
  //   var response= await http.post(Uri.parse('http://10.1.2.7/api/notification.php'),body:
  //   jsonEncode(<String, String>{
  //     "xposition": widget.xposition,
  //   })
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<List<LeaveTourNotificationModel>>? futurePost;

  Future<List<LeaveTourNotificationModel>> fetchPost() async {
    var response =
        await http.post(Uri.parse('http://103.150.48.235:2165/API/aygaz/HR/employeenotification/leaveandtour.php'),
            body: jsonEncode(<String, String>{
              "xposition": widget.xposition,
            }));

    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<LeaveTourNotificationModel>(
              (json) => LeaveTourNotificationModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();

    // submitData();
    futurePost = fetchPost();

    fetchPost().whenComplete(() => futurePost);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff064A76),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "Leave & Tour Notification",
            style: GoogleFonts.bakbakOne(
              fontSize: 20,
              color: Color(0xff074974),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<List<LeaveTourNotificationModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Column(
                    children: [
                      // Icon(Icons.notifications_active_outlined),
                      // SizedBox(
                      //   width: 100,
                      // ),

                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      (DateFormat("dd-MM-yyyy").format(
                                              DateTime.parse((snapshot
                                                      .data![index]
                                                      .applyDate
                                                      .date)
                                                  .toString())))
                                          .toString(),
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      " ${snapshot.data![index].typeOfApplication}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //Text(" ${snapshot.data![index].status}")
                                  ],
                                ),
                                Text(
                                  " ${snapshot.data![index].status}",
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 18,
                                    //color: Color(0xff074974),
                                  ),
                                )
                              ],
                            ),
                            children: <Widget>[
                              Text(
                                "From Date : " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].fromDate.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "To Date : " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].toDate.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Applied Days : " +
                                    "${snapshot.data![index].appliedDayS.toString()}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Approved Days : " +
                                    "${snapshot.data![index].approvedDayS.toString()}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Status : " +
                                    "${snapshot.data![index].status.toString()}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              // if({snapshot.data![index].approver} != null)...[
                              //
                              //   Text("Approver33 : "+"${snapshot.data![index].approver ?? " "}",
                              //     style: GoogleFonts.bakbakOne(
                              //       fontSize: 18,
                              //       //color: Color(0xff074974),
                              //     ),
                              //   ),
                              // ]else...[
                              //   Text(" "),
                              // ],

                              Text(
                                "Approver : " +
                                    "${snapshot.data![index].approver ?? " "}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Approved/Recommended by : " +
                                    "${snapshot.data![index].approvedRecommendedBy ?? " "}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              // Text("Approved/Recommended Date : "+"${snapshot.data![index].approvedRecommendedDate}",
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // ),
                              Text(
                                "Approved By : " +
                                    "${snapshot.data![index].approvedBy ?? " "}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              // Text("Approved Date : "+"${snapshot.data![index].approvedDate}",
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Image(image: AssetImage("images/loading.gif")),
              );
            }
          },
        ),
      ),
    );
  }
}
