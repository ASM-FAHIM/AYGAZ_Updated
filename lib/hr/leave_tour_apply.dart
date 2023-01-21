import 'dart:convert';
import 'package:aygazhcm/data_model/leave_tour_model.dart';
import 'package:aygazhcm/data_model/loginModel.dart';
import 'package:aygazhcm/data_model/smallapi/holidaymodel.dart';
import 'package:aygazhcm/data_model/xyearperdate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../data_model/smallapi/appliedleavemodel.dart';
import '../data_model/smallapi/availavleLeaveModel.dart';
import '../data_model/smallapi/blockdatemodel.dart';
import '../data_model/smallapi/checkleavebalance_model.dart';
import '../data_model/smallapi/leave_type_model.dart';

class LeaveApply_page extends StatefulWidget {
  LeaveApply_page({
    required this.xstaff,
    required this.xposition,
    required this.xsid,
    //required this.leave_avail,
    required this.xname,
    //required this.appleave
  });

  String xstaff;
  String xposition;
  String xname;
  //String leave_avail;
  String xsid;
  //String appleave;

  @override
  _LeaveApply_pageState createState() => _LeaveApply_pageState();
}

class _LeaveApply_pageState extends State<LeaveApply_page> {
  late LoginModel data;

  // DateTime now = DateTime.now();
  DateTime now = DateTime.now();
  String _value = '';
  String _value1 = '';
  String taskAssign = '';
  String contact = '';
  String reason = '';
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String status = 'Waiting for Approval';

  int item = 21646421;

  late Xyearperdate xyearperdate1;
  late int xyearperdate2;

  Future<String> getAPIDATA() async {
    http.Response response = await http.get(
      Uri.parse(
          'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/xyearperdate.php'),
    );

    xyearperdate1 = xyearperdateFromJson(response.body);

    xyearperdate2 = (xyearperdate1.xyearperdate) + 1;

    print(xyearperdate1.xyearperdate);

    print(response.body);
    print(response.statusCode);

    return '';
  }

  late HolidayModel holiday;
  String holidaycount = " ";

  //for holiday count
  Future<String> getholidaydata() async {
    http.Response response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/holidayCount.php'),
        body: jsonEncode(<String, String>{
          "xstaff": widget.xstaff,
          "fdate": _value,
          "tdate": _value1,
        }));

    print("Body:" + response.body);
    print(response.statusCode);

    holiday = holidayModelFromJson(response.body);
    print("holiday:" + holiday.holiday.toString());

    holidaycount = holiday.holiday.toString();

