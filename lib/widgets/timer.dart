import 'dart:async';

import 'package:flutter/material.dart';
import 'package:single_house/utils/duration_format.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    required this.startDateTime,
    required this.textStyle,
  }) : super(key: key);

  final DateTime startDateTime;
  final TextStyle textStyle;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;

  Widget buildText() {
    DateTime startDateTime = widget.startDateTime;
    String time = DateTime.now().difference(startDateTime).toHms();

    return Center(
      child: Text(
        time,
        style: widget.textStyle,
      ),
    );
  }

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildText();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
