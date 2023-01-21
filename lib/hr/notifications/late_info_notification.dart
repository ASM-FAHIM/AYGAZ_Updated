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
// class Late_NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   Late_NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _Late_NotificationListState createState() => _Late_NotificationListState();
// }
//
// class _Late_NotificationListState extends State<Late_NotificationList> {
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
//         title: Text('Late Information Notification'),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:aygazhcm/hr/viewNotification.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../data_model/notification_model/late_notification.dart';

class Late_NotificationList extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  Late_NotificationList({required this.xposition, required this.xstaff});
  String xposition;
  String xstaff;

  @override
  _Late_NotificationListState createState() => _Late_NotificationListState();
}

class _Late_NotificationListState extends State<Late_NotificationList> {
  // fetchnotification _noteList = fetchnotification();
  //fetchnotification _noteList = fetchnotification();

  @override



  Future<List<LateNotificaitonApiModel>>? futurePost;

  String justificationnote = " ";

  Future<List<LateNotificaitonApiModel>> fetchPost() async {
    var response = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/HR/employeenotification/late.php'),
        body: jsonEncode(<String, String>{
          "xstaff": widget.xstaff,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<LateNotificaitonApiModel>(
              (json) => LateNotificaitonApiModel.fromJson(json))
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
      // appBar: AppBar(
      //   title: Text('Late Notification'),
      //   backgroundColor: Color(0xFF8CA6DB),
      // ),

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
            "Late Notification",
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
        child: FutureBuilder<List<LateNotificaitonApiModel>>(
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
                                                      .data![index].intime.date)
                                                  .toString())))
                                          .toString(),
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974)
                                        //color: Color(0xff074974)
                                      ),
                                    ),
                                    //Text(" ${snapshot.data![index].typeOfApplication}"),
                                    //Text(" ${snapshot.data![index].status}")
                                  ],
                                ),
                                Text(
                                  " Late",
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 18,
                                    //color: Color(0xff074974)
                                  ),
                                )
                              ],
                            ),
                            children: <Widget>[
                              Text(
                                "Date : " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].intime.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974)
                                ),
                              ),
                              // Text("Day : "+(DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].toDate.date).toString()))).toString(),
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // ),
                              Text(
                                "IN Time : " +
                                    (DateFormat("hh:mm:ss").format(
                                            DateTime.parse((snapshot
                                                    .data![index].intime.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974)
                                ),
                              ),
                              // Text("OUT Time : "+"${snapshot.data![index].approvedDayS.toString()}",
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // ),
                              Text(
                                "Working Hour : " +
                                    (DateFormat("hh:mm:ss").format(
                                            DateTime.parse((snapshot
                                                    .data![index]
                                                    .xworktime
                                                    .date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974)
                                ),
                              ),
                              Text(
                                "Status : " +
                                    "${snapshot.data![index].xstatuslate.toString()}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974)
                                ),
                              ),
                              Text(
                                "Note : " +
                                    "${snapshot.data![index].xnote ?? " "}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974)
                                ),
                              ),

                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Color(0xff064A76),
                                ),
                                //color: Color(0xff064A76),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Justification"),
                                          content: Column(
                                            children: [
                                              Container(
                                                //height: MediaQuery.of(context).size.height/6,
                                                child: TextFormField(
                                                  style: GoogleFonts.bakbakOne(
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                  onChanged: (input) {
                                                    justificationnote = input;
                                                  },
                                                  scrollPadding:
                                                      EdgeInsets.all(20),
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(
                                                        left:
                                                            20), // add padding to adjust text
                                                    isDense: false,

                                                    hintStyle:
                                                        GoogleFonts.bakbakOne(
                                                      //fontWeight: FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                    labelText:
                                                        "Justification Note",
                                                    labelStyle:
                                                        GoogleFonts.bakbakOne(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Color(0xff064A76),
                                              ),
                                              onPressed: () async {
                                                //http://10.1.2.7/api/adminapprove/poreject.php

                                                var response = await http.post(
                                                    Uri.parse(
                                                        'http://172.20.20.69/aygaz/HR/employeenotification/lateandearlyapply.php'),
                                                    body: jsonEncode(<String,
                                                        String>{
                                                      "xstaff": widget.xstaff,
                                                      "xnote":
                                                          justificationnote,
                                                      "xyearperdate": snapshot
                                                          .data![index]
                                                          .xyearperdate
                                                          .toString(),
                                                      "zid": "200010"
                                                    }));
                                                print(response.body);

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    "Justification Updated",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ));

                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Update Justification",
                                                style: GoogleFonts.bakbakOne(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                          scrollable: true,
                                        );
                                      });
                                },
                                child: Text(
                                  "Justification",
                                  style: GoogleFonts.bakbakOne(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
