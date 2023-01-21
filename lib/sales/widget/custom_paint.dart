import 'package:flutter/material.dart';
import 'package:aygazhcm/sales/widget/small_text.dart';

import 'big_text.dart';
import 'circle_progress.dart';
class ReusablePaint extends StatelessWidget {
  double progress;
  String figure;

  ReusablePaint({Key? key, required this.progress, required this.figure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 130.0,
            height: 150.0,
            child: CustomPaint(
              painter: CircleProgress(
                progress: progress,
                startColor: Colors.blue,
                endColor: Colors.red,
                width: 8.0,
              ),
              child: Center(child: BigText(text: '$progress %',)),
            ),
          ),

          // SizedBox(height: 10,),

          SmallText(text: figure, color: Colors.black, size: 12,),
        ],
      ),
    );
  }
}