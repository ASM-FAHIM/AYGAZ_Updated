import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../data_model/leave_tour_model.dart';
import 'dart:convert';

import '../data_model/smallapi/availavleLeaveModel.dart';
import 'leave_tour_apply.dart';

class Leave_page extends StatefulWidget {
  @override
  _Leave_pageState createState() => _Leave_pageState();

  Leave_page(
      {required this.xposition,
      required this.xstaff,
      required this.xsid,
      required this.xbalance,
      required this.xname,
      required this.supname});
  String xposition;
  String xstaff;
  dynamic xsid;
  String xbalance;
  String xname;
  dynamic supname;
  //LoginModel xsid;
}

class _Leave_pageState extends State<Leave_page> {
  Future<List<LeaveandTourModel>>? futurePost;
  //after apply then see the history
  Future<List<LeaveandTourModel>> fetchPost() async {
    var response = await http.post(
      Uri.parse(
          'http://103.150.48.235:2165/API/aygaz/HR/employeenotification/leaveandtour.php'),
      body: jsonEncode(
        <String, String>{
          "xposition": widget.xposition,
        },
      ),
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<LeaveandTourModel>((json) => LeaveandTourModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<AvailebleLeaveModel>>? availableleave;
  Future<List<AvailebleLeaveModel>> fetchavailableleave() async {
    var response = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leavetype.php'),
        body: jsonEncode(<String, String>{"xstaff": widget.xstaff}));

    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<AvailebleLeaveModel>(
              (json) => AvailebleLeaveModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  String statusdemo = "";

  changeColor(String statusdemo) {
    switch (statusdemo) {
      case "Applied":
        return Color(0XFF7FE5EA);

      case "Confirmed":
        return Colors.green;

      case "Rejected":
        return Colors.red;

      case "Recommended":
        return Color(0XFF5E9CF9);

      default:
        return Colors.purple;
    }
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
    availableleave = fetchavailableleave();
    fetchPost().whenComplete(() => futurePost);
    fetchavailableleave().whenComplete(() => availableleave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff064A76),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true,
        title: Center(
            child: Text(
          "Leave and Tour",
          textAlign: TextAlign.center,
          style: GoogleFonts.bakbakOne(
            fontSize: 20,
            color: Color(0xff064A76),
          ),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 16, top: 12, bottom: 12),
            child: GestureDetector(
              onTap: () {
                print("Pressed");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaveApply_page(
                              xstaff: widget.xstaff,
                              xposition: widget.xposition,
                              xsid: widget.xsid,
                              //leave_avail: widget.xbalance,
                              xname: widget.xname,
                              //appleave: appleave,
                            )));
                //submitData();
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff064A76)),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Color(0xff064A76),
                  )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: ExpansionTile(
                      title: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Available leave",
                            style: GoogleFonts.bakbakOne(
                              fontSize: 18,
                              //color: Color(0xff074974),
                            ),
                          ),
                          //Text(" ${snapshot.data![index].status}")
                        ],
                      ),
                      children: [
                        FutureBuilder<List<AvailebleLeaveModel>>(
                          future: availableleave,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${snapshot.data![index].xtypeleave} ",
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              //color: Color(0xff074974),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data![index].xbalance,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              //color: Color(0xff074974),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: Image(
                                    image: AssetImage("images/loading.gif")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<LeaveandTourModel>>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 20, left: 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.5,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff064A76).withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: changeColor(
                                                (snapshot.data![index].xstatus)
                                                    .toString()),
                                            //border: Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "${snapshot.data![index].xstatus}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 20),
                                            child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${snapshot.data![index].xtypeleave}",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.bakbakOne(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Approver",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.bakbakOne(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  widget.supname,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.bakbakOne(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                DateFormat("yyyy-MM-dd").format(
                                                        (snapshot.data![index]
                                                            .xdatefrom.date)) +
                                                    " - ",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.bakbakOne(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),

                                              //Text("${snapshot.data![index].xdateto.date}",
                                              Text(
                                                DateFormat("yyyy-MM-dd").format(
                                                    (snapshot.data![index]
                                                        .xdateto.date)),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.bakbakOne(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
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
          ],
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));

    setState(() {
      futurePost;
    });

    return null;
  }
}
