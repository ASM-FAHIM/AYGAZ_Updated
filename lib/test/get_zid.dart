// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hrandsells/data_model/notification_model/absent_notificaiton_model.dart';
// import 'package:hrandsells/test/zid.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// class get_zid extends StatefulWidget {
//   // const get_zid({Key? key}) : super(key: key);
//
//   get_zid({required this.zemail});
//   String zemail;
//
//   @override
//   _get_zidState createState() => _get_zidState();
// }
//
// class _get_zidState extends State<get_zid> {
//   Future<List<Zidr>>? futurePost;
//
//   Future<List<Zidr>> fetchPost() async {
//     var response =
//         await http.post(Uri.parse('http://192.168.29.255/api/raadzid.php'),
//             body: jsonEncode(<String, String>{
//               "zemail": widget.zemail,
//             }));
//
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<Zidr>((json) => Zidr.fromJson(json)).toList();
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
//
//         child: FutureBuilder<List<Zidr>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Card(
//                 child: ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (_, index) => Container(
//                     child: Card(
//                       margin: EdgeInsets.all(7),
//                       child: InkWell(
//                         onTap: () {},
//                         splashColor: Colors.black,
//                         child: Center(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Icon(Icons.home, size: 70,  color: Color(0xff074974),),
//                               Text(
//                                 "${snapshot.data![index].zid}",
//                                 style: GoogleFonts.bakbakOne(
//                                   fontSize: 18,
//                                   color: Color(0xff074974),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
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
