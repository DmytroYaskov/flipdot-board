library flipdot_character;

import 'package:flutter/material.dart';

import './flipdot_symbols.dart';

class StaticFlipdotCharacter extends StatelessWidget {
  final String character;

  const StaticFlipdotCharacter(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 5.0 / 7.0,
        child: CustomPaint(
          painter: FlipDotPainter(character),
        ));
  }
}

class FlipDotPainter extends CustomPainter {
  final String character;
  final Paint onDotPaint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.fill;
  final Paint offDotPaint = Paint()
    ..color = Colors.grey.shade900
    ..style = PaintingStyle.fill;

  static const int dotWidth = 5;
  static const int dotHeight = 7;

  static const double dotPadding = 0.1;

  FlipDotPainter(this.character);

  @override
  void paint(Canvas canvas, Size size) {
    double dotSpacing = size.width / dotWidth;

    var characterToDraw =
        flipDotSymbols[character] ?? flipDotSymbols['undefined'];

    for (int row = 0; row < dotHeight; row++) {
      for (int col = 0; col < dotWidth; col++) {
        Offset position = Offset(col * dotSpacing + dotSpacing / 2,
            row * dotSpacing + dotSpacing / 2);
        double dotRadius = (dotSpacing * (1.0 - dotPadding)) / 2;

        bool drawDot = characterToDraw?[row][col] == 1;

        canvas.drawCircle(
            position, dotRadius, drawDot ? onDotPaint : offDotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(FlipDotPainter oldDelegate) {
    return oldDelegate.character != character;
  }
}
