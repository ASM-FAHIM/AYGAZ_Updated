import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:aygazhcm/hr/viewNotification.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../data_model/notification_model/admin_approver_model/special/legal_adjustment_noti_model.dart';

class Lfa_Approval_NOtification extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  Lfa_Approval_NOtification(
      {required this.xposition,
      required this.xstaff,
      required this.zemail,
      required this.zid});
  String xposition;
  String xstaff;
  String zemail;
  String zid;

  @override
  _Lfa_Approval_NOtificationState createState() =>
      _Lfa_Approval_NOtificationState();
}

class _Lfa_Approval_NOtificationState extends State<Lfa_Approval_NOtification> {
  // fetchnotification _noteList = fetchnotification();
  //fetchnotification _noteList = fetchnotification();

  @override
  Future<List<LfaApprovalNotiModel>>? futurePost;

  String rejectNote = " ";

  Future<List<LfaApprovalNotiModel>> fetchPost() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/adminnotification/legaladjust.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
          "zid": widget.zid,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<LfaApprovalNotiModel>(
              (json) => LfaApprovalNotiModel.fromJson(json))
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
            "Legal Fund Adjustment Approval",
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
        child: FutureBuilder<List<LfaApprovalNotiModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon(Icons.notifications_active_outlined),
                      // SizedBox(
                      //   width: 100,
                      // ),

                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      child: Text(
                                          " ${snapshot.data![index].adjustnum}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.bakbakOne(
                                            fontSize: 18,
                                            //color: Color(0xff074974),
                                          )),
                                    ),
                                    Text(
                                      (DateFormat("dd-MM-yyyy").format(
                                              DateTime.parse((snapshot
                                                      .data![index].xdate.date)
                                                  .toString())))
                                          .toString(),
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //Text(" ${snapshot.data![index].status}")
                                  ],
                                ),
                                Text(
                                  "${snapshot.data![index].xadvnum}",
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 18,
                                    //color: Color(0xff074974),
                                  ),
                                )
                              ],
                            ),
                            children: <Widget>[
                              Text(
                                "Adjustment No " +
                                    "${snapshot.data![index].adjustnum}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              // Text("Purchase Date : "+(DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))).toString(),
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),
                              // Text("Day : "+(DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].toDate.date).toString()))).toString(),
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // ),
                              // Text("Supplier ID : "+"${snapshot.data![index].xcus}",
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),
                              Text(
                                "Fund Requisition No: " +
                                    "${snapshot.data![index].xadvnum}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Date : " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].xdate.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              // Text("PO Status : "+"${snapshot.data![index].xstatuspor}",
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),

                              // Text("Project: "+"${snapshot.data![index].xproject}",
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),
                              //
                              // Text("Project Name: "+"${snapshot.data![index].xproject}",
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),
                              //

                              Text(
                                "Adjustment Date: " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].xdateret.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Requisition Date: " +
                                    (DateFormat("dd-MM-yyyy").format(
                                            DateTime.parse((snapshot
                                                    .data![index].xdatereq.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              // Text("Requisition Number: "+"${snapshot.data![index].xporeqnum}",
                              //   style: GoogleFonts.bakbakOne(
                              //     fontSize: 18,
                              //     //color: Color(0xff074974),
                              //   ),
                              // ),

                              Text(
                                "Company Name: " +
                                    "${snapshot.data![index].name}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Fund Collection No: " +
                                    "${snapshot.data![index].xdesc}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Reference: " + "${snapshot.data![index].xref}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Total Requision Amount: " +
                                    "${snapshot.data![index].totalRequ}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Text(
                                "Total Adjustment Amount: " +
                                    "${snapshot.data![index].totalAdjust}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              //
                              Text(
                                "Approval Status: " +
                                    "${snapshot.data![index].xstatus}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    //color: Colors.green,
                                    onPressed: () async {
                                      var response = await http.post(
                                          Uri.parse(
                                              'http://172.20.20.69/adminapprove/legaladjustapprove.php'),
                                          body: jsonEncode(<String, String>{
                                            "zid": widget.zid,
                                            "user": widget.zemail,
                                            "xposition": widget.xposition,
                                            "xacreqnum": snapshot
                                                .data![index].adjustnum
                                                .toString(),
                                            "ypd": "0",
                                            "xstatus": snapshot
                                                .data![index].xstatus
                                                .toString(),
                                          }));

                                      Get.snackbar('Message', 'Approved',
                                          backgroundColor: Color(0XFF8CA6DB),
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM);

                                      setState(() {
                                        snapshot.data!.removeAt(index);
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Approved",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ));

                                      //print("Approve"+snapshot.data![index].xpornum.toString());
                                    },
                                    child: Text("Approve"),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    //color: Colors.red,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Reject Note"),
                                              content: Column(
                                                children: [
                                                  Container(
                                                    //height: MediaQuery.of(context).size.height/6,
                                                    child: TextFormField(
                                                      style:
                                                          GoogleFonts.bakbakOne(
                                                        //fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                      onChanged: (input) {
                                                        rejectNote = input;
                                                      },
                                                      validator: (input) {
                                                        if (input!.isEmpty) {
                                                          return "Please Write Reject Note";
                                                        }
                                                      },
                                                      scrollPadding:
                                                          EdgeInsets.all(20),
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    20), // add padding to adjust text
                                                        isDense: false,

                                                        hintStyle: GoogleFonts
                                                            .bakbakOne(
                                                          //fontWeight: FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                        ),
                                                        labelText:
                                                            "Reject Note",
                                                        labelStyle: GoogleFonts
                                                            .bakbakOne(
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
                                                  // color: Color(0xff064A76),
                                                  onPressed: () async {
                                                    //http://172.20.20.69/adminapprove/poreject.php

                                                    var response = await http.post(
                                                        Uri.parse(
                                                            'http://172.20.20.69/adminapprove/legaladjustreject.php'),
                                                        body: jsonEncode(<
                                                            String, String>{
                                                          "zid": widget.zid,
                                                          "user": widget.zemail,
                                                          "xposition":
                                                              widget.xposition,
                                                          "xacreqnum": snapshot
                                                              .data![index]
                                                              .adjustnum
                                                              .toString(),
                                                          "wh": "0",
                                                          "xnote": rejectNote
                                                        }));
                                                    print(response.body);

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        "Reject",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ));

                                                    //print("Reject"+snapshot.data![index].xpornum.toString());
                                                    Navigator.pop(context);

                                                    Get.snackbar(
                                                        'Message', 'Reject',
                                                        backgroundColor:
                                                            Color(0XFF8CA6DB),
                                                        colorText: Colors.white,
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM);

                                                    setState(() {
                                                      snapshot.data!
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Text(
                                                    "Reject",
                                                    style:
                                                        GoogleFonts.bakbakOne(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              scrollable: true,
                                            );
                                          });
                                    },
                                    child: Text("Reject"),
                                  ),
                                ],
                              )
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
