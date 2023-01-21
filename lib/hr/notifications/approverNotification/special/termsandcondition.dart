import 'dart:convert';

import 'package:aygazhcm/conts_api_link.dart';
import 'package:aygazhcm/data_model/notification_model/admin_approver_model/special/terms_condition_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Terms_and_Condition extends StatefulWidget {
  Terms_and_Condition(
      {required this.xpornum,
      required this.zid,
      required this.xposition,
      required this.xstatus,
      required this.zemail,
      required this.xstaff});
  String xpornum;
  String zid;
  String xposition;
  String xstatus;
  String xstaff;
  String zemail;

  @override
  State<Terms_and_Condition> createState() => _Terms_and_ConditionState();
}

class _Terms_and_ConditionState extends State<Terms_and_Condition> {
  Future<List<TermsModel>>? futurePost;
  String rejectNote = " ";

  Future<List<TermsModel>> fetchPostdetails() async {
    var response = await http.post(
        Uri.parse(ConstApiLink().poTermsApi),
        body: jsonEncode(<String, String>{"xpornum": widget.xpornum}));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TermsModel>((json) => TermsModel.fromJson(json))
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
            "PO Terms and Conditions",
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
        child: FutureBuilder<List<TermsModel>>(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].xrow}.",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data![index].xnote ?? "  "}",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.sp,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.green,
                          ),
                          // color: Colors.green,
                          onPressed: () async {
                            var response = await http.post(
                                Uri.parse(
                                    ConstApiLink().poApproveApi),
                                body: jsonEncode(<String, String>{
                                  "zid": widget.zid,
                                  "user": widget.zemail,
                                  "xposition": widget.xposition,
                                  "xpornum": widget.xpornum.toString(),
                                  "ypd": "0",
                                  "xstatus": "Approved"
                                }));

                            Get.snackbar('Message', 'Approved',
                                backgroundColor: Color(0XFF8CA6DB),
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM);

                            Navigator.pop(context, "approval");

                            print(response.statusCode);
                            print(response.body);
                          },
                          child: Text("Approve"),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: TextButton(
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
                                        var response = await http.post(
                                          Uri.parse(
                                              ConstApiLink().poRejectApi),
                                          body: jsonEncode(
                                            <String, String>{
                                              "zid": widget.zid,
                                              "user": widget.zemail,
                                              "xposition": widget.xposition,
                                              "wh": "0",
                                              "xpornum":
                                                  widget.xpornum.toString(),
                                              "xnote1": rejectNote
                                            },
                                          ),
                                        );
                                        print(response.statusCode);
                                        print(response.body);

                                        Get.snackbar(
                                          'Message',
                                          'Rejected',
                                          backgroundColor: Color(0XFF8CA6DB),
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );

                                        Navigator.pop(context);
                                        Navigator.pop(context, "approval");
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
                              },
                            );
                          },
                          child: Text("Reject"),
                        ),
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
