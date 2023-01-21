import 'package:flutter/material.dart';
import 'package:aygazhcm/home_page.dart';


class ViewNotification extends StatefulWidget {
  //const ViewNotification({Key? key}) : super(key: key);

  String details;
  ViewNotification({required this.details});

  @override
  _ViewNotificationState createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification Details'),
          backgroundColor: Color(0xFF8CA6DB),
        ),
        body: Center(
          child: Container(
            child: Text(widget.details),
          ),
        ),
      ),
    );
  }
}