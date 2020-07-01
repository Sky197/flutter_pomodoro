import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTime extends StatefulWidget {
  CustomTime({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CustomTimeState createState() => CustomTimeState();
}

class CustomTimeState extends State<CustomTime> {
  String timeString;

  @override
  void initState() {
    timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(timeString),
      ),
    );
  }

  String getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      timeString = formattedDateTime;
    });
    return timeString;
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
