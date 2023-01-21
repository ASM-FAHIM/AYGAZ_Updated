// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hrandsells/data_model/payslip/payment.dart';
//
// class Payslipreport extends StatefulWidget {
//   //const Payslipreport({Key? key}) : super(key: key);
//
//   Payslipreport({required this.paymentApiModel});
//   PaymentApiModel paymentApiModel;
//
//   @override
//   State<Payslipreport> createState() => _PayslipreportState();
// }
//
// class _PayslipreportState extends State<Payslipreport> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF8CA6DB),
//           title: Center(
//               child: Text("Attendance Report",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.openSans(
//                   fontSize: 20,
//                 ),
//               )
//           ),
//         ),
//
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white30,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     //blurRadius: 5,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Bank details",
//                     //textAlign: TextAlign.center,
//                     style: GoogleFonts.openSans(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Bank Name: ${widget.xempbank.toString()}",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             "AC Number: ${widget.xacc.toString()}",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Payment",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.openSans(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: Container(
//                   //     padding: const EdgeInsets.all(10),
//                   //     width: MediaQuery.of(context).size.width,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.white,
//                   //       borderRadius: BorderRadius.circular(20),
//                   //     ),
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //         Text(
//                   //           "Basic: ",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //         Text(
//                   //           "Conveyance: ",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //         Text(
//                   //           "House Rent:",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //         Text(
//                   //           "LFA:",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //         Text(
//                   //           "Medical Allowance:",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //         Text(
//                   //           "Arrear:",
//                   //           style: TextStyle(
//                   //             fontSize: 20,
//                   //           ),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//
//                   SizedBox(height: 10,),
//
//                   FutureBuilder<List<PaymentApiModel>>(
//                     future: futurePost,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Container(
//                           padding: const EdgeInsets.all(10),
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (_, index) => Container(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${snapshot.data![index].xtype} : ${snapshot.data![index].xamount}",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5,)
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                         );
//                       } else {
//                         return Center(
//                           child: Text("Loading.."),
//                         );
//                       }
//                     },
//                   ),
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Deduction",
//                     style: GoogleFonts.openSans(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: Container(
//                   //     padding: const EdgeInsets.all(10),
//                   //     width: MediaQuery.of(context).size.width,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.white,
//                   //       borderRadius: BorderRadius.circular(20),
//                   //     ),
//                   //     child: Text(
//                   //       "Total deduct: ",
//                   //       style: TextStyle(
//                   //         fontSize: 20,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//
//                   FutureBuilder<List<DeductApiModel>>(
//                     future: futurePostdeduct,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Container(
//                           padding: const EdgeInsets.all(10),
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (_, index) => Container(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${snapshot.data![index].xtype} : ${snapshot.data![index].xamount}",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5,)
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                         );
//                       } else {
//                         return Center(
//                           child: Text("Loading.."),
//                         );
//                       }
//                     },
//                   ),
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Total",
//                     style: GoogleFonts.openSans(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Amount: ",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             "In Word: ",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),,
//         ),
//       ),
//     );
//   }
// }
