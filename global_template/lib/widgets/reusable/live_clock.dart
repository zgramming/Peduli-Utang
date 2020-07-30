import 'dart:async';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:intl/date_symbol_data_local.dart';

class LiveClock extends StatefulWidget {
  final TextStyle textStyle;
  LiveClock({this.textStyle});
  @override
  _LiveClockState createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  Stream<DateTime> liveClock;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    liveClock = Stream<DateTime>.periodic(const Duration(seconds: 1), (_) {
      return DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: liveClock,
      initialData: DateTime.now(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          return RichText(
            text: TextSpan(
                text: globalF.formatYearMonthDaySpecific(DateTime.now(), type: 3),
                style: widget.textStyle ?? TextStyle(color: colorPallete.black),
                children: [
                  TextSpan(text: ' ${globalF.formatHoursMinutes(snapshot.data)}'),
                ]),
            textAlign: TextAlign.center,
          );
        }
        return Text(
            '${globalF.formatYearMonthDaySpecific(DateTime.now())} ${globalF.formatHoursMinutes(DateTime.now())}');
      },
    );
  }
}
