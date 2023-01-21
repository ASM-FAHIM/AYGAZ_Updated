import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  //parameterized constructor
  BigText({
    Key? key,
    //we can't use default color name from appColor class because this is also a constant widget,
    //So it's better to use hexadecimal color for anyConstant widget or class instead of constant name.
    this.color = Colors.black,
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: GoogleFonts.roboto(
        // fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: size == 0 ? Dimensions.fontBigS20 : size,
      ),
    );
  }
}
