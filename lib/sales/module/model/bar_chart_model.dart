import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String month;
  int financial;
  final charts.Color color;

  BarChartModel({
    required this.month,
    required this.financial,
    required this.color,
  });
}


class BarChartDateModel {
  String chartDate;
  int chartFinancial;
  final charts.Color chartColor;

  BarChartDateModel({
    required this.chartDate,
    required this.chartFinancial,
    required this.chartColor,
  });
}