// import 'dart:convert';
//
// import 'package:aygazhcm/hr/notification.dart';
// import 'package:aygazhcm/hr/notifications/approverNotification/screen/approver.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import '../data_model/loginModel.dart';
// import '../data_model/notificaiton_count/user_count.dart';
// import '../data_model/zid_model.dart';
//
// class Get_zid extends StatefulWidget {
//   // const get_zid({Key? key}) : super(key: key);
//
//   Get_zid(
//       {required this.zemail,
//       required this.loginModel,
//       required this.xposition,
//       required this.xstaff});
//   String zemail;
//   LoginModel loginModel;
//   String xstaff;
//   String xposition;
//
//   @override
//   _Get_zidState createState() => _Get_zidState();
// }
//
// class _Get_zidState extends State<Get_zid> {
//   Future<List<ZidModel>>? futurePost;
//
//   Future<List<ZidModel>> fetchPost() async {
//     var response = await http.post(
//         Uri.parse('http://172.20.20.69/aygaz/notifications/zid.php'),
//         body: jsonEncode(<String, String>{
//           "zemail": widget.zemail,
//         }));
//
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<ZidModel>((json) => ZidModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   // changeImage(String statusdemo) {
//   //   switch (statusdemo) {
//   //     case "United LPG Ltd.":
//   //       return AssetImage("images/logo/200010.png");
//   //
//   //     case "United Group-Power Division":
//   //       return AssetImage("images/logo/100060.png");
//   //
//   //     case "United Power Generation & Distribution Co. Ltd.":
//   //       return AssetImage("images/logo/100000.png");
//   //
//   //     case "United Engineering & Power Services Ltd.":
//   //       return AssetImage("images/logo/100010.png");
//   //
//   //     case "United Ashuganj Power Ltd.":
//   //       return AssetImage("images/logo/100020.png");
//   //
//   //     case "United Ashuganj Energy Ltd.":
//   //       return AssetImage("images/logo/100030.png");
//   //
//   //     case "United Anwara Power Ltd.":
//   //       return AssetImage("images/logo/100040.png");
//   //
//   //     case "United Energy Ltd. (Former-SPGCL)":
//   //       return AssetImage("images/logo/100050.png");
//   //
//   //     case "United Enterprises & Co. Ltd.":
//   //       return AssetImage("images/logo/100060.png");
//   //
//   //     case "United Property Solutions Ltd.":
//   //       return AssetImage("images/logo/100070.png");
//   //
//   //     case "UEPSL - Lube Trading":
//   //       return AssetImage("images/logo/100090.png");
//   //
//   //     case "United Jamalpur Power Ltd.":
//   //       return AssetImage("images/logo/100100.png");
//   //
//   //     case "United Mymensingh Power Ltd.":
//   //       return AssetImage("images/logo/100110.png");
//   //
//   //     case "United Power Generation & Distribution Co. Ltd.":
//   //       return AssetImage("images/logo/100000.png");
//   //
//   //     case "United City Twin Tower Developers Ltd.":
//   //       return AssetImage("images/logo/100120.png");
//   //
//   //     case "United Payra Power Ltd.":
//   //       return AssetImage("images/logo/100130.png");
//   //
//   //     case "Leviathan Global Bd Ltd.":
//   //       return AssetImage("images/logo/100140.png");
//   //
//   //     case "Orange Solutions Ltd.":
//   //       return AssetImage("images/logo/100150.png");
//   //
//   //     case "Orange IT Ltd.":
//   //       return AssetImage("images/logo/100160.png");
//   //
//   //     case "United Property Solutions Ltd. (New)":
//   //       return AssetImage("images/logo/100170.png");
//   //
//   //     case "Mosjid Al Mustafa":
//   //       return AssetImage("images/logo/100180.png");
//   //
//   //     case "Neptune Land Development Ltd.":
//   //       return AssetImage("images/logo/100190.png");
//   //
//   //     case "United Sulpho Chemicals Ltd.":
//   //       return AssetImage("images/logo/100200.png");
//   //
//   //     case "United Purbachol Lands Ltd.":
//   //       return AssetImage("images/logo/100210.png");
//   //
//   //     case "United Nursing College":
//   //       return AssetImage("images/logo/100220.png");
//   //
//   //     case "United Medical College and Hospital":
//   //       return AssetImage("images/logo/100230.png");
//   //
//   //     case "UECL (F&A)":
//   //       return AssetImage("images/logo/300010.png");
//   //
//   //     case "Neptune Commercial Ltd. (F&A)":
//   //       return AssetImage("images/logo/300020.png");
//   //
//   //     case "Neptune Land Development Ltd. (F&A)":
//   //       return AssetImage("images/logo/300030.png");
//   //
//   //     case "Neptune Properties (Firm) (F&A)":
//   //       return AssetImage("images/logo/300040.png");
//   //
//   //     case "United Tank Terminal Ltd. (F&A)- OLD":
//   //       return AssetImage("images/logo/300050.png");
//   //
//   //     case "Shugandha Holdings Ltd. (F&A)":
//   //       return AssetImage("images/logo/300060.png");
//   //
//   //     case "UG Security Service Ltd. (F&A)":
//   //       return AssetImage("images/logo/300070.png");
//   //
//   //     case "United Makka Madina Travel & Assistance Co.":
//   //       return AssetImage("images/logo/300080.png");
//   //
//   //     case "United Polymars Ltd. (F&A)":
//   //       return AssetImage("images/logo/300090.png");
//   //
//   //     case "United Purbachal Lands Ltd. (F&A)":
//   //       return AssetImage("images/logo/300100.png");
//   //
//   //     case "Moulvi Tea Company (Pvt.) Ltd":
//   //       return AssetImage("images/logo/300110.png");
//   //
//   //     case "United Shipping and Logistic Services Ltd. (F&A)":
//   //       return AssetImage("images/logo/300120.png");
//   //
//   //     case "United LPG Ltd. (F&A)":
//   //       return AssetImage("images/logo/300130.png");
//   //
//   //     case "United Refinery and Bulk Storages Ltd.":
//   //       return AssetImage("images/logo/300140.png");
//   //
//   //     case "Airport Hotels Ltd. (F&A)":
//   //       return AssetImage("images/logo/300150.png");
//   //
//   //     case "National Oil Carriers (F&A)":
//   //       return AssetImage("images/logo/300160.png");
//   //
//   //     case "United Polymars Ltd. - Mask Project (F&A)":
//   //       return AssetImage("images/logo/300170.png");
//   //
//   //     case "United Sulpho - Chemicals Ltd (USCL) (F&A)":
//   //       return AssetImage("images/logo/300180.png");
//   //
//   //     case "Oil Carriers Ltd.":
//   //       return AssetImage("images/logo/300190.png");
//   //
//   //     case "Chief Advisor Accounts":
//   //       return AssetImage("images/logo/300200.png");
//   //
//   //     case "United Lube Oil Ltd.":
//   //       return AssetImage("images/logo/300210.png");
//   //
//   //     case "United Tank Terminal Ltd.":
//   //       return AssetImage("images/logo/300220.png");
//   //
//   //     case "United Elevator World Ltd.":
//   //       return AssetImage("images/logo/300230.png");
//   //
//   //     case "Dhaka Indenting Ltd.":
//   //       return AssetImage("images/logo/300240.png");
//   //
//   //     case "ECO-LIFE RESORTS LTD.":
//   //       return AssetImage("images/logo/300250.png");
//   //
//   //     // case "United Engineering & Power Services Ltd.":
//   //     //   return AssetImage("images/logo/100010.png");
//   //     //
//   //     // case "United Engineering & Power Services Ltd.":
//   //     //   return AssetImage("images/logo/100010.png");
//   //     //
//   //     // case "United Engineering & Power Services Ltd.":
//   //     //   return AssetImage("images/logo/100010.png");
//   //
//   //     default:
//   //       return AssetImage("images/logo/100010.png");
//   //   }
//   // }
//
//   String earlyCount = "0";
//   late UserEarlyCount earlyCount1;
//
//   String lateCount = "0";
//   late UserLateCount lateCount1;
//
//   String leaveCount = "0";
//   late UserLeaveCount leaveCount1;
//
//   String absentCount = "0";
//   late UserAbsentCount absentCount1;
//
//   Future<String> getNotificaitonCount() async {
//     http.Response responseearly = await http.post(
//         Uri.parse('http://172.20.20.69/smallapi/earlycount.php'),
//         body: jsonEncode(<String, String>{"xstaff": widget.loginModel.xstaff}));
//
//     earlyCount1 = userEarlyCountFromJson(responseearly.body);
//     earlyCount = earlyCount1.total.toString();
//
//     print("Early" + responseearly.body);
//
//     http.Response responselate = await http.post(
//         Uri.parse('http://172.20.20.69/smallapi/latecount.php'),
//         body: jsonEncode(<String, String>{"xstaff": widget.loginModel.xstaff}));
//
//     lateCount1 = userLateCountFromJson(responselate.body);
//     lateCount = lateCount1.total.toString();
//
//     print("late" + responselate.body);
//
//     http.Response responseleave = await http.post(
//         Uri.parse('http://172.20.20.69/smallapi/leavecount.php'),
//         body: jsonEncode(
//             <String, String>{"xposition": widget.loginModel.xposition}));
//
//     leaveCount1 = userLeaveCountFromJson(responseleave.body);
//     leaveCount = leaveCount1.total.toString();
//
//     print("Leave" + responselate.body);
//
//     http.Response responseabsent = await http.post(
//         Uri.parse('http://172.20.20.69/smallapi/absentcount.php'),
//         body: jsonEncode(<String, String>{
//           "xposition": widget.loginModel.xposition,
//           "zid": "100060"
//         }));
//
//     absentCount1 = userAbsentCountFromJson(responseabsent.body);
//     absentCount = absentCount1.total.toString();
//
//     print("Absent" + responseabsent.body);
//
//     return '';
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
//     getNotificaitonCount();
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
//             "Business ID",
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
//         child: FutureBuilder<List<ZidModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Card(
//                 child: ListView.builder(
//                   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   //   childAspectRatio: 120 / 90,
//                   //   crossAxisCount: 2,
//                   // ),
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (_, index) => Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             gradient: new LinearGradient(colors: [
//                           // Color(0xff1EAE98),
//                           // Color(0xff92EFFD),
//                           Color.fromARGB(255, 255, 136, 34),
//                           Color.fromARGB(255, 255, 177, 41)
//                         ])),
//                         child: Card(
//                           margin: EdgeInsets.all(7),
//                           child: FlatButton(
//                             onPressed: () {
//                               if (widget.loginModel.xrole == "User") {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => NotificationList(
//                                               xposition:
//                                                   widget.loginModel.xposition,
//                                               xstaff: widget.loginModel.xstaff,
//                                               zid: (snapshot.data![index].zid)
//                                                   .toString(),
//                                               earlyCount: earlyCount,
//                                               lateCount: lateCount,
//                                               leaveCount: leaveCount,
//                                               absentCount: absentCount,
//                                             )));
//                               } else {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => AdminNotification(
//                                               xposition:
//                                                   widget.loginModel.xposition,
//                                               xstaff: widget.loginModel.xstaff,
//                                               zemail: widget.loginModel.zemail,
//                                               zid: (snapshot.data![index].zid)
//                                                   .toString(),
//                                             )));
//                               }
//                             },
//                             //splashColor: Colors.black,
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 10.0, bottom: 10.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   //mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     Image(
//                                       image:
//                                           AssetImage("images/logo/200010.png"),
//                                     ),
//                                     Text(
//                                       "${snapshot.data![index].zorg}",
//                                       textAlign: TextAlign.center,
//                                       style: GoogleFonts.bakbakOne(
//                                         fontSize: 14,
//                                         color: Color(0xff074974),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
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
