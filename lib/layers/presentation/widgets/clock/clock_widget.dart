library clock;

import 'dart:async';
import 'package:flutter/material.dart';

import '../flipdot_character/flipdot_character_widget.dart';
import './semicolon_widget.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime _dateTime = DateTime.now();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      // Minute timer
      // _timer = Timer(
      //   Duration(minutes: 1) -
      //       Duration(seconds: _dateTime.second) -
      //       Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );

      // Second timer
      _timer = Timer(
        const Duration(seconds: 1) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // hour
    String hour = _dateTime.hour.toString().padLeft(2, '0');
    // minute
    String minute = _dateTime.minute.toString().padLeft(2, '0');
    // second
    String second = _dateTime.second.toString().padLeft(2, '0');

    return Expanded(
      child: Row(
        children: <Widget>[
          Flexible(flex: 2, child: StaticFlipdotCharacter(hour[0])),
          Flexible(flex: 2, child: StaticFlipdotCharacter(hour[1])),
          const Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 2.5 / 7.0,
              child: ClockSemicolonWidget(),
            ),
          ),
          Flexible(flex: 2, child: StaticFlipdotCharacter(minute[0])),
          Flexible(flex: 2, child: StaticFlipdotCharacter(minute[1])),
          const Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 2.5 / 7.0,
              child: ClockSemicolonWidget(),
            ),
          ),
          Flexible(flex: 2, child: StaticFlipdotCharacter(second[0])),
          Flexible(flex: 2, child: StaticFlipdotCharacter(second[1])),
        ],
      ),
    );
  }
}
