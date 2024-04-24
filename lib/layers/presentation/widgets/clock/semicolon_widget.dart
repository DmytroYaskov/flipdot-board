library clock.semicolon;

import 'package:flutter/material.dart';

class ClockSemicolonWidget extends StatelessWidget {
  const ClockSemicolonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      const Spacer(),
      Flexible(fit: FlexFit.tight, child: _Dot()),
      const Spacer(),
      Flexible(fit: FlexFit.tight, child: _Dot()),
      const Spacer(),
    ]);
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const size = (5 / 7) * 0.9;

    return FractionallySizedBox(
      widthFactor: size,
      heightFactor: size,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
      ),
    );
  }
}
