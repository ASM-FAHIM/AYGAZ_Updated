import 'dart:io' show Platform, exit;
import 'package:aygazhcm/data_model/loginModel.dart';
import 'package:aygazhcm/data_model/promotion.dart';
import 'package:aygazhcm/sales/module/controller/cart_controller.dart';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:aygazhcm/sales/module/view/tso_selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'data_model/xyearperdate.dart';
import 'hr/attendance_page.dart';
import 'hr/leave_tour.dart';
import 'hr/notifications/approverNotification/screen/approver.dart';
import 'hr/payslip_page.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  // const Homepage({Key? key}) : super(key: key);
  LoginModel loginModel;

  Homepage({required this.loginModel});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  DateTime now = DateTime.now();
  DateTime notificationTime = DateTime.now();
  String intime = '';
  String outtime = '';
  bool pressAttention = false;
  bool pressAttention1 = false;
  late String _currentAddress = " ";
  late String _currentAddressout = " ";

  Future<List<PromotionModel>>? futurePost;

  Future<void> getLocationin() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      setState(
        () {
          _currentAddress =
              "${place.locality}, ${place.postalCode}, ${place.country}";
        },
      );
    } catch (e) {
      print(e);
    }
  }

  late XbalanceModel leave_remain1;
  String xbalance = " ";

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
        _currentAddressout =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  //for exit the app
  Future<bool?> showWarningContext(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Do you want to exit app?",
            style: TextStyle(color: Color(0xff074974)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text(
                "No",
                style: TextStyle(
                  color: Color(0xff074974),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Color(0xff074974),
                ),
              ),
            ),
          ],
        ),
      );
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    loginController.zauserid.value = widget.loginModel.xposition;
    loginController.xidsup.value = widget.loginModel.xsid;
    loginController.xpreparer.value = widget.loginModel.xstaff;
    print('controller initialize to save : ${loginController.zauserid.value}');
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () async {
            final shouldPop = await showWarningContext(context);
            return shouldPop ?? false;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const Text(""),
              title: Center(
                child: Image.asset(
                  'images/logo/200010.png',
                  height: 40,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xff074974),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.loginModel.xsex == 'Male') ...[
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/male.png'),
                          ),
                        ] else if (widget.loginModel.xsex == 'Female') ...[
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/female.png'),
                          ),
                        ] else ...[
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/male.png'),
                          ),
                        ],
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "${widget.loginModel.xname}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 20,
                                    color: const Color(0xff074974),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  " ${widget.loginModel.xdesignation}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 15,
                                    color: Color(0xff074974),
                                  ),
                                ),
                              ),
                              Text(
                                " ${widget.loginModel.xempcategory}",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.bakbakOne(
                                  // //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xff074974),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                    child: Container(
                      //height: MediaQuery.of(context).size.width/2,
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
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 2.5,
                          width: MediaQuery.of(context).size.width / 2.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(20.0),
                            // ),
                            onPressed: () async {
                              setState(
                                () {
                                  notificationTime = DateTime.now();
                                },
                              );
                              print(notificationTime);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminNotification(
                                    xposition: widget.loginModel.xposition,
                                    xstaff: widget.loginModel.xstaff,
                                    zemail: widget.loginModel.zemail,
                                    zid: "200010",
                                    loginModel: widget.loginModel,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                          'images/notification.png'),
                                      height: 60,
                                      width: 60,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Notification",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 15,
                                        color: Color(0xff074974),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 2.5,
                          width: MediaQuery.of(context).size.width / 2.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AttendanceField(
                                            xstaff: widget.loginModel.xstaff,
                                            xposition:
                                                widget.loginModel.xposition,
                                            xsid: widget.loginModel.xsid,
                                          )));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(FontAwesomeIcons.clipboardCheck,
                                //   size: 60,
                                //   color: Color(0xff4AA0EC),
                                // ),

                                const Image(
                                  image: AssetImage('images/attendance.png'),
                                  height: 60,
                                  width: 60,
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                Text(
                                  "Attendance",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 15,
                                    color: Color(0xff074974),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 2.5,
                          width: MediaQuery.of(context).size.width / 2.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Leave_page(
                                            xposition:
                                                widget.loginModel.xposition,
                                            xstaff: widget.loginModel.xstaff,
                                            xsid: widget.loginModel.xsid,
                                            xbalance: xbalance,
                                            xname: widget.loginModel.xname,
                                            supname: widget.loginModel.supname,
                                          )));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(FontAwesomeIcons.calendarPlus,
                                //   size: 60,
                                //   color: Color(0xff4AA0EC),
                                // ),

                                Image(
                                  image: AssetImage('images/leavetour.png'),
                                  height: 60,
                                  width: 60,
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                Text(
                                  "Leave and Tour",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 15,
                                    color: Color(0xff074974),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        //absence approval part
                        // Container(
                        //   height: MediaQuery.of(context).size.width / 2.5,
                        //   width: MediaQuery.of(context).size.width / 2.65,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     //border: Border.all(color: Colors.grey),
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(0.5),
                        //         spreadRadius: 1,
                        //         blurRadius: 5,
                        //         offset:
                        //             Offset(0, 3), // changes position of shadow
                        //       ),
                        //     ],
                        //   ),
                        //   child: TextButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(20.0)),
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   AbsentApproval_page()));
                        //     },
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         // const Icon(FontAwesomeIcons.calendarMinus,
                        //         //   size: 60,
                        //         //   color: Color(0xff4AA0EC),
                        //         // ),
                        //
                        //         Image(
                        //           image: AssetImage('images/absent.png'),
                        //           height: 60,
                        //           width: 60,
                        //         ),
                        //
                        //         SizedBox(
                        //           height: 10,
                        //         ),
                        //
                        //         Text(
                        //           "Absence Approval",
                        //           textAlign: TextAlign.center,
                        //           style: GoogleFonts.bakbakOne(
                        //             fontSize: 15,
                        //             color: Colors.grey,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        //data sync part
                        // Container(
                        //   height: MediaQuery.of(context).size.width / 2.5,
                        //   width: MediaQuery.of(context).size.width / 2.65,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     //border: Border.all(color: Colors.grey),
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(0.5),
                        //         spreadRadius: 1,
                        //         blurRadius: 5,
                        //         offset:
                        //             Offset(0, 3), // changes position of shadow
                        //       ),
                        //     ],
                        //   ),
                        //   child: TextButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(20.0)),
                        //     onPressed: () {
                        //       //Navigator.push(context, MaterialPageRoute(builder: (context)=>Looptry(xstaff: widget.loginModel.xstaff, xposition: widget.loginModel.xposition, xsid: widget.loginModel.xsid)));
                        //     },
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         // const Icon(Icons.sync,
                        //         //   size: 50,
                        //         //   color: Color(0xff4AA0EC),
                        //         // ),
                        //
                        //         Image(
                        //           image: AssetImage('images/sync.png'),
                        //           height: 60,
                        //           width: 60,
                        //         ),
                        //
                        //         SizedBox(
                        //           height: 20,
                        //         ),
                        //
                        //         Text(
                        //           "Data Sync",
                        //           textAlign: TextAlign.center,
                        //           style: GoogleFonts.bakbakOne(
                        //             fontSize: 15,
                        //             color: Colors.grey,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.width / 2.5,
                          width: MediaQuery.of(context).size.width / 2.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
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
                                      builder: (context) => Payslip_page(
                                            xname: widget.loginModel.xname,
                                            xempbank:
                                                widget.loginModel.xempbank,
                                            xacc: widget.loginModel.xacc,
                                            xstaff: widget.loginModel.xstaff,
                                            xdesignation:
                                                widget.loginModel.xdesignation,
                                          )));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(FontAwesomeIcons.fileAlt,
                                //   size: 60,
                                //   color: Color(0xff4AA0EC),
                                // ),

                                Image(
                                  image: AssetImage('images/payslip.png'),
                                  height: 60,
                                  width: 60,
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                Text(
                                  "Pay Slip",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bakbakOne(
                                    fontSize: 15,
                                    color: Color(0xff074974),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width / 2.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                          Offset(0, 3), // changes position of shadow
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
                                builder: (context) => TsoSelectionScreen()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Icon(FontAwesomeIcons.fileAlt,
                          //   size: 60,
                          //   color: Color(0xff4AA0EC),
                          // ),

                          Image(
                            image: AssetImage('images/payslip.png'),
                            height: 60,
                            width: 60,
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            "Sales",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bakbakOne(
                              fontSize: 15,
                              color: Color(0xff074974),
                            ),
                          )
                        ],
                      ),
                    ),
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


