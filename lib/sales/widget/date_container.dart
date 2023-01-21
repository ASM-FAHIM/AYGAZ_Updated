import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';

class DateContainer extends StatelessWidget {
  DateTime now = DateTime.now();
  String date = DateFormat.yMMMEd().format(DateTime.now());
  String time = DateFormat.jms().format(DateTime.now());

  DateContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white
          // gradient: const LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xff0AB8CE),
          //       Color(0xff4E6B9E),
          //     ]),
        ),
        child: Center(
          child: BigText(text: date)
        ),
      ),
    );
  }
}