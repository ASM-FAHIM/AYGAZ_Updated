import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'model/attendence_report_model.dart';

class Attendance_report extends StatefulWidget {
  Attendance_report(
      {required this.fromDate,
      required this.toDate,
      required this.xstaff,
      required this.xposition,
      required this.xsid});

  String fromDate;
  String toDate;
  String xstaff;
  String xposition;
  dynamic xsid;

  @override
  _Attendance_reportState createState() => _Attendance_reportState();
}

class _Attendance_reportState extends State<Attendance_report> {
  Future<List<AttendenceReportModel>>? futurePost;

  changeColor(String statusdemo) {
    switch (statusdemo) {
      case "Late":
        return Colors.blue;

      case "Early Leave":
        return Colors.blue;

      case "Absent":
        return Colors.red;

      case "Present":
        return Colors.green;

      case "Late & Early Leave":
        return Colors.blue;

      default:
        return Colors.black;
    }
  }

  Future<List<AttendenceReportModel>> fetchPost() async {
    print("execute");
    var response = await http.post(
      Uri.parse('http://103.150.48.235:2165/API/aygaz/HR/attendance/attendance_rpt.php'),
      body: jsonEncode(
        <String, String>{
          "zid": "200010",
          "user": "",
          "fdate": widget.fromDate,
          "tdate": widget.toDate,
          "empcat": "",
          "xstaff": widget.xstaff,
          "adminid": "",
        },
      ),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<AttendenceReportModel>(
              (json) => AttendenceReportModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePost = fetchPost();
    print(fetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xff064A76),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(10),
              color: Color(0xff074974),
              child: Center(
                child: Text(
                  "Attendance Report",
                  style: GoogleFonts.bakbakOne(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: InteractiveViewer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Color(0xff074974),
                  child: Row(
                    children: [
                      // SizedBox(width: 50,),
                      Expanded(
                        child: Text(
                          "Date",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "In Time",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Out Time",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Status",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "App. Status",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: FutureBuilder<List<AttendenceReportModel>>(
                      future: futurePost,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(color: Colors.grey),

                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff064A76).withOpacity(0.5),
                                        spreadRadius: .5,
                                        blurRadius: 0.5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          DateFormat("dd-MM-yy").format(
                                            DateTime.parse(
                                                "${snapshot.data![index].xdate.date}"),
                                          ),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.bakbakOne(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      if (snapshot.data![index].xintime ==
                                          null) ...[
                                        Expanded(
                                          child: Text(
                                            '-',
                                            //snapshot.data![index].xintime.date,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ] else ...[
                                        Expanded(
                                          child: Text(
                                            DateFormat("HH:mm:ss").format(
                                              DateTime.parse(
                                                  "${snapshot.data![index].xintime?.date}"),
                                            ),

                                            //snapshot.data![index].xintime.date,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                      //if xoutime == null
                                      if (snapshot.data![index].xouttime ==
                                          null) ...[
                                        Expanded(
                                          child: Text(
                                            '-',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ] else ...[
                                        Expanded(
                                          child: Text(
                                            DateFormat("HH:mm:ss").format(
                                              DateTime.parse(
                                                  "${snapshot.data![index].xouttime?.date}"),
                                            ),

                                            //snapshot.data![index].xintime.date,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                      Expanded(
                                        child: Text(
                                          snapshot.data![index].xstatus,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.bakbakOne(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      // Expanded(
                                      //   child: Text(
                                      //     (DateFormat("HH:mm:ss").format(
                                      //             DateTime.parse((snapshot
                                      //                     .data![index]
                                      //                     .xworktime
                                      //                     ?.date)
                                      //                 .toString())))
                                      //         .toString(),
                                      //     style: GoogleFonts.bakbakOne(
                                      //       fontSize: 18,
                                      //       //color: Color(0xff074974),
                                      //     ),
                                      //   ),
                                      //   // Text(
                                      //   //   snapshot.data![index].xintime,
                                      //   //   textAlign: TextAlign.center,
                                      //   //   style: GoogleFonts.bakbakOne(
                                      //   //     fontSize: 14,
                                      //   //     color: Colors.black,
                                      //   //   ),
                                      //   // ),
                                      // ),
                                      // Expanded(
                                      //   child: Text(
                                      //     snapshot.data![index].xworktime.date,
                                      //     textAlign: TextAlign.center,
                                      //     style: GoogleFonts.bakbakOne(
                                      //       fontSize: 14,
                                      //       color: Colors.black,
                                      //     ),
                                      //   ),
                                      // ),

                                      if (snapshot.data![index].xstatus ==
                                          "Late") ...[
                                        if (snapshot.data![index].xstatuslate ==
                                            "Approved") ...[
                                          Expanded(
                                            child: Text(
                                              "AP",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ] else if (snapshot
                                                .data![index].xstatuslate ==
                                            "Rejected") ...[
                                          Expanded(
                                            child: Text(
                                              "RJ",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Expanded(
                                            child: Text(
                                              " ",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ] else if (snapshot
                                              .data![index].xstatus ==
                                          "Early Leave") ...[
                                        if (snapshot.data![index].xstatusel ==
                                            "Approved") ...[
                                          Expanded(
                                            child: Text(
                                              "AP",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ] else if (snapshot
                                                .data![index].xstatusel ==
                                            "Rejected") ...[
                                          Expanded(
                                            child: Text(
                                              "RJ",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Expanded(
                                            child: Text(
                                              " ",
                                              //Text("${snapshot.data![index].xouttime.date}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ] else if (snapshot
                                              .data![index].xstatus ==
                                          "Late & Early Leave") ...[
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            child: Column(
                                              children: [
                                                if (snapshot.data![index]
                                                        .xstatusel ==
                                                    "Approved") ...[
                                                  Expanded(
                                                    child: Text(
                                                      "AP",
                                                      //Text("${snapshot.data![index].xouttime.date}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.bakbakOne(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ] else if (snapshot.data![index]
                                                        .xstatusel ==
                                                    "Rejected") ...[
                                                  Expanded(
                                                    child: Text(
                                                      "RJ",
                                                      //Text("${snapshot.data![index].xouttime.date}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.bakbakOne(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ] else ...[
                                                  Expanded(
                                                    child: Text(
                                                      " ",
                                                      //Text("${snapshot.data![index].xouttime.date}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.bakbakOne(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${snapshot.data![index].xstatuslate ?? " "}",
                                                  //Text("${snapshot.data![index].xouttime.date}",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.bakbakOne(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ] else ...[
                                        Expanded(
                                          child: Text(
                                            " ",
                                            //Text("${snapshot.data![index].xouttime.date}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.bakbakOne(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child:
                                Image(image: AssetImage("images/loading.gif")),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// body: InteractiveViewer(
// child: SingleChildScrollView(
// child: Column(
// children: [
// SizedBox(
// height: 20,
// ),
// Container(
// color: Color(0xff074974),
// child: Row(
// children: [
// // SizedBox(width: 50,),
// Expanded(
// child: Text(
// "Date",
// style: GoogleFonts.bakbakOne(
// fontSize: 18,
// color: Colors.white,
// ),
// ),
// ),
// SizedBox(
// width: 10,
// ),
// Expanded(
// child: Text(
// "In Time",
// style: GoogleFonts.bakbakOne(
// fontSize: 18,
// color: Colors.white,
// ),
// ),
// ),
// Expanded(
// child: Text(
// "Out Time",
// style: GoogleFonts.bakbakOne(
// fontSize: 18,
// color: Colors.white,
// ),
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Text(
// "Hour",
// style: GoogleFonts.bakbakOne(
// fontSize: 18,
// color: Colors.white,
// ),
// ),
// ),
// Expanded(
// child: Text(
// "Status",
// style: GoogleFonts.bakbakOne(
// fontSize: 18,
// color: Colors.white,
// ),
// ),
// )
// ],
// ),
// ),
// SingleChildScrollView(
// child: Container(
// height: MediaQuery.of(context).size.height / 1.3,
// child: FutureBuilder<List<AttendenceReportModel>>(
// future: futurePost,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// shrinkWrap: true,
// itemCount: snapshot.data!.length,
// itemBuilder: (_, index) => Container(
// child: Column(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// //border: Border.all(color: Colors.grey),
//
// boxShadow: [
// BoxShadow(
// color: Color(0xff064A76)
//     .withOpacity(0.5),
// spreadRadius: .5,
// blurRadius: 0.5,
// offset: Offset(0,
// 3), // changes position of shadow
// ),
// ],
// ),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.start,
// children: [
// Expanded(
// child: Text(
// snapshot.data![index].xdate,
// //Text('${snapshot.data![index].xdate.date}',
// textAlign: TextAlign.center,
// style: GoogleFonts.bakbakOne(
// fontSize: 15,
// color: Colors.black,
// ),
// ),
// ),
// Expanded(
// //child: Text("${snapshot.data![index].xintime}",
// child: Text(
// snapshot.data![index].xintime,
// //Text("${snapshot.data![index].xintime.date}",
// textAlign: TextAlign.center,
// style: GoogleFonts.bakbakOne(
// fontSize: 15,
// color: Colors.black,
// ),
// ),
// ),
// Expanded(
// child: Text(
// snapshot.data![index].xouttime,
// //Text("${snapshot.data![index].xouttime.date}",
// textAlign: TextAlign.center,
// style: GoogleFonts.bakbakOne(
// fontSize: 14,
// color: Colors.black,
// ),
// ),
// ),
// Expanded(
// child: Text(
// snapshot.data![index].xworktime,
// //Text("${snapshot.data![index].xouttime.date}",
// textAlign: TextAlign.center,
// style: GoogleFonts.bakbakOne(
// fontSize: 14,
// color: Colors.black,
// ),
// ),
// ),
// Expanded(
// child: Text(
// "${snapshot.data![index].xstatus}",
// //Text("${snapshot.data![index].xouttime.date}",
// textAlign: TextAlign.center,
// style: GoogleFonts.bakbakOne(
// fontSize: 14,
// color: changeColor((snapshot
//     .data![index].xstatus)
//     .toString()),
// ),
// ),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// ),
// );
// } else {
// return Center(
// child: Image(
// image: AssetImage("images/loading.gif"),
// ),
// );
// }
// },
// ),
// ),
// ),
// ],
// ),
// ),
// ),
