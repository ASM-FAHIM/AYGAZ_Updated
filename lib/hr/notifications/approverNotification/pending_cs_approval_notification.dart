// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// import '../../../data_model/notification_model/admin_approver_model/do_admin_model.dart';
//
// class DO_notification extends StatefulWidget {
//   DO_notification(
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
//   State<DO_notification> createState() => _DO_notificationState();
// }
//
// class _DO_notificationState extends State<DO_notification> {
//   Future<List<DoModel>>? futurePost;
//   String rejectNote = " ";
//   Future<List<DoModel>> fetchPost() async {
//     var response = await http.post(
//         Uri.parse('http://172.20.20.69/aygaz/notifications/pendingInvoice.php'),
//         body: jsonEncode(<String, String>{
//           "xposition": widget.xposition,
//         }));
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<DoModel>((json) => DoModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
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
//             "Pending Invoice List Notification",
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
//         child: FutureBuilder<List<DoModel>>(
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
//                           padding: EdgeInsets.only(left: 10, bottom: 6.0),
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
//                                             "${snapshot.data![index].xdornum}",
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
//                                 "Invoice Number: " +
//                                     " ${snapshot.data![index].xdornum}",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "DO Date: " +
//                                     " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Delivery Date: " +
//                                     " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdatedel.date).toString()))}",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Customer ID:" +
//                                     "${snapshot.data![index].xcus}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Customer Name: " +
//                                     "${snapshot.data![index].xorg ?? " "}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Customer Type: " +
//                                     "${snapshot.data![index].xpaymentterm ?? " "}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Plant/Project Code: " +
//                                     snapshot.data![index].xwh,
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Plant/Project Name: " +
//                                     "${snapshot.data![index].xwhdesc}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Sub Category:" +
//                                     "${snapshot.data![index].xsubcat}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               //Cash
//                               Text(
//                                 "Invoice Type: " +
//                                     "${snapshot.data![index].xpaymenttype}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "District: " +
//                                     "${snapshot.data![index].xdistrictop}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Thana:" + "${snapshot.data![index].xthanaop}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Zone: " + "${snapshot.data![index].xarea}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               //ASM Name
//                               Text(
//                                 "ASM Name: " +
//                                     "${snapshot.data![index].asmname}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Territory: " +
//                                     "${snapshot.data![index].xterritory}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Division: " +
//                                     "${snapshot.data![index].xdivisionop}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Division Sales Manager Name: " +
//                                     "${snapshot.data![index].dsmname}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Territory Sales Officer Name: " +
//                                     "${snapshot.data![index].xtsoname}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Transfer Chalan Number: " +
//                                     "${snapshot.data![index].xtornum}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Order Status: " +
//                                     "${snapshot.data![index].xtornum}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Approval Status: " +
//                                     "${snapshot.data![index].xstatus}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Voucher Number: " +
//                                     "${snapshot.data![index].xvoucher ?? " "}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Text(
//                                 "Status: " +
//                                     "${snapshot.data![index].xstatusjv}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   //color: Color(0xff074974),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   FlatButton(
//                                     color: Colors.green,
//                                     onPressed: () async {
//                                       var response = await http.post(
//                                           Uri.parse(
//                                               'http://172.20.20.69/aygaz/notifications/pendingInvoiceApprove.php'),
//                                           body: jsonEncode(<String, String>{
//                                             "zid": widget.zid,
//                                             "user": widget.zemail,
//                                             "xposition": widget.xposition,
//                                             "xdornum": snapshot
//                                                 .data![index].xdornum
//                                                 .toString(),
//                                             "ypd": "0",
//                                             " xstatus": snapshot
//                                                 .data![index].xstatus
//                                                 .toString(),
//                                             "aprcs": "CS Approval"
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
//                                   FlatButton(
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
//                                                 FlatButton(
//                                                   color: Color(0xff064A76),
//                                                   onPressed: () async {
//                                                     //http://172.20.20.69/adminapprove/poreject.php
//
//                                                     var response = await http.post(
//                                                         Uri.parse(
//                                                             'http://172.20.20.69/aygaz/notifications/pendingInvoiceReject.php'),
//                                                         body: jsonEncode(<
//                                                             String, String>{
//                                                           "zid": widget.zid,
//                                                           "user": widget.zemail,
//                                                           "xposition":
//                                                               widget.xposition,
//                                                           "wh": "0",
//                                                           "xdornum": snapshot
//                                                               .data![index]
//                                                               .xdornum,
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
