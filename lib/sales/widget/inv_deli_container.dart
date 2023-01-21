import 'package:aygazhcm/sales/widget/small_text.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimensions.dart';
import 'big_text.dart';


class InvDeliQtyContainer extends StatelessWidget {
  String subject;
  String quantity;
  String imgPath;
  InvDeliQtyContainer({
    required this.subject,
    required this.quantity,
    this.imgPath = 'assets/images/circle.png',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8.5,
      width: MediaQuery.of(context).size.width / 1.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset.zero, // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CircleAvatar(
              backgroundColor: AppColor.defWhite,
              backgroundImage: AssetImage(
                imgPath,
              ),
              radius: Dimensions.radius20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: subject, size: 20,),
              SizedBox(),
              SmallText(text: quantity, size: 15,),
            ],
          ),
        ],
      ),
    );
  }
}