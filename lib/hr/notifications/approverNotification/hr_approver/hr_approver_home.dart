import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:hrandsells/hr/viewNotification.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';

import '../special/advance_adjustment_notification.dart';

import '../special/land_advance_request_notificaition.dart';
import '../special/legal_activities_notification.dart';
import '../special/lfa_approval_notificaition.dart';
import '../sr_notification.dart';
import 'absent_employee.dart';
import 'early_employee.dart';
import 'late_employee.dart';
import 'leave_tour_employee.dart';

class HrApproverHome extends StatefulWidget {
  HrApproverHome({
    required this.xposition,
    required this.xstaff,
    required this.zemail,
    required this.zid,
    required this.adminearly,
    required this.adminlate,
    required this.adminleave,
    required this.adminabsent,
  });
  String xposition;
  String xstaff;
  String zemail;
  String zid;
  String adminearly;
  String adminlate;
  String adminleave;
  String adminabsent;


  @override
  _HrApproverHomeState createState() => _HrApproverHomeState();
}

class _HrApproverHomeState extends State<HrApproverHome> {
  // fetchnotification _noteList = fetchnotification();
  //fetchnotification _noteList = fetchnotification();



  late StreamController<int> _eventAbsent;
  late StreamController<int> _eventLeave;
  late StreamController<int> _eventLate;
  late StreamController<int> _eventEarly;



  void _counter() {
    widget.adminabsent;
    _eventAbsent.add(int.parse(widget.adminabsent));

    widget.adminleave;
    _eventLeave.add(int.parse(widget.adminleave));

    widget.adminlate;
    _eventLate.add(int.parse(widget.adminlate));

    widget.adminearly;
    _eventEarly.add(int.parse(widget.adminearly));

  }




  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (_) => _counter());
    _eventAbsent = new StreamController<int>();
    _eventAbsent.add(int.parse(widget.adminabsent));

    _eventLeave = new StreamController<int>();
    _eventLeave.add(int.parse(widget.adminleave));

    _eventLate = new StreamController<int>();
    _eventLate.add(int.parse(widget.adminlate));

    _eventEarly = new StreamController<int>();
    _eventEarly.add(int.parse(widget.adminearly));


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
          centerTitle: true,
          title: Text(
            "HR Notification",
            style: GoogleFonts.bakbakOne(
              fontSize: 20,
              color: Color(0xff074974),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: Container(
                height: MediaQuery.of(context).size.width / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                child: TextButton(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Admin_Late_Leave_NotificationList(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge: int.parse(widget.adminlate) == 0 ? false : true,
                    padding:
                    EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventLate.stream,
                      builder: (BuildContext context, snapshot) {
                        return new Text("${snapshot.data}",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    badgeColor: Color(0xff064A76),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Late Employees",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bakbakOne(
                          fontSize: 18,
                          color: Color(0xff064A76),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: Container(
                height: MediaQuery.of(context).size.width / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                child: TextButton(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Admin_Early_Leave_NotificationList(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.adminearly) == 0 ? false : true,
                    padding:
                    EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventEarly.stream,
                      builder: (BuildContext context, snapshot) {
                        return new Text("${snapshot.data}",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    badgeColor: Color(0xff064A76),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Early Leave Employee",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bakbakOne(
                          fontSize: 18,
                          color: Color(0xff064A76),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
              child: Container(
                height: MediaQuery.of(context).size.width / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                child: TextButton(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Admin_Leave_Tour_NotificationList(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.adminleave) == 0 ? false : true,
                    padding:
                    EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventLeave.stream,
                      builder: (BuildContext context, snapshot) {
                        return new Text("${snapshot.data}",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    badgeColor: Color(0xff064A76),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Leave & Tour for Approval",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Color(0xff064A76),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: Container(
                height: MediaQuery.of(context).size.width / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                child: TextButton(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Admin_Absent_NotificationList(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.adminabsent) == 0 ? false : true,
                    padding:
                    EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventAbsent.stream,
                      builder: (BuildContext context, snapshot) {
                        return new Text("${snapshot.data}",
                          style: GoogleFonts.bakbakOne(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    badgeColor: Color(0xff064A76),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Absent Employee",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bakbakOne(
                          fontSize: 18,
                          color: Color(0xff064A76),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
