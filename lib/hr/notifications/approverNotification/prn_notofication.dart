import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PRN_notification extends StatefulWidget {
  PRN_notification(
      {required this.xposition,
      required this.xstaff,
      required this.zemail,
      required this.zid});
  String xposition;
  String xstaff;
  String zemail;
  String zid;

  @override
  State<PRN_notification> createState() => _PRN_notificationState();
}

//No need to prn notification

class _PRN_notificationState extends State<PRN_notification> {
  // Future<List<''>>? futurePost;
  // String rejectNote = " ";
  // Future<List<''>> fetchPost() async {
  //   var response = await http.post(
  //       Uri.parse('http://172.20.20.69/aygaz/notifications/pendingPurchaseReturn.php'),
  //       body: jsonEncode(<String, String>{
  //         "xposition": widget.xposition,
  //       }));
  //
  //   // print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed.map<GrnModel>((json) => GrnModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // submitData();
  //   futurePost = fetchPost();
  //
  //   fetchPost().whenComplete(() => futurePost);
  // }

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
            "Pending Purchase Return Notification",
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
      // body: Container(
      //   padding: EdgeInsets.all(20),
      //   child: FutureBuilder<List<GrnModel>>(
      //     future: futurePost,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (_, index) => Container(
      //             child: Column(
      //               children: [
      //                 Card(
      //                   child: Padding(
      //                     padding: EdgeInsets.only(left: 10, bottom: 6.0),
      //                     child: ExpansionTile(
      //                       expandedCrossAxisAlignment:
      //                           CrossAxisAlignment.start,
      //                       title: Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         children: [
      //                           Column(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Container(
      //                                 width: MediaQuery.of(context).size.width /
      //                                     1.6,
      //                                 child: Column(
      //                                   children: [
      //                                     Text(
      //                                       "${snapshot.data![index].xgrnnum}",
      //                                       style: GoogleFonts.bakbakOne(
      //                                         fontSize: 18,
      //                                         //color: Color(0xff074974),
      //                                       ),
      //                                     ),
      //                                     Text(
      //                                       "${snapshot.data![index].preparer}",
      //                                       style: GoogleFonts.bakbakOne(
      //                                         fontSize: 18,
      //                                         //color: Color(0xff074974),
      //                                       ),
      //                                     ),
      //                                     Text(
      //                                       "${snapshot.data![index].deptname}",
      //                                       style: GoogleFonts.bakbakOne(
      //                                         fontSize: 18,
      //                                         //color: Color(0xff074974),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                       children: <Widget>[
      //                         Text(
      //                           "Goods receipts Note Number: " +
      //                               " ${snapshot.data![index].xgrnnum}",
      //                           textAlign: TextAlign.center,
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Date: " +
      //                               " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
      //                           textAlign: TextAlign.center,
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Invoice Number: " +
      //                               "  ${snapshot.data![index].xinvnum}",
      //                           textAlign: TextAlign.center,
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "LC No: " + snapshot.data![index].xlcno,
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Supplier ID:" +
      //                               "${snapshot.data![index].xcus}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Supplier Name: " +
      //                               "${snapshot.data![index].xorg ?? " "}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Challan No:" + "${snapshot.data![index].xref}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Goods Receipts Note Status: " +
      //                               "${snapshot.data![index].xstatusgrn}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Plant/Store: " +
      //                               "${snapshot.data![index].xwh}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Store Name:" +
      //                               "${snapshot.data![index].xwhdesc}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Text(
      //                           "Note: " + "${snapshot.data![index].xnote}",
      //                           style: GoogleFonts.bakbakOne(
      //                             fontSize: 18,
      //                             //color: Color(0xff074974),
      //                           ),
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             TextButton(
      //                               color: Colors.green,
      //                               onPressed: () async {
      //                                 var response = await http.post(
      //                                     Uri.parse(
      //                                         'http://172.20.20.69/aygaz/notifications/PRNapprove.php'),
      //                                     body: jsonEncode(<String, String>{
      //                                       "zid": widget.zid,
      //                                       "user": widget.zemail,
      //                                       "xposition": widget.xposition,
      //                                       "xtornum": snapshot
      //                                           .data![index].xtornum
      //                                           .toString(),
      //                                       "ypd": "0",
      //                                       " xstatustor": snapshot
      //                                           .data![index].xstatustor
      //                                           .toString(),
      //                                       "aprcs": "SPR Approval"
      //                                     }));
      //
      //                                 Get.snackbar('Message', 'Approved',
      //                                     backgroundColor: Color(0XFF8CA6DB),
      //                                     colorText: Colors.white,
      //                                     snackPosition: SnackPosition.BOTTOM);
      //
      //                                 setState(() {
      //                                   snapshot.data!.removeAt(index);
      //                                 });
      //
      //                                 print(response.statusCode);
      //                                 print(response.body);
      //                               },
      //                               child: Text("Approve"),
      //                             ),
      //                             SizedBox(
      //                               width: 50,
      //                             ),
      //                             TextButton(
      //                               color: Colors.red,
      //                               onPressed: () {
      //                                 showDialog(
      //                                     context: context,
      //                                     builder: (BuildContext context) {
      //                                       return AlertDialog(
      //                                         title: const Text("Reject Note"),
      //                                         content: Column(
      //                                           children: [
      //                                             Container(
      //                                               //height: MediaQuery.of(context).size.height/6,
      //                                               child: TextFormField(
      //                                                 style:
      //                                                     GoogleFonts.bakbakOne(
      //                                                   //fontWeight: FontWeight.bold,
      //                                                   fontSize: 18,
      //                                                   color: Colors.black,
      //                                                 ),
      //                                                 onChanged: (input) {
      //                                                   rejectNote = input;
      //                                                 },
      //                                                 validator: (input) {
      //                                                   if (input!.isEmpty) {
      //                                                     return "Please Write Reject Note";
      //                                                   }
      //                                                 },
      //                                                 scrollPadding:
      //                                                     EdgeInsets.all(20),
      //                                                 decoration:
      //                                                     InputDecoration(
      //                                                   contentPadding:
      //                                                       EdgeInsets.only(
      //                                                           left:
      //                                                               20), // add padding to adjust text
      //                                                   isDense: false,
      //
      //                                                   hintStyle: GoogleFonts
      //                                                       .bakbakOne(
      //                                                     //fontWeight: FontWeight.bold,
      //                                                     fontSize: 18,
      //                                                     color: Colors.black,
      //                                                   ),
      //                                                   labelText:
      //                                                       "Reject Note",
      //                                                   labelStyle: GoogleFonts
      //                                                       .bakbakOne(
      //                                                     fontSize: 18,
      //                                                     color: Colors.black,
      //                                                   ),
      //                                                   border:
      //                                                       OutlineInputBorder(),
      //                                                 ),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                         actions: [
      //                                           TextButton(
      //                                             color: Color(0xff064A76),
      //                                             onPressed: () async {
      //                                               //http://172.20.20.69/adminapprove/poreject.php
      //
      //                                               var response = await http.post(
      //                                                   Uri.parse(
      //                                                       'http://172.20.20.69/aygaz/notifications/PRNreject.php),
      //                                                   body: jsonEncode(<
      //                                                       String, String>{
      //                                                     "zid": widget.zid,
      //                                                     "user": widget.zemail,
      //                                                     "xposition":
      //                                                         widget.xposition,
      //                                                     "wh": "0",
      //                                                     "xtornum": snapshot
      //                                                         .data![index]
      //                                                         .xtornum,
      //                                                     "xnote1": rejectNote
      //                                                   }));
      //                                               print(response.statusCode);
      //                                               print(response.body);
      //                                               Navigator.pop(context);
      //
      //                                               Get.snackbar(
      //                                                   'Message', 'Rejected',
      //                                                   backgroundColor:
      //                                                       Color(0XFF8CA6DB),
      //                                                   colorText: Colors.white,
      //                                                   snackPosition:
      //                                                       SnackPosition
      //                                                           .BOTTOM);
      //
      //                                               setState(() {
      //                                                 snapshot.data!
      //                                                     .removeAt(index);
      //                                               });
      //                                             },
      //                                             child: Text(
      //                                               "Reject",
      //                                               style:
      //                                                   GoogleFonts.bakbakOne(
      //                                                 color: Colors.white,
      //                                               ),
      //                                             ),
      //                                           ),
      //                                         ],
      //                                         scrollable: true,
      //                                       );
      //                                     });
      //                               },
      //                               child: Text("Reject"),
      //                             ),
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       } else {
      //         return Center(
      //           child: Image(image: AssetImage("images/loading.gif")),
      //         );
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
