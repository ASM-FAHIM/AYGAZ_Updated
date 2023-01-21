import 'dart:convert';

import 'package:aygazhcm/hr/notifications/absent_information.dart';
import 'package:aygazhcm/hr/notifications/early_leave_information.dart';
import 'package:aygazhcm/hr/notifications/late_info_notification.dart';
import 'package:aygazhcm/hr/notifications/leave&tour_notification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:aygazhcm/hr/viewNotification.dart';
import 'package:http/http.dart' as http;

import '../../../../data_model/loginModel.dart';
import '../../../../data_model/notificaiton_count/admin_count.dart';
import '../hr_approver/hr_approver_home.dart';
import 'approver_category.dart';
import 'approver_notification.dart';

class AdminNotification extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  AdminNotification(
      {required this.xposition,
      required this.xstaff,
      required this.zemail,
      required this.zid,
      required this.loginModel});
  String xposition;
  String xstaff;
  String zemail;
  String zid;
  LoginModel loginModel;

  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  String po_Count = "0";
  late PoModel po_Count1;

  String cs_Count = "0";
  late CsModel cs_Count1;

  String sr_Count = "0";
  late SrModel sr_Count1;

  String pendingVoucher_Count = "0";
  late PendingVoucherModel pendingVoucher_Count1;

  String spr_Count = "0";
  late SprModel spr_Count1;

  String spa_Count = "0";
  late SpaModel spa_Count1;

  String grn_Count = "0";
  late GrnModel grn_Count1;

  String sqc_Count = "0";
  late SqcModel sqc_Count1;

  String prn_Count = "0";
  late PrnModel prn_Count1;

  String so_Count = "0";
  late SoModel so_Count1;

  String dc_Count = "0";
  late DcCountModel dc_Count1;

  String do_Count = "0";
  late DoModel do_Count1;

  String salesReturn_Count = "0";
  late SalesReturnModel salesReturn_Count1;

  String bm_Count = "0";
  late BomModel bm_Count1;

  String bmp_Count = "0";
  late BmpModel bmp_Count1;

  String batp_Count = "0";
  late BatpModel batp_Count1;

  String bat_Count = "0";
  late BatModel bat_Count1;

  String cusList_Count = "0";
  late CusListCountModel cusList_Count1;

  // String penSup_Count = "0";
  // late CusListCountModel penSup_Count1;

  String monReq_Count = "0";
  late MonReqCountModel monReq_Count1;

  String monReqAdj_Count = "0";
  late MonReqAdjCountModel monReqAdj_Count1;

  String serviceNoti_Count = "0";
  late ServiceNotifyCountModel serviceNoti_Count1;

  String items_Count = "0";
  late ItemsCountModel items_Count1;

  String supplier_Count = "0";
  late SupplierCountModel supplier_Count1;

  String absentemployee_count = "0";
  late AbsentCountModel absentemployee_count1;

  String leaveandtouradmin_count = "0";
  late LeaveandTourCountModel leaveandtouradmin_count1;

  String earlyemployee_count = "0";
  late EarlyCountModel earlyemployee_count1;

  String lateemployee_count = "0";
  late LateCountModel lateemployee_count1;



  Future<String> getAdminNotificationCount() async {
    http.Response responseCS = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/cs_count.php'),
        body: jsonEncode(<String, String>{"xposition": widget.xposition}));

    cs_Count1 = csModelFromJson(responseCS.body);
    cs_Count = cs_Count1.total.toString();

    print("Admin Early" + responseCS.body);
    http.Response responseGRN = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/grn_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    grn_Count1 = grnModelFromJson(responseGRN.body);
    grn_Count = grn_Count1.total.toString();

    print("Admin late" + responseGRN.body);
    http.Response responseBM = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/pendingBOM_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    bm_Count1 = bomModelFromJson(responseBM.body);
    bm_Count = bm_Count1.total.toString();

    print("Admin Leave" + responseBM.body);
    http.Response responseaBAT = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/pendingBatch_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    bat_Count1 = batModelFromJson(responseaBAT.body);
    bat_Count = bat_Count1.total.toString();

    print("Admin Absent" + responseaBAT.body);
    http.Response responseDO = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/pendingInvoice_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    do_Count1 = doModelFromJson(responseDO.body);
    do_Count = do_Count1.total.toString();

    print("Admin PO" + responseDO.body);
    http.Response responsePRN = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/pendingPurchaseReturn_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    prn_Count1 = prnModelFromJson(responsePRN.body);
    prn_Count = prn_Count1.total.toString();

    print("Admin SR" + responsePRN.body);
    http.Response responseBATP = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/PendingPreProcessBatch_Count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    batp_Count1 = batpModelFromJson(responseBATP.body);
    batp_Count = batp_Count1.total.toString();

    print("Admin CS" + responseBATP.body);
    http.Response responseSO = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/PendingSalesOrder_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    so_Count1 = soModelFromJson(responseSO.body);
    so_Count = so_Count1.total.toString();

    print("Admin LA" + responseSO.body);
    http.Response responseSalesReturn = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/PendingSalesReturn_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    salesReturn_Count1 = salesReturnModelFromJson(responseSalesReturn.body);
    salesReturn_Count = salesReturn_Count1.total.toString();

    print("Admin LFA" + responseSalesReturn.body);
    http.Response responsePendingVoucher = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/pendingVoucher_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    pendingVoucher_Count1 =
        pendingVoucherModelFromJson(responsePendingVoucher.body);
    pendingVoucher_Count = pendingVoucher_Count1.total.toString();

    print("Admin PO" + responsePendingVoucher.body);
    http.Response responsePO = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/povalue_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    po_Count1 = poModelFromJson(responsePO.body);
    po_Count = po_Count1.total.toString();

    print("Admin LFA" + responsePO.body);
    http.Response responseBMP = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/preProcessBOM_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    bmp_Count1 = bmpModelFromJson(responseBMP.body);
    bmp_Count = bmp_Count1.total.toString();

    print("Admin LFA" + responseBMP.body);
    http.Response responseSPA = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/spotpurchaseadvance_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    spa_Count1 = spaModelFromJson(responseSPA.body);
    spa_Count = spa_Count1.total.toString();

    print("Admin LFA" + responseSPA.body);
    http.Response responseSPR = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/spr_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    spr_Count1 = sprModelFromJson(responseSPR.body);
    spr_Count = spr_Count1.total.toString();

    print("Admin LFA" + responseSPR.body);
    http.Response responseSQC = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/sqclist_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    sqc_Count1 = sqcModelFromJson(responseSQC.body);
    sqc_Count = sqc_Count1.total.toString();
    print("Admin LFA" + responseSQC.body);

    http.Response responseSR = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/sr_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    sr_Count1 = srModelFromJson(responseSR.body);
    sr_Count = sr_Count1.total.toString();
    print("Admin LFA" + responseSR.body);

    http.Response responseCusList = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/count_customer.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    cusList_Count1 = cusListCountModelFromJson(responseCusList.body);
    cusList_Count = cusList_Count1.total.toString();
    print("Admin cusList_Count" + responseCusList.body);

    http.Response responseMonReq = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/moneyreqapprovalcount.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    monReq_Count1 = monReqCountModelFromJson(responseMonReq.body);
    monReq_Count = monReq_Count1.total.toString();
    print("Admin monReq_Count" + responseMonReq.body);

    http.Response responseMonReqAdj = await http.post(
        Uri.parse(
            'http://103.150.48.235:2165/API/aygaz/notifications/moneyreqapprovalcount_adj.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    monReqAdj_Count1 = monReqAdjCountModelFromJson(responseMonReqAdj.body);
    monReqAdj_Count = monReqAdj_Count1.total.toString();
    print("Admin monReqAdj_Count" + responseMonReqAdj.body);

    http.Response responseDC = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/dc_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));

    dc_Count1 = dcCountModelFromJson(responseDC.body);
    dc_Count = dc_Count1.total.toString();
    print("Admin dc_Count" + responseDC.body);

    http.Response responseServNotify = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/service_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    serviceNoti_Count1 =
        serviceNotifyCountModelFromJson(responseServNotify.body);
    serviceNoti_Count = serviceNoti_Count1.total.toString();
    print("Admin Service Notification:" + responseServNotify.body);

    http.Response responseItemCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/item_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    items_Count1 = itemsCountModelFromJson(responseItemCount.body);
    items_Count = items_Count1.total.toString();
    print("Admin Item Approval Notification:" + responseItemCount.body);

    http.Response responseSupplierCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/notifications/supplier_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    supplier_Count1 = supplierCountModelFromJson(responseSupplierCount.body);
    supplier_Count = supplier_Count1.total.toString();
    print("Admin Supplier Approval Notification:" + responseSupplierCount.body);


    http.Response responseAbsentCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/hr/adminnotification/absentemployee_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    absentemployee_count1 = absentCountModelFromJson(responseAbsentCount.body);
    absentemployee_count = absentemployee_count1.total.toString();
    print("Admin Absent Notification:" + responseAbsentCount.body);


    http.Response responseLeaveandTourCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/hr/adminnotification/leaveandtouradmin_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    leaveandtouradmin_count1 = leaveandTourCountModelFromJson(responseLeaveandTourCount.body);
    leaveandtouradmin_count = leaveandtouradmin_count1.total.toString();
    print("Admin Leave and Tour Notification:" + responseLeaveandTourCount.body);


    http.Response responseLateCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/hr/adminnotification/lateemployee_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    lateemployee_count1 = lateCountModelFromJson(responseLateCount.body);
    lateemployee_count = lateemployee_count1.total.toString();
    print("Admin Late Notification:" + responseLateCount.body);


    http.Response responseEarlyCount = await http.post(
        Uri.parse('http://103.150.48.235:2165/API/aygaz/hr/adminnotification/earlyemployee_count.php'),
        body: jsonEncode(<String, String>{
          "xposition": widget.xposition,
        }));
    earlyemployee_count1 = earlyCountModelFromJson(responseEarlyCount.body);
    earlyemployee_count = earlyemployee_count1.total.toString();
    print("Admin Early Notification:" + responseEarlyCount.body);



    return '';
  }

  bool isLoadingAN = false;
  bool isLoadingHR = false;

  @override
  void initState() {
    super.initState();
    getAdminNotificationCount();
    print(widget.zid);
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
            "Notifications",
            style: GoogleFonts.bakbakOne(
              fontSize: 20,
              color: Color(0xff074974),
            ),
          ),
        ),
        actions: const [
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.loginModel.xrole != "User") ...[
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
                      setState(() {
                        isLoadingAN = true;
                      });

                      Future.delayed(
                        Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              isLoadingAN = false;
                            },
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminNotificationList(
                                xposition: widget.xposition,
                                xstaff: widget.xstaff,
                                zemail: widget.zemail,
                                zid: widget.zid,
                                po: po_Count,
                                cs: cs_Count,
                                sr: sr_Count,
                                pendingVoucher: pendingVoucher_Count,
                                spr: spr_Count,
                                spa: spa_Count,
                                grn: grn_Count,
                                sqc: sqc_Count,
                                prn: prn_Count,
                                so: so_Count,
                                dc: dc_Count,
                                dO: do_Count,
                                psra: salesReturn_Count,
                                bm: bm_Count,
                                bmp: bmp_Count,
                                batp: batp_Count,
                                bat: batp_Count,
                                cusList: cusList_Count,
                                monReqCount: monReq_Count,
                                monReqAdjCount: monReqAdj_Count,
                                serviceNotiCount: serviceNoti_Count,
                                itemsCount: items_Count,
                                supplierCount: supplier_Count,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoadingAN
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Color(0xff064A76),
                                ),
                              )
                            : Text(
                                "Document Approval Notification",
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      print('Employee HR Approval pressed');
                      setState(() {
                        isLoadingHR = true;
                      });

                      Future.delayed(
                        Duration(seconds: 1),
                        () {
                          setState(() {
                            isLoadingHR = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HrApproverHome(
                                        xposition: widget.xposition,
                                        xstaff: widget.xstaff,
                                        zemail: widget.zemail,
                                        zid: widget.zid,
                                        adminlate: lateemployee_count,
                                        adminabsent: absentemployee_count,
                                        adminleave: leaveandtouradmin_count,
                                        adminearly: earlyemployee_count,
                                      )));
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoadingHR
                            ? SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Color(0xff064A76),
                                ),
                              )
                            : Text(
                                "Employee HR Approval",
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
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                              builder: (context) => Late_NotificationList(
                                xposition: widget.xposition,
                                xstaff: widget.xstaff,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Personal Late Information",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 5,
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
                              builder: (context) => LeaveTour_NotificationList(
                                  xposition: widget.xposition),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Personal Leave & Tour Information",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                                  Early_Leave_NotificationList(
                                xposition: widget.xposition,
                                xstaff: widget.xstaff,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Personal Early Leave Information",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                              builder: (context) => Absent_NotificationList(
                                  xposition: widget.xposition),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Personal Absent Information",
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
                ],
              ),
            ] else ...[
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                              builder: (context) => Late_NotificationList(
                                xposition: widget.xposition,
                                xstaff: widget.xstaff,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Late Information Details",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                              builder: (context) => LeaveTour_NotificationList(
                                  xposition: widget.xposition),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Leave&Tour Information Details",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                                  Early_Leave_NotificationList(
                                xposition: widget.xposition,
                                xstaff: widget.xstaff,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Early Leave Information Details",
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                              builder: (context) => Absent_NotificationList(
                                  xposition: widget.xposition),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Absent Information Details",
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
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
