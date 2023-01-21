import 'dart:convert';

import 'package:aygazhcm/data_model/leave_tour_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Looptry extends StatefulWidget {
  //const LeaveApply_page({Key? key}) : super(key: key);

  Looptry({required this.xstaff, required this.xposition, required this.xsid});

  String xstaff;
  String xposition;

  String xsid;

  @override
  _LooptryState createState() => _LooptryState();
}

class _LooptryState extends State<Looptry> {
  // DateTime now = DateTime.now();
  DateTime now = DateTime.now();
  String dropdownValue = 'Pick';
  String _value = '';
  String _value1 = '';
  String taskAssign = '';
  String contact = '';
  String reason = '';
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String status = 'Waiting for Approval';

  int item = 21642164;
  int i = 1;

  void _showDatePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        //initialDate: new DateTime.now(),
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2023));
    if (picked != null && picked != date) {
      setState(() {
        date = picked.toString();
        //String Onlydate = new DateFormat("yyyy-MM-dd").format(picked);
        _value = DateFormat("yyyy-MM-dd").format(picked);

        //_value = '$Onlydate';
      });
    }
  }

  void _showDatePicker1() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2021),
      lastDate: new DateTime(2023),
    );
    // if(picked != null) setState(() => _value1 = picked.toString());

    if (picked != null && picked != date) {
      setState(() {
        date = picked.toString();
        _value1 = DateFormat("yyyy-MM-dd").format(picked);
      });
    }
  }

  late LeaveandTourModel _dataModel;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF8CA6DB),
            title: Center(
                child: Text(
              "Leave and Tour Apply",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 20,
              ),
            )),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohammad Shariful Alam Shabuj",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "1296",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '$now',
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Pick',
                              'Annual Leave',
                              'Leave without pay ',
                              'Replacement Leave',
                              'special leave',
                              'Tour',
                              'Work from home'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'Leave Type',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                            child: Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Color(0xfffafafa),
                              ),
                              //color: Color(0xff064A76),
                              //color: Color(0xfffafafa),
                              onPressed: () {
                                _showDatePicker();
                              },
                              child: Icon(Icons.calendar_today_sharp),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$_value",
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'Form Date',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                            child: Row(
                          children: [
                            TextButton(style: TextButton.styleFrom(
                              primary: Color(0xfffafafa),
                            ),
                              //color: Color(0xff064A76),
                             // color: Color(0xfffafafa),
                              onPressed: () {
                                _showDatePicker1();
                              },
                              child: Icon(Icons.calendar_today_sharp),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$_value1",
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'To Date',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: TextField(
                          onChanged: (input) {
                            contact = input;
                          },
                          decoration: InputDecoration(
                            hintText: " ",
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'Contact no during leave',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: TextField(
                          onChanged: (input) {
                            taskAssign = input;
                          },
                          decoration: InputDecoration(
                            hintText: " ",
                            border: InputBorder.none,
                          ),
                        )),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'Task Assign to',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                          child: TextField(
                            onChanged: (input) {
                              reason = input;
                            },
                            decoration: InputDecoration(
                              hintText: " ",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Color(0xfffafafa),
                          child: Text(
                            'Reason for Application',
                            style: GoogleFonts.openSans(
                                fontSize: 15, color: Color(0xff8CA6DB)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: Color(0xff8CA6DB),
                        //border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          //primary: Color(0xff064A76),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        ),
                        //color: Color(0xff064A76),


                        //submitData(dvalue, value, value1, contact, taskAssign, reason)
                        // print(dropdownValue);
                        // print(_value);
                        // print(_value1);
                        //print(contact);

                        // print(taskAssign);

                        //addUsers();

                        onPressed: () async {
                          DateTime dt1 = DateTime.parse(_value);
                          DateTime dt2 = DateTime.parse(_value1);
                          //DateTime now1 = DateTime.parse(now.toString());
                          final difference = dt2.difference(dt1).inDays + 1;

                          String now1 = DateFormat("yyyy-MM-dd").format(now);
                          DateTime now2 = DateTime.parse(now1);

                          final year = DateFormat("yyyy").format(now);

                          print(dt1);
                          print(dt2);
                          print(year);
                          print(now2);

                          if (dt2.isBefore(dt1)) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "From date cannot be greater then To date",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xFF8CA6DB),
                                        ),
                                        //color: Color(0xff064A76),
                                        //color: Color(0xFF8CA6DB),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else {
                            var response = await http.post(
                                Uri.parse(
                                    'http://10.1.2.7/monyeem/leaveandtourapply.php'),
                                body: jsonEncode(<String, String>{
                                  "zid": "100060",
                                  "zauserid": widget.xposition, //position
                                  "xstaff": widget.xstaff,
                                  "xdate": "$now2",
                                  "xyear": "$year",
                                  "xday": difference.toString(), //add 1
                                  "xyearperdate": "$item", // auto
                                  "xyesno": "No",
                                  "xtypeleave": dropdownValue,
                                  "xdatefrom": "$dt1",
                                  "xdateto": "$dt2",
                                  "xmobile": contact,
                                  "xtstaff": taskAssign,
                                  "xnote": reason,
                                  "xstatus": "Open",
                                  "xdaydeduct": "1",
                                  "xhourdeduct": "24",
                                  "xsid": widget.xsid,
                                  "xposition": widget.xposition,
                                  "xhday": "0", // holiday
                                  "xpreparer": widget.xstaff,
                                  "xappday": difference.toString(),

                                  // "zid" : "100060",
                                  // "zauserid": widget.xstaff,
                                  // "xstaff":widget.xstaff,
                                  // "xdate":"2022-03-05 00:00:00",
                                  // "xyear":"2022",
                                  // "xday":"3",
                                  // "xyearperdate": "21642164",
                                  // "xyesno":"No",
                                  // "xtypeleave":"Annual Leave",
                                  // "xdatefrom":"2022-03-08 00:00:00",
                                  // "xdateto":"2022-03-10 00:00:00",
                                  // "xmobile":"Raad",
                                  // "xtstaff":"EID-02243",
                                  // "xnote":"As my wish.",
                                  // "xstatus":"Open",
                                  // "xdaydeduct":"1",
                                  // "xhourdeduct":"24",
                                  // "xsid":"1878",
                                  // "xposition": "2125",
                                  // "xhday":"0",
                                  // "xpreparer":"EID-02125",
                                  // "xappday":"3"
                                }));

                            print(response.body);
                            print(response.statusCode);

                            print(_value);

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Apply"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "Leave Type: " + dropdownValue,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "From Date: " + _value,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "To Date: " + _value1,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Contact: " + contact,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Task Assign: " + taskAssign,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Reason: " + reason,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Day: " + difference.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xFF8CA6DB),
                                        ),
                                        //color: Color(0xff064A76),
                                        //color: Color(0xFF8CA6DB),
                                        onPressed: () async {
                                          //Navigator.pop(context);

                                          print("Tapped");
                                          setState(() {
                                            item++;
                                          });

                                          for (i = 1; i <= difference; i++) {
                                            var response = await http.post(
                                                Uri.parse(
                                                    'http://10.1.2.7/monyeem/attandence_report.php'),
                                                body:
                                                    jsonEncode(<String, String>{
                                                  "zid": "100060",
                                                  "xyearperdate": "$item",
                                                  // "xstaff": widget.xstaff,
                                                  "xrow": i.toString(),
                                                  // "xyear":  "$year",
                                                  // "xdate": "$now2",
                                                  // "xtypeleave": dropdownValue,
                                                  // "xpaidleave": " ",
                                                  // "xposition": " ",
                                                  // "xdayname": " day",
                                                  // "xper": " ",
                                                }));
                                            i++;
                                            print(response.statusCode);
                                            print(response.body);
                                            print(i.toString);
                                          }
                                        },
                                        child: Text("Apply"),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          }
                        },

                        //LeaveTourModel data= await
                        //submitData(dropdownValue, _value,_value1,contact,taskAssign,reason);
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Leave_page()));
                        // Navigator.pop(context);
                        // setState(() {
                        //   //_dataModel = data;
                        // });

                        child: Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
