import 'dart:convert';

import 'package:aygazhcm/conts_api_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../data_model/notification_model/admin_approver_model/so_admin_model.dart';

class PSRA_notification extends StatefulWidget {
  PSRA_notification(
      {required this.xposition,
      required this.xstaff,
      required this.zemail,
      required this.zid});
  String xposition;
  String xstaff;
  String zemail;
  String zid;

  @override
  State<PSRA_notification> createState() => _PSRA_notificationState();
}

class _PSRA_notificationState extends State<PSRA_notification> {
  Future<List<SoModel>>? futurePost;
  String rejectNote = " ";

  Future<List<SoModel>> fetchPost() async {
    var response = await http.post(Uri.parse(ConstApiLink().pendingPSRAApi),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<SoModel>((json) => SoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

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
            "Pending Sales Return Notification",
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
          // padding: EdgeInsets.all(20),
          // child: FutureBuilder<List<SoModel>>(
          //   future: futurePost,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (_, index) => Container(
          //           child: Column(
          //             children: [
          //               Card(
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: 10, bottom: 6.0),
          //                   child: ExpansionTile(
          //                     expandedCrossAxisAlignment:
          //                         CrossAxisAlignment.start,
          //                     title: Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         Column(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceEvenly,
          //                           children: [
          //                             Container(
          //                               width: MediaQuery.of(context).size.width /
          //                                   1.6,
          //                               child: Column(
          //                                 children: [
          //                                   Text(
          //                                     "${snapshot.data![index].xtornum}",
          //                                     style: GoogleFonts.bakbakOne(
          //                                       fontSize: 18,
          //                                       //color: Color(0xff074974),
          //                                     ),
          //                                   ),
          //                                   Text(
          //                                     "${snapshot.data![index].preparer}",
          //                                     style: GoogleFonts.bakbakOne(
          //                                       fontSize: 18,
          //                                       //color: Color(0xff074974),
          //                                     ),
          //                                   ),
          //                                   Text(
          //                                     "${snapshot.data![index].deptname}",
          //                                     style: GoogleFonts.bakbakOne(
          //                                       fontSize: 18,
          //                                       //color: Color(0xff074974),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ],
          //                     ),
          //                     children: <Widget>[
          //                       Text(
          //                         "SO NO: " + " ${snapshot.data![index].xtornum}",
          //                         textAlign: TextAlign.center,
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "SO Date: " +
          //                             " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
          //                         textAlign: TextAlign.center,
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "Est. Delivery Date: " +
          //                             " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdatedel.date).toString()))}",
          //                         textAlign: TextAlign.center,
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "From Store: " +
          //                             "  ${snapshot.data![index].xfwh}",
          //                         textAlign: TextAlign.center,
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       // Text(
          //                       //   "Store Name:" +
          //                       //       "${snapshot.data![index].}",
          //                       //   style: GoogleFonts.bakbakOne(
          //                       //     fontSize: 18,
          //                       //     //color: Color(0xff074974),
          //                       //   ),
          //                       // ),
          //                       Text(
          //                         "Catagory: " + snapshot.data![index].xsubcat,
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "Dealer Name: " +
          //                             "${snapshot.data![index].cusname ?? " "}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "SO Status: " +
          //                             "${snapshot.data![index].xstatustor}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "Territory: " +
          //                             "${snapshot.data![index].xterritory}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "TSO: " + "${snapshot.data![index].xtso}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "TSO Name: " +
          //                             "${snapshot.data![index].xtsoname}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       // Text(
          //                       //   "Credit Limit: " + "${snapshot.data![index].credit}",
          //                       //   style: GoogleFonts.bakbakOne(
          //                       //     fontSize: 18,
          //                       //     //color: Color(0xff074974),
          //                       //   ),
          //                       // ),
          //                       // Text(
          //                       //   "Credit Used: " +
          //                       //       "${snapshot.data![index].crused}",
          //                       //   style: GoogleFonts.bakbakOne(
          //                       //     fontSize: 18,
          //                       //     //color: Color(0xff074974),
          //                       //   ),
          //                       // ),
          //                       // Text(
          //                       //   "Credit Availability: " +
          //                       //       "${snapshot.data![index].creditchk}",
          //                       //   style: GoogleFonts.bakbakOne(
          //                       //     fontSize: 18,
          //                       //     //color: Color(0xff074974),
          //                       //   ),
          //                       // ),
          //                       Text(
          //                         "Total SO Value: " +
          //                             "${snapshot.data![index].xtotamt}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Text(
          //                         "Long Description: " +
          //                             "${snapshot.data![index].xlong}",
          //                         style: GoogleFonts.bakbakOne(
          //                           fontSize: 18,
          //                           //color: Color(0xff074974),
          //                         ),
          //                       ),
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           TextButton(
          //                             color: Colors.green,
          //                             onPressed: () async {
          //                               var response = await http.post(
          //                                   Uri.parse(
          //                                       'no data present for further proceed'),
          //                                   body: jsonEncode(<String, String>{
          //                                     "zid": widget.zid,
          //                                     "user": widget.zemail,
          //                                     "xposition": widget.xposition,
          //                                     "xcrnnum": snapshot
          //                                         .data![index].xcrnnum
          //                                         .toString(),
          //                                     "ypd": "0",
          //                                     "aprcs": "SO Approval"
          //                                   }));
          //
          //                               Get.snackbar('Message', 'Approved',
          //                                   backgroundColor: Color(0XFF8CA6DB),
          //                                   colorText: Colors.white,
          //                                   snackPosition: SnackPosition.BOTTOM);
          //
          //                               setState(() {
          //                                 snapshot.data!.removeAt(index);
          //                               });
          //
          //                               print(response.statusCode);
          //                               print(response.body);
          //                             },
          //                             child: Text("Approve"),
          //                           ),
          //                           SizedBox(
          //                             width: 50,
          //                           ),
          //                           TextButton(
          //                             color: Colors.red,
          //                             onPressed: () {
          //                               showDialog(
          //                                   context: context,
          //                                   builder: (BuildContext context) {
          //                                     return AlertDialog(
          //                                       title: const Text("Reject Note"),
          //                                       content: Column(
          //                                         children: [
          //                                           Container(
          //                                             //height: MediaQuery.of(context).size.height/6,
          //                                             child: TextFormField(
          //                                               style:
          //                                                   GoogleFonts.bakbakOne(
          //                                                 //fontWeight: FontWeight.bold,
          //                                                 fontSize: 18,
          //                                                 color: Colors.black,
          //                                               ),
          //                                               onChanged: (input) {
          //                                                 rejectNote = input;
          //                                               },
          //                                               validator: (input) {
          //                                                 if (input!.isEmpty) {
          //                                                   return "Please Write Reject Note";
          //                                                 }
          //                                               },
          //                                               scrollPadding:
          //                                                   EdgeInsets.all(20),
          //                                               decoration:
          //                                                   InputDecoration(
          //                                                 contentPadding:
          //                                                     EdgeInsets.only(
          //                                                         left:
          //                                                             20), // add padding to adjust text
          //                                                 isDense: false,
          //
          //                                                 hintStyle: GoogleFonts
          //                                                     .bakbakOne(
          //                                                   //fontWeight: FontWeight.bold,
          //                                                   fontSize: 18,
          //                                                   color: Colors.black,
          //                                                 ),
          //                                                 labelText:
          //                                                     "Reject Note",
          //                                                 labelStyle: GoogleFonts
          //                                                     .bakbakOne(
          //                                                   fontSize: 18,
          //                                                   color: Colors.black,
          //                                                 ),
          //                                                 border:
          //                                                     OutlineInputBorder(),
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                       actions: [
          //                                         TextButton(
          //                                           color: Color(0xff064A76),
          //                                           onPressed: () async {
          //                                             //http://172.20.20.69/adminapprove/poreject.php
          //
          //                                             var response = await http.post(
          //                                                 Uri.parse(
          //                                                     'no data present for further proceed'),
          //                                                 body: jsonEncode(<
          //                                                     String, String>{
          //                                                   "zid": widget.zid,
          //                                                   "user": widget.zemail,
          //                                                   "xposition":
          //                                                       widget.xposition,
          //                                                   "wh": "0",
          //                                                   "xtornum": snapshot
          //                                                       .data![index]
          //                                                       .xtornum,
          //                                                   "xnote1": rejectNote
          //                                                 }));
          //                                             print(response.statusCode);
          //                                             print(response.body);
          //                                             Navigator.pop(context);
          //
          //                                             Get.snackbar(
          //                                                 'Message', 'Rejected',
          //                                                 backgroundColor:
          //                                                     Color(0XFF8CA6DB),
          //                                                 colorText: Colors.white,
          //                                                 snackPosition:
          //                                                     SnackPosition
          //                                                         .BOTTOM);
          //
          //                                             setState(() {
          //                                               snapshot.data!
          //                                                   .removeAt(index);
          //                                             });
          //                                           },
          //                                           child: Text(
          //                                             "Reject",
          //                                             style:
          //                                                 GoogleFonts.bakbakOne(
          //                                               color: Colors.white,
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       ],
          //                                       scrollable: true,
          //                                     );
          //                                   });
          //                             },
          //                             child: Text("Reject"),
          //                           ),
          //                         ],
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     } else {
          //       return Center(
          //         child: Image(image: AssetImage("images/loading.gif")),
          //       );
          //     }
          //   },
          // ),
          ),
    );
  }
}
