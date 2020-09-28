import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CurrentTimeText extends StatefulWidget {
  @override
  _CurrentTimeTextState createState() {
    return _CurrentTimeTextState();
  }
}

class _CurrentTimeTextState extends State<CurrentTimeText> {
  String _timeString;
  Timer timer;
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_timeString),
    );
  }
}
