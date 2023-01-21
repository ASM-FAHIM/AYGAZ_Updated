import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  //parameterized constructor
  SmallText({
    Key? key,
    //we can't use default color name from appColor class because this is also a constant widget,
    //So it's better to use hexadecimal color for anyConstant widget or class instead of constant name.
    this.color = Colors.black,
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
        height: height,
      ),
    );
  }
}