    return '';
  }

  late BlockeddateModel blockeddateModel;
  String blockdate = " ";

  Future<String> getblockdatedata() async {
    http.Response response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/dateblock.php'),
        body: jsonEncode(<String, String>{
          "xstaff": widget.xstaff,
          "fdate": _value,
          "tdate": _value1,
        }));

    print("Body:" + response.body);
    print(response.statusCode);

    blockeddateModel = blockeddateModelFromJson(response.body);
    print("block:" + blockeddateModel.applydate.toString());

    blockdate = blockeddateModel.applydate.toString();

    return '';
  }

  void _showDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      //initialDate: new DateTime.now(),
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
    // if(picked != null) setState(() => _value1 = picked.toString());

    if (picked != null && picked != date) {
      setState(() {
        date = picked.toString();
        _value1 = DateFormat("yyyy-MM-dd").format(picked);
      });
    }
    getholidaydata();
    getblockdatedata();
    getAPIDATA();
  }

  late LeaveandTourModel _dataModel;
  //make dynamic dropdown value
  String? dropdownValue;
  List<LeaveTypeModel>? dropdownList;
  Future<List<LeaveTypeModel>>? availableLeave;
  Future<List<LeaveTypeModel>?> getDropdownList() async {
    var response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leaveSelect.php'),
        body: jsonEncode(<String, String>{"xstaff": widget.xstaff}));

    print(response.body);
    var listValue = leaveTypeModelFromJson(response.body);
    setState(() {
      dropdownList = listValue;
    });

    return dropdownList!;
  }

  //available leave from leave and tour page
  List<AvailebleLeaveModel>? availableleave;
  Future<List<AvailebleLeaveModel>> fetchavailableleave() async {
    var response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leavetype.php'),
        body: jsonEncode(<String, String>{"xstaff": widget.xstaff}));

    print(response.body);

    if (response.statusCode == 200) {
      var availableList = availebleLeaveModelFromJson(response.body);
      availableleave = availableList;
    } else {
      throw Exception('Failed to load album');
    }
    return availableleave!;
  }

  late CheckLeaveBalance checkLeaveBalance;
  String leave_avail = '';
  checkbalance(String newValue) async {
    print(newValue);
    var response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/xbalance.php'),
        body: jsonEncode(
            <String, String>{"xstaff": widget.xstaff, "xtype": newValue}));

    print(response.body);
    checkLeaveBalance = checkLeaveBalanceFromJson(response.body);
    print(checkLeaveBalance.xbalance);

    leave_avail = checkLeaveBalance.xbalance;
  }

  late AppliedLeaveModel appliedleave;
  String appleave = " ";
  getappleavedata(String newValue) async {
    print("enter");
    http.Response response = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/appliedleave.php'),
        body: jsonEncode(
            <String, String>{"xstaff": widget.xstaff, "xtype": newValue}));

    print("Body:" + response.body);
    print(response.statusCode);

    appliedleave = appliedLeaveModelFromJson(response.body);

    //appleave = appliedleave.appliedleave;

    if (appliedleave.appliedleave == null) {
      appleave = "0";
      //print("Test:"+appliedleave.appliedleave);
      print("Applied Leave:" + appleave);
    } else {
      appleave = appliedleave.appliedleave;
      print("Applied Leave:" + appleave);
    }

    return '';
  }

  @override
  void initState() {
    // TODO: implement initState
    getDropdownList();
    fetchavailableleave();
    availableleave;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
            title: Center(
              child: Text(
                "Leave & Tour Apply",
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
              padding: const EdgeInsets.only(left: 15.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.xname,
                    style: GoogleFonts.bakbakOne(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.xposition,
                    style: GoogleFonts.bakbakOne(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    DateFormat("dd-MM-yyyy - hh:mm").format(now),
                    style: GoogleFonts.bakbakOne(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: Center(
                              child: DropdownButton<String>(
                                hint: const Text(
                                  "Select leave type",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                items: dropdownList?.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.xtypeleave,
                                    child: Text(item.xtypeleave),
                                  );
                                }).toList(),
                                value: dropdownValue,
                                onChanged: (newValue) {
                                  if (newValue == "Leave Without Pay" ||
                                      newValue == "Official Tour" ||
                                      newValue == "Replacement Leave") {
                                    leave_avail = "100000000000";
                                    getappleavedata(newValue!);
                                    print("leave_available:" +
                                        newValue.toString() +
                                        leave_avail);
                                  } else {
                                    checkbalance(newValue!);
                                    getappleavedata(newValue);
                                    print("leave_available:" +
                                        newValue.toString() +
                                        leave_avail);
                                  }
                                  setState(() {
                                    dropdownValue = newValue;
                                    //one method need to call for dropdown
                                    print(getDropdownList());
                                  });
                                },
                              ),
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
                            'Leave Type',
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color(0xfffafafa),
                          ),
                          //color: Color(0xfffafafa),
                          onPressed: () {
                            _showDatePicker();
                          },
                          child: Center(
                              child: Row(
                            children: [
                              // TextButton(
                              //   color: Color(0xfffafafa),
                              //   onPressed: () {
                              //     _showDatePicker();
                              //   },
                              //   child: Icon(Icons.calendar_today_sharp),
                              // ),
                              Icon(Icons.calendar_today_sharp),

                              SizedBox(
                                width: 10,
                              ),

                              Text(
                                "$_value",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
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
                            'Form Date',
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color(0xfffafafa),
                          ),
                          //color: Color(0xfffafafa),
                          onPressed: () {
                            _showDatePicker1();
                          },
                          child: Center(
                              child: Row(
                            children: [
                              // TextButton(
                              //   color: Color(0xfffafafa),
                              //   onPressed: () {
                              //     _showDatePicker1();
                              //   },
                              //   child: Icon(Icons.calendar_today_sharp),
                              // ),

                              Icon(Icons.calendar_today_sharp),

                              SizedBox(
                                width: 10,
                              ),

                              Text(
                                "$_value1",
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
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
                            'To Date',
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                          style: GoogleFonts.bakbakOne(
                              fontSize: 15, color: Colors.black),
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
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                          style: GoogleFonts.bakbakOne(
                              fontSize: 15, color: Colors.black),
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
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                            style: GoogleFonts.bakbakOne(
                                fontSize: 15, color: Colors.black),
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
                        color: Color(0xff064A76),
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
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () async {
                          print(availableleave);
                          print(dropdownValue);
                          DateTime dt1 = DateTime.parse(_value);
                          DateTime dt2 = DateTime.parse(_value1);
                          //DateTime now1 = DateTime.parse(now.toString());
                          final difference = dt2.difference(dt1).inDays + 1;

                          String now1 = DateFormat("yyyy-MM-dd").format(now);
                          DateTime now2 = DateTime.parse(now1);

                          final year = DateFormat("yyyy").format(now);

                          if (dropdownValue == 'Select leave type') {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "Must Select leave Type",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
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
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else if (dt2.isBefore(dt1)) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "From date cannot be greater then To date",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
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
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else if (int.parse(blockdate) != 0) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "Date Already Applied",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xff064A76),
                                        ),
                                        //color: Color(0xff074974),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else if ((double.parse(leave_avail) +
                                  int.parse(holidaycount)) <
                              difference) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        Text(
                                          "Remain leave is " +
                                              leave_avail +
                                              " But applied " +
                                              difference.toString(),
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xff064A76),
                                        ),
                                        //color: Color(0xff074974),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else if (((double.parse(leave_avail)) -
                                  int.parse(appleave) +
                                  int.parse(holidaycount)) <
                              difference) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: Column(
                                      children: [
                                        //Text("Remain leave with Applied "+(double.parse(widget.leave_avail)).toString()+" But applied "+difference.toString(),
                                        Text(
                                          "Remain leave is more then Applied leave",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xff074974),
                                        ),
                                       // color: Color(0xff074974),
                                        onPressed: () {
                                          //Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          } else {
                            print(xyearperdate2);
                            var response = await http.post(
                                Uri.parse(
                                    'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leaveandtourapply.php'),
                                body: jsonEncode(<String, String>{
                                  "zid": "200010",
                                  "zauserid": widget.xposition, //position
                                  "xstaff": widget.xstaff,
                                  "xdate": "$now2",
                                  "xyear": "$year",
                                  "xday": difference.toString(), //add 1
                                  //"xyearperdate": (int.parse(_xyearperdate)+1).toString(),// auto
                                  "xyearperdate":
                                      xyearperdate2.toString(), // auto
                                  "xyesno": "No",
                                  "xtypeleave": dropdownValue!,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Leave Type: " + dropdownValue!,
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "From Date: " +
                                              DateFormat("dd-MM-yyyy").format(
                                                  DateTime.parse(_value)),
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "To Date: " +
                                              DateFormat("dd-MM-yyyy").format(
                                                  DateTime.parse(_value1)),
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Contact: " + contact,
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Task Assign: " + taskAssign,
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Reason: " + reason,
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        if(dropdownValue == 'Official Tour')...[
                                          Text(
                                            "Day: " +
                                                (difference).toString(),
                                            style: GoogleFonts.bakbakOne(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ]else...[
                                          Text(
                                            "Day: " +
                                                (difference -
                                                    int.parse(holidaycount))
                                                    .toString(),
                                            style: GoogleFonts.bakbakOne(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ]
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xff074974),
                                        ),
                                        //color: Color(0xff074974),
                                        onPressed: () async {
                                          //getAPIDATA();
                                          String staff_er = widget.xstaff;
                                          print(staff_er);
                                          print(xyearperdate2);

                                          var response = await http.post(
                                              Uri.parse(
                                                  'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leaveandtourapplyconfirm.php'),
                                              body: jsonEncode(<String, String>{
                                                "zid": "200010",
                                                "xposition": widget.xposition,
                                                "xyearperdate":
                                                    xyearperdate2.toString(),
                                                "xyear": (DateTime.parse(_value)
                                                        .year)
                                                    .toString(),
                                                "xstaff": widget.xstaff,
                                                "xtypeleave": dropdownValue!
                                              }));
                                          print(dropdownValue);
                                          var response1 = await http.post(
                                              Uri.parse(
                                                  'http://103.150.48.235:2165/API/aygaz/HR/leave_and_tour/leaveandtourapplyconfirmfinal.php'),
                                              body: jsonEncode(<String, String>{
                                                //position

                                                "zid": "200010",
                                                "user": widget.xposition,
                                                "xposition": widget.xposition,
                                                "xyearperdate":
                                                    xyearperdate2.toString(),
                                                "xstaff": widget.xstaff,
                                                "xtypeleave": "Leave"
                                              }));
                                          print("confir: ${response.body}");
                                          print("confir1: ${response1.body}");
                                          print("confir1: ${widget.xposition}");
                                          print("confir1: $xyearperdate2");
                                          print("confir1: ${widget.xstaff}");

                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              "Leave Applied",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.bakbakOne(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ));

                                          setState(() {
                                            item++;
                                          });
                                          //Navigator.pop(context);
                                          print(response.body);
                                          print(response.statusCode);
                                        },
                                        child: Text(
                                          "Apply",
                                          style: GoogleFonts.bakbakOne(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                    scrollable: true,
                                  );
                                });
                          }
                        },
                        child: Text(
                          "Add",
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
