import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../../conts_api_link.dart';
import '../../../../data_model/notification_model/admin_approver_model/details/sqc_details_model.dart';

class SQC_details_notification extends StatefulWidget {
  SQC_details_notification(
      {required this.xgrnnum,
      required this.zid,
      required this.xposition,
      required this.xstatusdoc,
      required this.zemail,
      required this.xstaff});
  String xgrnnum;
  String zid;
  String xposition;
  String xstatusdoc;
  String xstaff;
  String zemail;

  @override
  State<SQC_details_notification> createState() =>
      _SQC_details_notificationState();
}

class _SQC_details_notificationState extends State<SQC_details_notification> {
  Future<List<SqcDetailsModel>>? futurePost;
  String rejectNote = " ";

  Future<List<SqcDetailsModel>> fetchPostdetails() async {
    var response = await http.post(Uri.parse(ConstApiLink().sqcDetailsApi),
        body: jsonEncode(<String, String>{"xgrnnum": widget.xgrnnum}));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<SqcDetailsModel>((json) => SqcDetailsModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchPostdetails();
    fetchPostdetails().whenComplete(() => futurePost);
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
            "SQC Details",
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
        child: FutureBuilder<List<SqcDetailsModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Card(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.0, left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Service Name: " +
                                          "${snapshot.data![index].itemname}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Quantity: " +
                                          "${snapshot.data![index].xqtygrn}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Rate: " + snapshot.data![index].rate,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Amount: " +
                                          "${snapshot.data![index].amount}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "VAT Rate: " +
                                          snapshot.data![index].vatrate,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Total Amount: " +
                                          snapshot.data![index].total,
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
                        ),
                      ),
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
                              Uri.parse(ConstApiLink().sqcApproveApi),
                              body: jsonEncode(<String, String>{
                                "zid": widget.zid,
                                "user": widget.zemail,
                                "xposition": widget.xposition,
                                "xgrnnum": widget.xgrnnum.toString(),
                                "ypd": "0",
                                "xstatusdoc": widget.xstatusdoc.toString()
                              }));

                          print(response.statusCode);
                          print(response.body);

                          Get.snackbar('Message', 'Approved',
                              backgroundColor: Color(0XFF8CA6DB),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);

                          Navigator.pop(context, "approval");
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
                        // color: Colors.red,
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
                                          style: GoogleFonts.bakbakOne(
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
                                          scrollPadding: EdgeInsets.all(20),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left:
                                                    20), // add padding to adjust text
                                            isDense: false,

                                            hintStyle: GoogleFonts.bakbakOne(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                            labelText: "Reject Note",
                                            labelStyle: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(),
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
                                      //color: Color(0xff064A76),
                                      onPressed: () async {
                                        //http://172.20.20.69/adminapprove/poreject.php

                                        var response = await http.post(
                                            Uri.parse(
                                                ConstApiLink().sqcRejectApi),
                                            body: jsonEncode(<String, String>{
                                              "zid": widget.zid,
                                              "user": widget.zemail,
                                              "xposition": widget.xposition,
                                              "wh": "0",
                                              "xgrnnum": widget.xgrnnum,
                                              "xnote1": rejectNote
                                            }));
                                        print(response.statusCode);
                                        print(response.body);

                                        Get.snackbar('Message', 'Rejected',
                                            backgroundColor: Color(0XFF8CA6DB),
                                            colorText: Colors.white,
                                            snackPosition:
                                                SnackPosition.BOTTOM);

                                        Navigator.pop(context);
                                        Navigator.pop(context, "approval");
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
                              });
                        },
                        child: Text("Reject"),
                      ),
                    ],
                  )
                ],
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
