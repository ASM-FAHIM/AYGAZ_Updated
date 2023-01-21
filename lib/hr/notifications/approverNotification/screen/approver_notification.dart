import 'dart:async';

import 'package:aygazhcm/hr/notifications/approverNotification/Customer_waiting_list_Notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/bat_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/batp_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/bm_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/bmp_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/dc_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/do_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/grn_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/items_Notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/pending_sales_return_approval_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/pending_supplier_approval_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/po_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/prn_notofication.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/service_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/so_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/spot_purchase_advance_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/sqc_notification.dart';
import 'package:aygazhcm/hr/notifications/approverNotification/supplier_notification.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cs_notification.dart';
import '../money_req_adjustment.dart';
import '../money_requisition.dart';
import '../pending_voucher.dart';
import '../spr_notification.dart';
import '../sr_notification.dart';

class AdminNotificationList extends StatefulWidget {
  AdminNotificationList({
    required this.xposition,
    required this.xstaff,
    required this.zemail,
    required this.zid,
    required this.po,
    required this.cs,
    required this.sr,
    required this.pendingVoucher,
    required this.spr,
    required this.spa,
    required this.grn,
    required this.sqc,
    required this.prn,
    required this.so,
    required this.dc,
    required this.dO,
    required this.psra,
    required this.bm,
    required this.bmp,
    required this.batp,
    required this.bat,
    required this.cusList,
    required this.monReqCount,
    required this.monReqAdjCount,
    required this.serviceNotiCount,
    required this.itemsCount,
    required this.supplierCount,
  });
  String xposition;
  String xstaff;
  String zemail;
  String zid;
  String po;
  String cs;
  String sr;
  String pendingVoucher;
  String spr;
  String spa;
  String grn;
  String sqc;
  String prn;
  String so;
  String dc;
  String dO;
  String psra;
  String bm;
  String bmp;
  String batp;
  String bat;
  String cusList;
  String serviceNotiCount;
  String monReqCount;
  String monReqAdjCount;
  String itemsCount;
  String supplierCount;

  @override
  _AdminNotificationListState createState() => _AdminNotificationListState();
}

class _AdminNotificationListState extends State<AdminNotificationList> {



  late StreamController<int> _eventPO;
  late StreamController<int> _eventCS;
  late StreamController<int> _eventSR;
  late StreamController<int> _eventPV;
  late StreamController<int> _eventSPR;
  late StreamController<int> _eventSPA;
  late StreamController<int> _eventGRN;
  late StreamController<int> _eventSQC;
  late StreamController<int> _eventPRN;
  late StreamController<int> _eventSO;
  late StreamController<int> _eventDC;
  late StreamController<int> _eventDO;
  late StreamController<int> _eventPSRA;
  late StreamController<int> _eventBM;
  late StreamController<int> _eventBMP;
  late StreamController<int> _eventBATP;
  late StreamController<int> _eventBAT;
  late StreamController<int> _eventCUSList;
  late StreamController<int> _eventServiceNoti;
  late StreamController<int> _eventMonREQCount;
  late StreamController<int> _eventchMonREQ_Adj_Count;
  late StreamController<int> _eventItemCount;
  late StreamController<int> _eventSupllierCount;


  void _counter() {
    widget.po;
    _eventPO.add(int.parse(widget.po));

    widget.cs;
    _eventCS.add(int.parse(widget.cs));

    widget.sr;
    _eventSR.add(int.parse(widget.sr));

    widget.pendingVoucher;
    _eventPV.add(int.parse(widget.pendingVoucher));

    widget.spr;
    _eventSPR.add(int.parse(widget.spr));

    widget.spa;
    _eventSPA.add(int.parse(widget.spa));

    widget.grn;
    _eventGRN.add(int.parse(widget.grn));

    widget.sqc;
    _eventSQC.add(int.parse(widget.sqc));

    widget.prn;
    _eventPRN.add(int.parse(widget.prn));

    widget.so;
    _eventSO.add(int.parse(widget.so));

    widget.dc;
    _eventDC.add(int.parse(widget.dc));

    widget.dO;
    _eventDO.add(int.parse(widget.dO));

    widget.psra;
    _eventPSRA.add(int.parse(widget.psra));

    widget.bm;
    _eventBM.add(int.parse(widget.bm));

    widget.bmp;
    _eventBMP.add(int.parse(widget.bmp));

    widget.batp;
    _eventBATP.add(int.parse(widget.batp));

    widget.bat;
    _eventBAT.add(int.parse(widget.bat));

    widget.cusList;
    _eventCUSList.add(int.parse(widget.cusList));

    widget.serviceNotiCount;
    _eventServiceNoti.add(int.parse(widget.serviceNotiCount));

    widget.monReqCount;
    _eventMonREQCount.add(int.parse(widget.monReqCount));

    widget.monReqAdjCount;
    _eventchMonREQ_Adj_Count.add(int.parse(widget.monReqAdjCount));

    widget.itemsCount;
    _eventItemCount.add(int.parse(widget.itemsCount));

    widget.supplierCount;
    _eventSupllierCount.add(int.parse(widget.supplierCount));




  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (_) => _counter());
    _eventPO = new StreamController<int>();
    _eventPO.add(int.parse(widget.po));

    _eventCS = new StreamController<int>();
    _eventCS.add(int.parse(widget.cs));

    _eventSR = new StreamController<int>();
    _eventSR.add(int.parse(widget.sr));

    _eventPV = new StreamController<int>();
    _eventPV.add(int.parse(widget.pendingVoucher));

