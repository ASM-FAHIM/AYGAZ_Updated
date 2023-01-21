import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/module/controller/dashboard_controller.dart';
import 'package:aygazhcm/sales/module/controller/login_controller.dart';
import 'package:aygazhcm/sales/module/view/notification_screen.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import '../../widget/cus_drawer.dart';
import 'package:get/get.dart';
import '../model/bar_chart_model.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  LoginController loginController = Get.find<LoginController>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer timer;

  final List<BarChartModel> data = [
    BarChartModel(
      month: "Jan",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      month: "Feb",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      month: "Mar",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      month: "April",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      month: "May",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      month: "Jun",
      financial: 950,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      month: "July",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.getInvoiceInfo(loginController.data!.xsp);
    timer = Timer.periodic(const Duration(minutes: 10), (timer) {
    // Call the method that you want to run every 5 seconds
      loginController.periodicallyLocationTracking();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.month,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CusDrawer(),
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.menu_outlined,
              size: 40,
            ),
          ),
          actions: [
            Obx(() => GestureDetector(
                  onTap: () {
                    dashboardController
                        .getProductInfo(loginController.data!.xsp, loginController.data!.xsubcat);
                  },
                  child: dashboardController.isLoading3.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.defWhite,
                          ),
                      )
                      : const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            MdiIcons.syncIcon,
                            size: 30,
                          ),
                      ),
            ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Obx(
                     () => Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            dashboardController.checkFunction();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: dashboardController.isPressed.value
                                  ? Colors.red
                                  : Colors.green),
                          child: dashboardController.givingAtt.value
                            ? Center(child: CircularProgressIndicator(color: Colors.white,),)
                            : Text(dashboardController.isPressed.value
                              ? 'Check out'
                              : 'Check In'),
                        ),
                     )
                  ),
                  SizedBox(height: 20,),
                  // Obx(() =>  Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     BigText(text: 'Monthly Statistics :'),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     dashboardController.isFetched.value
                  //         ? CircularProgressIndicator()
                  //         : InvDeliQtyContainer(
                  //       subject: 'Invoice Amount',
                  //       quantity: '${dashboardController.invoiceModel!.xnetamt}',
                  //     ),
                  //     /*SizedBox(
                  //       height: 20,
                  //     ),
                  //     InvDeliQtyContainer(
                  //       subject: 'Delivered Amount',
                  //       quantity: 'BDT 15398.75',
                  //     ),*/
                  //     SizedBox(
                  //       height: 40,
                  //     ),
                  //   ],
                  // )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Monthly Sales Chart : '),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width:  MediaQuery.of(context).size.width / 1.10,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: charts.BarChart(
                          series,
                          animate: true,
                        ),
                      )
                    ],
                  ),
                 /* Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Daily Statistics :'),
                      const SizedBox(
                        height: 20,
                      ),
                      InvDeliQtyContainer(
                        subject: "Today's Invoice Amount",
                        quantity: 'BDT 18652.25',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InvDeliQtyContainer(
                        subject: "Today's Delivered Amount",
                        quantity: 'BDT 15398.75',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: const Icon(MdiIcons.bellRing, size: 30,),
          onPressed: (){
            Get.to(() => const NotificationScreen());
          },
        ),
      ),
    );
  }
}
