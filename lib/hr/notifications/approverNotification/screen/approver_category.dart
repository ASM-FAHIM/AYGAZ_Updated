import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApproverCategory extends StatefulWidget {
  const ApproverCategory({Key? key}) : super(key: key);

  @override
  State<ApproverCategory> createState() => _ApproverCategoryState();
}

class _ApproverCategoryState extends State<ApproverCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xff064A76),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              "Admin Notifications",
              style: GoogleFonts.bakbakOne(
                fontSize: 20,
                color: Color(0xff074974),
              ),
            ),
          ),
          actions: [
            SizedBox(width: 20,)
          ],
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [


              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white70,
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
                  child: TextButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminNotificationList(xposition: widget.xposition,xstaff: widget.xstaff,zemail: widget.zemail,)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HR Notification*",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Color(0xff064A76),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white70,
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
                  child: TextButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminNotificationList(xposition: widget.xposition,xstaff: widget.xstaff,zemail: widget.zemail,)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Finance Notification*",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bakbakOne(
                            fontSize: 18,
                            color: Color(0xff064A76),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

      ),
    );
  }
}
