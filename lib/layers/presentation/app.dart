import 'package:flutter/material.dart';

import './widgets/clock/clock_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: Column(
                children: [ClockWidget()],
              )),
        ),
      ),
    );
  }
}
