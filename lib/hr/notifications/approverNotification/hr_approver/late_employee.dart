import 'dart:convert';

import 'package:aygazhcm/conts_api_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../data_model/notification_model/admin_approver_model/late_emp_admin_model.dart';

class Admin_Late_Leave_NotificationList extends StatefulWidget {
  Admin_Late_Leave_NotificationList(
      {required this.xposition, required this.xstaff, required this.zemail});
  String xposition;
  String xstaff;
  String zemail;

  @override
  _Admin_Late_Leave_NotificationListState createState() =>
      _Admin_Late_Leave_NotificationListState();
}

class _Admin_Late_Leave_NotificationListState
    extends State<Admin_Late_Leave_NotificationList> {
  @override
  Future<List<LateNotiModel>>? futurePost;
  String rejectNote = " ";
  Future<List<LateNotiModel>> fetchPost() async {
    var response = await http.post(Uri.parse(ConstApiLink().lateEpmApi),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<LateNotiModel>((json) => LateNotiModel.fromJson(json))
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
            "Late Employee Notification",
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
        child: FutureBuilder<List<LateNotiModel>>(
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
                                    // Text((DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].intime.date).toString()))).toString(),
                                    //   style: GoogleFonts.bakbakOne(
                                    //     fontSize: 18,
                                    //     //color: Color(0xff074974),
                                    //   ),
                                    // ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      child:
                                          Text(" ${snapshot.data![index].name}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 18,
                                                //color: Color(0xff074974),
                                              )),
                                    ),
                                    Text(
                                      "Date : " +
                                          (DateFormat("dd-MM-yyyy").format(
                                                  DateTime.parse((snapshot
                                                          .data![index]
                                                          .intime
                                                          .date)
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
                                  " Late",
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 18,
                                    //color: Color(0xff074974),
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
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "In Time : " +
                                    (DateFormat("hh:mm:ss a").format(
                                            DateTime.parse((snapshot
                                                    .data![index].intime.date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Working Hour : " +
                                    (DateFormat("HH:mm:ss").format(
                                            DateTime.parse((snapshot
                                                    .data![index]
                                                    .xworktime
                                                    .date)
                                                .toString())))
                                        .toString(),
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Note: " +
                                    "${snapshot.data![index].xnote ?? " "}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Text(
                                "Status : " +
                                    "${snapshot.data![index].xstatuslate.toString()}",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 18,
                                  //color: Color(0xff074974),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(style: TextButton.styleFrom(
                                    primary: Colors.green,
                                  ),

                                    //color: Colors.green,
                                    onPressed: () async {
                                      var response = await http.post(
                                          Uri.parse(
                                              ConstApiLink().lateEmpApproveApi),
                                          body: jsonEncode(<String, String>{
                                            "zid": "200010",
                                            "user": widget.zemail,
                                            "xposition": widget.xposition,
                                            "xstaff":
                                                snapshot.data![index].xstaff,
                                            "xyearperdate":
                                                "${snapshot.data![index].xyearperdate}",
                                            "xnote": "xnote",
                                          }));

                                      print(response.body);

                                      Get.snackbar('Message', 'Approved',
                                          backgroundColor: Color(0XFF8CA6DB),
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM);

                                      setState(() {
                                        snapshot.data!.removeAt(index);
                                      });

                                      print("Approve" +
                                          snapshot.data![index].name
                                              .toString());
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
                                    onPressed: () async {
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
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  20), // add padding to adjust text
                                                      isDense: false,

                                                      hintStyle:
                                                          GoogleFonts.bakbakOne(
                                                        //fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                      labelText: "Reject Note",
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
                                               // color: Color(0xff064A76),
                                                onPressed: () async {
                                                  //http://172.20.20.69/adminapprove/poreject.php

                                                  var response = await http.post(
                                                      Uri.parse(ConstApiLink()
                                                          .lateEmpRejectApi),
                                                      body: jsonEncode(<String,
                                                          String>{
                                                        "zid": "200010",
                                                        "user": widget.zemail,
                                                        "xposition":
                                                            widget.xposition,
                                                        "xstaff": snapshot
                                                            .data![index]
                                                            .xstaff,
                                                        "xyearperdate": snapshot
                                                            .data![index]
                                                            .xyearperdate
                                                            .toString(),
                                                        "xnote": rejectNote
                                                      }));

                                                  print(response.body);

                                                  Navigator.pop(context);
                                                  Get.snackbar(
                                                      'Message', 'Rejected',
                                                      backgroundColor:
                                                          Color(0XFF8CA6DB),
                                                      colorText: Colors.white,
                                                      snackPosition:
                                                          SnackPosition.BOTTOM);
                                                  setState(() {
                                                    snapshot.data!
                                                        .removeAt(index);
                                                  });
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: GoogleFonts.bakbakOne(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                            scrollable: true,
                                          );
                                        },
                                      );
                                      print("Reject" +
                                          snapshot.data![index].name
                                              .toString());
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
