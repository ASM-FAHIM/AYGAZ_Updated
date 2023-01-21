import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../report/attendance_report.dart';

class AttendanceField extends StatefulWidget {
  AttendanceField(
      {required this.xstaff, required this.xposition, required this.xsid});
  String xstaff;
  String xposition;
  dynamic xsid;

  @override
  _AttendanceFieldState createState() => _AttendanceFieldState();
}

class _AttendanceFieldState extends State<AttendanceField> {
  DateTime now = DateTime.now();
  String dropdownValue = 'Pick';
  String _fromDate = '';
  String _toDate = '';
  var initialDate;
  var firstDate;
  var lastDate;

  String intime = '';
  String outtime = '';
  bool pressAttention = false;
  bool pressAttention1 = false;
  String _currentAddress = " ";
  String _currentAddressout = " ";
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  int datecount = 0;

  Future<void> getLocationin() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality} ${place.postalCode}, ${place.country}";
        //"${place.thoroughfare} ${place.postalCode}, ${place.country}";
        //_currentAddressout = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
    //print(_currentAddress);
  }

  Future<void> getLocationout() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        //_currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
        _currentAddressout =
            "${place.locality} ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    //print(_currentAddress);
  }

  void _showFromDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2022),
      lastDate: new DateTime(2024),
      builder: (context, child) => Theme(
        data: ThemeData(
            backgroundColor: Colors.blueAccent,
            colorScheme: ColorScheme.dark(
              primary: Colors.blueAccent,
              surface: Color(0xff064A76),
            )),
        child: child as Widget,
      ),
    );

    if (picked != null)
      setState(() => _fromDate =
          DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString())));
    ;
  }

  void _showToDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2022),
      lastDate: new DateTime(2024),
      builder: (context, child) => Theme(
        data: ThemeData(
            backgroundColor: Colors.blueAccent,
            colorScheme: ColorScheme.dark(
              primary: Colors.blueAccent,
              surface: Color(0xff064A76),
            )),
        child: child as Widget,
      ),
    );

    if (picked != null)
      setState(() => _toDate =
          DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString())));
  }

  // submitData(invalue, outvalue, inlocation, outlocation) async {
  //   print(invalue);
  //   print(outvalue);
  //   print(inlocation);
  //   print(outlocation);
  //
  //   var response = await http.post(
  //       Uri.parse('http://103.150.48.235:2165/API/aygaz/HR/attendance/attendencetemp.php'),
  //       body: jsonEncode(<String, String>{
  //         "xposition": "2125",
  //         "xtimein": "2022-03-07 09:01:35.000",
  //         "xmodel": "B@N"
  //       }));
  //   var data = response.body;
  //   // print (data);
  //   print("ii" + response.body);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now;
  }

  @override
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
            "Attendance",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // from date View
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (datecount == 0) ...[
                                TextButton(
                                  // minWidth:
                                  //     MediaQuery.of(context).size.width / 3,
                                  style: TextButton.styleFrom(
                                    primary: pressAttention
                                        ? Colors.green
                                        : Colors.white10,
                                  ),
                                  //color:
                                  onPressed: () async {
                                    await getLocationin();
                                    setState(() {
                                      print('in count $datecount');
                                      datecount = datecount + 1;
                                      DateTime now = DateTime.now();
                                      date = now.toString();
                                      String Onlydate =
                                          new DateFormat("yyyy h:mm:ssa")
                                              .format(now);
                                      intime = '$Onlydate';
                                      pressAttention = !pressAttention;
                                    });

                                    var response = await http.post(
                                      Uri.parse(
                                          'http://103.150.48.235:2165/API/aygaz/HR/attendance/attendencetemp.php'),
                                      body: jsonEncode(
                                        <String, String>{
                                          "xposition": widget.xposition,
                                          "xlocation": _currentAddress,
                                        },
                                      ),
                                    );
                                    print(response.statusCode);
                                    print(response.body);
                                    print(intime);

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "IN Time Saved",
                                        style: GoogleFonts.bakbakOne(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "IN",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: pressAttention
                                              ? Colors.black
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "$intime",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.bakbakOne(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        _currentAddress,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.bakbakOne(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ] else ...[
                                Column(
                                  children: [
                                    Text(
                                      "IN",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: pressAttention
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "$intime",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      _currentAddress,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                              TextButton(
                                //minWidth: MediaQuery.of(context).size.width / 3,
                                style: TextButton.styleFrom(
                                  primary: pressAttention1 ? Colors.red : Colors.white,
                                ),

                                onPressed: () async {
                                  print('out count $datecount');
                                  await getLocationout();
                                  setState(() {
                                    datecount = 0;
                                    DateTime now = DateTime.now();
                                    date = now.toString();
                                    String Onlydate =
                                        new DateFormat("yyyy h:mm:ssa")
                                            .format(now);
                                    outtime = '$Onlydate';
                                    pressAttention1 = !pressAttention1;
                                  });
                                  var response = await http.post(
                                    Uri.parse(
                                        'http://103.150.48.235:2165/API/aygaz/HR/attendance/attendencetemp.php'),
                                    body: jsonEncode(
                                      <String, String>{
                                        "xposition": widget.xposition,
                                        "xlocation": _currentAddressout,
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "OUT Time saved",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ));
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "OUT",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "$outtime",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      _currentAddressout,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Stack(
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color(0xfffafafa),
                    ),
                    //color: Color(0xfffafafa),
                    onPressed: () {
                      _showFromDatePicker();
                    },
                    //splashColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: Center(
                          child: Row(
                        children: [
                          Icon(Icons.calendar_today_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _fromDate,
                            style: GoogleFonts.bakbakOne(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )),
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff074974), width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      color: Color(0xfffafafa),
                      child: Text(
                        'Form Date',
                        style: GoogleFonts.bakbakOne(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //to date view
              Stack(
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color(0xfffafafa),
                    ),
                    // splashColor: Colors.white,
                    // minWidth: double.infinity,
                    // color: Color(0xfffafafa),
                    onPressed: () {
                      _showToDatePicker();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: Center(
                          child: Row(
                        children: [
                          Icon(Icons.calendar_today_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _toDate,
                            style: GoogleFonts.bakbakOne(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )),
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff074974), width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      color: Color(0xfffafafa),
                      child: Text(
                        'To Date',
                        style: GoogleFonts.bakbakOne(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xff074974),
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
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    // ),
                    onPressed: () async {
                      print("Tapped");
                      print("f" + _fromDate);
                      print("t" + _toDate);
                      if (_fromDate == "") {
                        Get.snackbar('Error', 'Please Select From Date',
                            backgroundColor: Color(0XFF8CA6DB),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (_toDate == "") {
                        Get.snackbar('Error', 'Please Select  to Date',
                            backgroundColor: Color(0XFF8CA6DB),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (_fromDate == "" || _toDate == "") {
                        Get.snackbar(
                            'Error', 'Please Select From Date and to Date',
                            backgroundColor: Color(0XFF8CA6DB),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (DateTime.parse(_toDate)
                          .isBefore(DateTime.parse(_fromDate))) {
                        Get.snackbar(
                            'Error', 'To date cannot be greater then From date',
                            backgroundColor: Color(0XFF8CA6DB),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance_report(
                              fromDate: _fromDate,
                              toDate: _toDate,
                              xstaff: widget.xstaff,
                              xposition: widget.xposition,
                              xsid: widget.xsid,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "View report",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bakbakOne(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
