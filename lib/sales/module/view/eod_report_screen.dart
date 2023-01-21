import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/colors.dart';
import '../../widget/big_text.dart';
import '../../widget/date_container.dart';
import '../model/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EODReportScreen extends StatefulWidget {
  const EODReportScreen({Key? key}) : super(key: key);

  @override
  State<EODReportScreen> createState() => _EODReportScreenState();
}

class _EODReportScreenState extends State<EODReportScreen> {

  /*final List<BarChartDateModel> data = [
    BarChartDateModel(
      chartDate: "Sat",
      chartFinancial: 250,
      chartColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartDateModel(
      chartDate: "Sun",
      chartFinancial: 350,
      chartColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartDateModel(
      chartDate: "Mon",
      chartFinancial: 450,
      chartColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartDateModel(
      chartDate: "Tues",
      chartFinancial: 650,
      chartColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartDateModel(
      chartDate: "Wed",
      chartFinancial: 288,
      chartColor: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartDateModel(
      chartDate: "Thu",
      chartFinancial: 840,
      chartColor: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartDateModel(
      chartDate: "Fri",
      chartFinancial: 560,
      chartColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];*/


  @override
  Widget build(BuildContext context) {
    /*List<charts.Series<BarChartDateModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartDateModel series, _) => series.chartDate,
        measureFn: (BarChartDateModel series, _) => series.chartFinancial,
        colorFn: (BarChartDateModel series, _) => series.chartColor,
      ),
    ];*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        leading: GestureDetector(
          onTap: () {
              Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
            ),
        ),
        title: BigText(
          text: "EOD Report",
          color: AppColor.defWhite,
          size: 25,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LeadOpContainer(name: "Target", loNumber: "BDT 2,00,000",),
                SizedBox(width: 20,),
                LeadOpContainer(name: "Achievement", loNumber: "BDT 1,50,000", color: Colors.green,),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Daily Shop visit :'),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.deepOrangeAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Shops', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('5', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Visited', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('2', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Remain', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('3', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Monthly Shop visit :'),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.deepOrangeAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Shops', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('25', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Visited', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('18', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Remain', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                          Text('7', style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

class LeadOpContainer extends StatelessWidget {
  String name;
  String loNumber;
  Color? color;
  LeadOpContainer({
    Key? key,
    this.color = Colors.deepOrangeAccent,
    required this.name,
    required this.loNumber
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
          Text(loNumber, style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
        ],
      ),
    );
  }
}