    _eventSPR = new StreamController<int>();
    _eventSPR.add(int.parse(widget.spr));

    _eventSPA = new StreamController<int>();
    _eventSPA.add(int.parse(widget.spa));

    _eventGRN = new StreamController<int>();
    _eventGRN.add(int.parse(widget.grn));

    _eventSQC = new StreamController<int>();
    _eventSQC.add(int.parse(widget.sqc));

    _eventPRN = new StreamController<int>();
    _eventPRN.add(int.parse(widget.prn));

    _eventSO = new StreamController<int>();
    _eventSO.add(int.parse(widget.so));

    _eventDC = new StreamController<int>();
    _eventDC.add(int.parse(widget.dc));

    _eventDO = new StreamController<int>();
    _eventDO.add(int.parse(widget.dO));

    _eventPSRA = new StreamController<int>();
    _eventPSRA.add(int.parse(widget.psra));

    _eventBM = new StreamController<int>();
    _eventBM.add(int.parse(widget.bm));

    _eventBMP = new StreamController<int>();
    _eventBMP.add(int.parse(widget.bmp));

    _eventBATP = new StreamController<int>();
    _eventBATP.add(int.parse(widget.batp));

    _eventBAT = new StreamController<int>();
    _eventBAT.add(int.parse(widget.bat));

    _eventCUSList = new StreamController<int>();
    _eventCUSList.add(int.parse(widget.cusList));

    _eventServiceNoti = new StreamController<int>();
    _eventServiceNoti.add(int.parse(widget.serviceNotiCount));

    _eventMonREQCount = new StreamController<int>();
    _eventMonREQCount.add(int.parse(widget.monReqCount));

    _eventchMonREQ_Adj_Count = new StreamController<int>();
    _eventchMonREQ_Adj_Count.add(int.parse(widget.monReqAdjCount));

    _eventItemCount = new StreamController<int>();
    _eventItemCount.add(int.parse(widget.itemsCount));

    _eventSupllierCount = new StreamController<int>();
    _eventSupllierCount.add(int.parse(widget.supplierCount));

  }

  // void _csCounter() {
  //
  // }
  //
  //
  //
  // void _srCounter() {
  //
  // }



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
        centerTitle: true,
        title: Text(
          "Document Approval",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PO_WO_approval_NotificationList(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge: int.parse(widget.po) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventPO.stream,
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
                          "Purchase/Work Order",
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
                            builder: (context) => CS_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.cs) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventCS.stream,
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
                          "Comparison Statement",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SR_notification(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge: int.parse(widget.sr) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSR.stream,
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
                          "Store Requisition",
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
                            builder: (context) => Pending_voucher(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge:
                        int.parse(widget.pendingVoucher) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventPV.stream,
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
                          "Voucher For Approval",
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
                            builder: (context) => SPR_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.spr) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSPR.stream,
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
                          "Store Purchase Requisition",
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
                                SpotPurchaseAdvance_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.spa) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSPA.stream,
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
                          "Spot Purchase Advance",
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
                            builder: (context) => GRN_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.grn) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventGRN.stream,
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
                          "Goods Received Note",
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
                            builder: (context) => SQC_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.sqc) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSQC.stream,
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
                          "Service Quality Certification",
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
                            builder: (context) => SO_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.so) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSO.stream,
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
                          "Sales Order",
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
                        builder: (context) => DC_Notification(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge: int.parse(widget.dc) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventDC.stream,
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
                          "Direct Chalan",
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
                            builder: (context) => DO_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.dO) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventDO.stream,
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
                          "Sales Invoicing",
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
                            builder: (context) => BOM_Notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.bm) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventBM.stream,
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
                          "BOM Entry",
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
                            builder: (context) => BMP_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.bmp) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventBMP.stream,
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
                          "Pre Process BOM",
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
                            builder: (context) => BATP_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.batp) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventBATP.stream,
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
                          "Pre Process Batch",
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
                            builder: (context) => BAT_notification(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.bat) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventBAT.stream,
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
                          "Batch Notification",
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
                            builder: (context) => CustomerWaitingListApproval(
                                  xposition: widget.xposition,
                                  xstaff: widget.xstaff,
                                  zemail: widget.zemail,
                                  zid: widget.zid,
                                )));
                  },
                  child: Badge(
                    showBadge: int.parse(widget.cusList) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventCUSList.stream,
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
                          "Customer List Waiting",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Money_requisition(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge:
                        int.parse(widget.monReqCount) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventMonREQCount.stream,
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
                          "Money Requisition",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoneyReqAdjustment(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge:
                        int.parse(widget.monReqAdjCount) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventchMonREQ_Adj_Count.stream,
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
                          "Money Requisition Adjustment",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemsApprovalNotification(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge: int.parse(widget.itemsCount) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventItemCount.stream,
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
                          "Items for Approval",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceNotification(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge:
                        int.parse(widget.serviceNotiCount) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventServiceNoti.stream,
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
                          "Service for approval",
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
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupplierNotification(
                          xposition: widget.xposition,
                          xstaff: widget.xstaff,
                          zemail: widget.zemail,
                          zid: widget.zid,
                        ),
                      ),
                    );
                  },
                  child: Badge(
                    showBadge:
                        int.parse(widget.supplierCount) == 0 ? false : true,
                    padding:
                        EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                    badgeContent: StreamBuilder(
                      stream: _eventSupllierCount.stream,
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
                          "Supplier for Approval",
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
