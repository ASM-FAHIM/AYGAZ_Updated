// import 'dart:convert';
//
// import 'package:aygazhcm/conts_api_link.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// import '../../../data_model/notification_model/admin_approver_model/spot_purchase_advance_admin_model.dart';
//
// class SpotPurchaseAdvance_notification extends StatefulWidget {
//   SpotPurchaseAdvance_notification(
//       {required this.xposition,
//       required this.xstaff,
//       required this.zemail,
//       required this.zid});
//   String xposition;
//   String xstaff;
//   String zemail;
//   String zid;
//
//   @override
//   State<SpotPurchaseAdvance_notification> createState() =>
//       _SpotPurchaseAdvance_notificationState();
// }
//
// class _SpotPurchaseAdvance_notificationState
//     extends State<SpotPurchaseAdvance_notification> {
//   Future<List<SpaModel>>? futurePost;
//   String rejectNote = " ";
//
//   Future<List<SpaModel>> fetchPost() async {
//     var response =
//         await http.post(Uri.parse(ConstApiLink().pendingSpotPurchaseAdvanceApi),
//             body: jsonEncode(<String, String>{
//               "xposition": widget.xposition,
//             }));
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<SpaModel>((json) => SpaModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   //Spot purchase advance has no data for process
//
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Color(0xff064A76),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Center(
//           child: Text(
//             "Spot Purchase Advance Notification",
//             style: GoogleFonts.bakbakOne(
//               fontSize: 20,
//               color: Color(0xff074974),
//             ),
//           ),
//         ),
//         actions: [
//           SizedBox(
//             width: 20,
//           )
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: FutureBuilder<List<SpaModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       Card(
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, bottom: 10.0),
//                           child: ExpansionTile(
//                             expandedCrossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width /
//                                           1.6,
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             "${snapshot.data![index].xporeqnum}",
//                                             style: GoogleFonts.bakbakOne(
//                                               fontSize: 18,
//                                               //color: Color(0xff074974),
//                                             ),
//                                           ),
//                                           Text(
//                                             "${snapshot.data![index].preparer}",
//                                             style: GoogleFonts.bakbakOne(
//                                               fontSize: 18,
//                                               //color: Color(0xff074974),
//                                             ),
//                                           ),
//                                           Text(
//                                             "${snapshot.data![index].deptname}",
//                                             style: GoogleFonts.bakbakOne(
//                                               fontSize: 18,
//                                               //color: Color(0xff074974),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             children: <Widget>[
//                               Text(
//                                 "Requisition Number: " +
//                                     " ${snapshot.data![index].xporeqnum}",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Date: " +
//                                     " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Requisition Status: " +
//                                     snapshot.data![index].xstatusreq,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Requisition Type:" +
//                                     "${snapshot.data![index].xtypeobj ?? " "}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Note: " + "${snapshot.data![index].xnote}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//
//                               //without details page , need to create new details page
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   TextButton(
//                                     color: Colors.green,
//                                     onPressed: () async {
//                                       var response = await http.post(
//                                           Uri.parse(
//                                               'http://172.20.20.69/aygaz/notifications/spotpurchaseadvanceapprove.php'),
//                                           body: jsonEncode(<String, String>{
//                                             "zid": widget.zid,
//                                             "user": widget.zemail,
//                                             "xposition": widget.xposition,
//                                             "xporeqnum": snapshot
//                                                 .data![index].xporeqnum
//                                                 .toString(),
//                                             "ypd": "0",
//                                             "xstatusreq": snapshot
//                                                 .data![index].xstatusreq
//                                                 .toString(),
//                                             "aprcs": "SPR Approval"
//                                           }));
//
//                                       Get.snackbar('Message', 'Approved',
//                                           backgroundColor: Color(0XFF8CA6DB),
//                                           colorText: Colors.white,
//                                           snackPosition: SnackPosition.BOTTOM);
//
//                                       setState(() {
//                                         snapshot.data!.removeAt(index);
//                                       });
//
//                                       print(response.statusCode);
//                                       print(response.body);
//                                     },
//                                     child: Text("Approve"),
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                   ),
//                                   TextButton(
//                                     color: Colors.red,
//                                     onPressed: () {
//                                       showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return AlertDialog(
//                                               title: const Text("Reject Note"),
//                                               content: Column(
//                                                 children: [
//                                                   Container(
//                                                     //height: MediaQuery.of(context).size.height/6,
//                                                     child: TextFormField(
//                                                       style:
//                                                           GoogleFonts.bakbakOne(
//                                                         //fontWeight: FontWeight.bold,
//                                                         fontSize: 18,
//                                                         color: Colors.black,
//                                                       ),
//                                                       onChanged: (input) {
//                                                         rejectNote = input;
//                                                       },
//                                                       validator: (input) {
//                                                         if (input!.isEmpty) {
//                                                           return "Please Write Reject Note";
//                                                         }
//                                                       },
//                                                       scrollPadding:
//                                                           EdgeInsets.all(20),
//                                                       decoration:
//                                                           InputDecoration(
//                                                         contentPadding:
//                                                             EdgeInsets.only(
//                                                                 left:
//                                                                     20), // add padding to adjust text
//                                                         isDense: false,
//
//                                                         hintStyle: GoogleFonts
//                                                             .bakbakOne(
//                                                           //fontWeight: FontWeight.bold,
//                                                           fontSize: 18,
//                                                           color: Colors.black,
//                                                         ),
//                                                         labelText:
//                                                             "Reject Note",
//                                                         labelStyle: GoogleFonts
//                                                             .bakbakOne(
//                                                           fontSize: 18,
//                                                           color: Colors.black,
//                                                         ),
//                                                         border:
//                                                             OutlineInputBorder(),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               actions: [
//                                                 TextButton(
//                                                   color: Color(0xff064A76),
//                                                   onPressed: () async {
//                                                     //http://172.20.20.69/adminapprove/poreject.php
//
//                                                     var response = await http.post(
//                                                         Uri.parse(
//                                                             'http://172.20.20.69/aygaz/notifications/spotpurchaseadvancereject.php'),
//                                                         body: jsonEncode(<
//                                                             String, String>{
//                                                           "zid": widget.zid,
//                                                           "user": widget.zemail,
//                                                           "xposition":
//                                                               widget.xposition,
//                                                           "wh": "0",
//                                                           "xporeqnum": snapshot
//                                                               .data![index]
//                                                               .xporeqnum,
//                                                           "xnote1": rejectNote
//                                                         }));
//                                                     print(response.statusCode);
//                                                     print(response.body);
//                                                     Navigator.pop(context);
//
//                                                     Get.snackbar(
//                                                         'Message', 'Rejected',
//                                                         backgroundColor:
//                                                             Color(0XFF8CA6DB),
//                                                         colorText: Colors.white,
//                                                         snackPosition:
//                                                             SnackPosition
//                                                                 .BOTTOM);
//
//                                                     setState(() {
//                                                       snapshot.data!
//                                                           .removeAt(index);
//                                                     });
//                                                   },
//                                                   child: Text(
//                                                     "Reject",
//                                                     style:
//                                                         GoogleFonts.bakbakOne(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                               scrollable: true,
//                                             );
//                                           });
//                                     },
//                                     child: Text("Reject"),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
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

import 'package:aygazhcm/conts_api_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../data_model/notification_model/admin_approver_model/spot_purchase_advance_admin_model.dart';
import 'details/spot_purchase_advance_notification_details.dart';

class SpotPurchaseAdvance_notification extends StatefulWidget {
  SpotPurchaseAdvance_notification(
      {required this.xposition,
        required this.xstaff,
        required this.zemail,
        required this.zid});
  String xposition;
  String xstaff;
  String zemail;
  String zid;

  @override
  State<SpotPurchaseAdvance_notification> createState() =>
      _SpotPurchaseAdvance_notificationState();
}

class _SpotPurchaseAdvance_notificationState
    extends State<SpotPurchaseAdvance_notification> {



  Future<List<SpaModel>>? futurePost;
  String rejectNote = " ";

  Future<List<SpaModel>> fetchPost() async {
    var response =
    await http.post(Uri.parse(ConstApiLink().pendingSpotPurchaseAdvanceApi),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<SpaModel>((json) => SpaModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Spot purchase advance has no data for process



  @override
  void initState() {
    super.initState();
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
            "Spot Purchase Advance Notification",
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
        child: FutureBuilder<List<SpaModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 10.0),
                          child: ExpansionTile(
                            expandedCrossAxisAlignment:
                            CrossAxisAlignment.start,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.6,
                                      child: Column(
                                        children: [
                                          Text(
                                            "${snapshot.data![index].xporeqnum}",
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              //color: Color(0xff074974),
                                            ),
                                          ),
                                          Text(
                                            "${snapshot.data![index].preparer}",
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              //color: Color(0xff074974),
                                            ),
                                          ),
                                          Text(
                                            "${snapshot.data![index].deptname}",
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              //color: Color(0xff074974),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            children: <Widget>[
                              Text(
                                "Requisition Number: " +
                                    " ${snapshot.data![index].xporeqnum}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Date: " +
                                    " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Total Advance Required: " +
                                    " ${snapshot.data![index].xlineamt} BDT",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Requisition Status: " +
                                    snapshot.data![index].xstatusreq,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Requisition Type:" +
                                    "${snapshot.data![index].xtypeobj ?? " "}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Note: " + "${snapshot.data![index].xnote}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              //without details page , need to create new details page
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.lightBlueAccent,
                                    ),
                                    onPressed: () async {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Spot_purchase_advance_details_notification(
                                        xporeqnum : '${snapshot.data![index].xporeqnum}',
                                        zid : '${widget.zid}',
                                        zemail : '${widget.zemail}',
                                        xposition : '${widget.xposition}',
                                        xstatusreq : '${snapshot.data![index].xstatusreq}',
                                      )));
                                    },
                                    child: Text("Details"),
                                  ),
                                  // SizedBox(
                                  //   width: 50,
                                  // ),
                                  //
                                  //
                                  // TextButton(
                                  //   color: Colors.green,
                                  //   onPressed: () async {
                                  //     var response = await http.post(
                                  //         Uri.parse(
                                  //             '${ConstApiLink().pendingSpotPurchaseAdvanceApproveApi}'),
                                  //         body: jsonEncode(<String, String>{
                                  //           "zid": widget.zid,
                                  //           "user": widget.zemail,
                                  //           "xposition": widget.xposition,
                                  //           "xporeqnum": snapshot
                                  //               .data![index].xporeqnum
                                  //               .toString(),
                                  //           "ypd": "0",
                                  //           "xstatusreq": snapshot
                                  //               .data![index].xstatusreq
                                  //               .toString(),
                                  //           "aprcs": "SPR Approval"
                                  //         }));
                                  //
                                  //     Get.snackbar('Message', 'Approved',
                                  //         backgroundColor: Color(0XFF8CA6DB),
                                  //         colorText: Colors.white,
                                  //         snackPosition: SnackPosition.BOTTOM);
                                  //
                                  //     setState(() {
                                  //       snapshot.data!.removeAt(index);
                                  //     });
                                  //
                                  //     print(response.statusCode);
                                  //     print(response.body);
                                  //   },
                                  //   child: Text("Approve"),
                                  // ),
                                  // SizedBox(
                                  //   width: 50,
                                  // ),
                                  // TextButton(
                                  //   color: Colors.red,
                                  //   onPressed: () {
                                  //     showDialog(
                                  //         context: context,
                                  //         builder: (BuildContext context) {
                                  //           return AlertDialog(
                                  //             title: const Text("Reject Note"),
                                  //             content: Column(
                                  //               children: [
                                  //                 Container(
                                  //                   //height: MediaQuery.of(context).size.height/6,
                                  //                   child: TextFormField(
                                  //                     style:
                                  //                         GoogleFonts.bakbakOne(
                                  //                       //fontWeight: FontWeight.bold,
                                  //                       fontSize: 18,
                                  //                       color: Colors.black,
                                  //                     ),
                                  //                     onChanged: (input) {
                                  //                       rejectNote = input;
                                  //                     },
                                  //                     validator: (input) {
                                  //                       if (input!.isEmpty) {
                                  //                         return "Please Write Reject Note";
                                  //                       }
                                  //                     },
                                  //                     scrollPadding:
                                  //                         EdgeInsets.all(20),
                                  //                     decoration:
                                  //                         InputDecoration(
                                  //                       contentPadding:
                                  //                           EdgeInsets.only(
                                  //                               left:
                                  //                                   20), // add padding to adjust text
                                  //                       isDense: false,
                                  //
                                  //                       hintStyle: GoogleFonts
                                  //                           .bakbakOne(
                                  //                         //fontWeight: FontWeight.bold,
                                  //                         fontSize: 18,
                                  //                         color: Colors.black,
                                  //                       ),
                                  //                       labelText:
                                  //                           "Reject Note",
                                  //                       labelStyle: GoogleFonts
                                  //                           .bakbakOne(
                                  //                         fontSize: 18,
                                  //                         color: Colors.black,
                                  //                       ),
                                  //                       border:
                                  //                           OutlineInputBorder(),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             actions: [
                                  //               TextButton(
                                  //                 color: Color(0xff064A76),
                                  //                 onPressed: () async {
                                  //                   //http://172.20.20.69/adminapprove/poreject.php
                                  //
                                  //                   var response = await http.post(
                                  //                       Uri.parse(
                                  //                           '${ConstApiLink().pendingSpotPurchaseAdvanceRejectApi}'),
                                  //                       body: jsonEncode(<
                                  //                           String, String>{
                                  //                         "zid": widget.zid,
                                  //                         "user": widget.zemail,
                                  //                         "xposition":
                                  //                             widget.xposition,
                                  //                         "wh": "0",
                                  //                         "xporeqnum": snapshot
                                  //                             .data![index]
                                  //                             .xporeqnum,
                                  //                         "xnote1": rejectNote
                                  //                       }));
                                  //                   print(response.statusCode);
                                  //                   print(response.body);
                                  //                   Navigator.pop(context);
                                  //
                                  //                   Get.snackbar(
                                  //                       'Message', 'Rejected',
                                  //                       backgroundColor:
                                  //                           Color(0XFF8CA6DB),
                                  //                       colorText: Colors.white,
                                  //                       snackPosition:
                                  //                           SnackPosition
                                  //                               .BOTTOM);
                                  //
                                  //                   setState(() {
                                  //                     snapshot.data!
                                  //                         .removeAt(index);
                                  //                   });
                                  //                 },
                                  //                 child: Text(
                                  //                   "Reject",
                                  //                   style:
                                  //                       GoogleFonts.bakbakOne(
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //             scrollable: true,
                                  //           );
                                  //         });
                                  //   },
                                  //   child: Text("Reject"),
                                  // ),-
                                ],
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
