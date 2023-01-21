import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({Key? key, required this.text, this.imgPath = 'assets/images/box.png'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.22,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03,),
        Text(
          text,
          style: GoogleFonts.urbanist(fontSize: MediaQuery.of(context).size.height * 0.0275,
              color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}