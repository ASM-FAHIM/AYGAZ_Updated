import 'dart:convert';

import 'package:aygazhcm/conts_api_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../../data_model/notification_model/admin_approver_model/details/bat_details_model.dart';
import '../../../../data_model/notification_model/admin_approver_model/details/spot_purchase_advance_detail.dart';

class Spot_purchase_advance_details_notification extends StatefulWidget {
  Spot_purchase_advance_details_notification(
      {
        required this.xporeqnum,
        required this.zid,
        required this.zemail,
        required this.xposition,
        required this.xstatusreq,

      });
  String xporeqnum;
  String zid;
  String zemail;
  String xposition;
  String xstatusreq;


  @override
  State<Spot_purchase_advance_details_notification> createState() =>
      _Spot_purchase_advance_details_notificationState();
}

class _Spot_purchase_advance_details_notificationState extends State<Spot_purchase_advance_details_notification> {
  
  Future<List<SpotPurchaseDetail>>? futurePost;
  String rejectNote = " ";

  Future<List<SpotPurchaseDetail>> fetchPostdetails() async {
    var response = await http.post(
        Uri.parse( ConstApiLink().pendingSpotPurchaseAdvanceDetails ),
        body: jsonEncode(<String, String>{"xporeqnum": widget.xporeqnum}));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<SpotPurchaseDetail>((json) => SpotPurchaseDetail.fromJson(json))
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
            "Spot Purchase Advance Details",
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
        child: FutureBuilder<List<SpotPurchaseDetail>>(
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
                                      "Line No: " +
                                          "${snapshot.data![index].xrow}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Item: " +
                                          "${snapshot.data![index].xitem}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Description: " +
                                          "${snapshot.data![index].description}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Brand: " + snapshot.data![index].xbrand,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //
                                    Text(
                                      "Required Qty: " +
                                          snapshot.data![index].xqtyreq,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Approve Qty: " +
                                          snapshot.data![index].xqtyapv,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "UOM: " +
                                          snapshot.data![index].xunitpur,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Estimated Rate: " + snapshot.data![index].xrate+" BDT",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Estimated Amount: " + snapshot.data![index].xlineamt+" BDT",
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
                              Uri.parse(
                                  '${ConstApiLink().pendingSpotPurchaseAdvanceApproveApi}'),
                              body: jsonEncode(<String, String>{
                                "zid": widget.zid,
                                "user": widget.zemail,
                                "xposition": widget.xposition,
                                "xporeqnum": widget.xporeqnum
                                    .toString(),
                                "ypd": "0",
                                "xstatusreq": widget.xstatusreq
                                    .toString(),
                                "aprcs": "SPR Approval"
                              }));

                          Get.snackbar('Message', 'Approved',
                              backgroundColor: Color(0XFF8CA6DB),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);

                          // setState(() {
                          //   snapshot.data!.removeAt(index);
                          // });

                          print(response.statusCode);
                          print(response.body);
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
                                      //color: Color(0xff064A76),
                                      onPressed: () async {
                                        //http://172.20.20.69/adminapprove/poreject.php

                                        var response = await http.post(
                                            Uri.parse(
                                                '${ConstApiLink().pendingSpotPurchaseAdvanceRejectApi}'),
                                            body: jsonEncode(<
                                                String, String>{
                                              "zid": widget.zid,
                                              "user": widget.zemail,
                                              "xposition":
                                                  widget.xposition,
                                              "wh": "0",
                                              "xporeqnum": widget.xporeqnum,
                                              "xnote1": rejectNote
                                            }));
                                        print(response.statusCode);
                                        print(response.body);
                                        Navigator.pop(context);

                                        Get.snackbar(
                                            'Message', 'Rejected',
                                            backgroundColor:
                                                Color(0XFF8CA6DB),
                                            colorText: Colors.white,
                                            snackPosition:
                                                SnackPosition
                                                    .BOTTOM);

                                        // setState(() {
                                        //   snapshot.data!
                                        //       .removeAt(index);
                                        // });
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
