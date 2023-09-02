import 'dart:math';

import 'package:flutter/material.dart';

class SegmentedCircle extends StatelessWidget {
  const SegmentedCircle({
    required this.colors,
    required this.segmentAngles,
    required this.vals,
    this.radius = 50,
  });

  final List<Color> colors;
  final List<num> segmentAngles;
  final List<String> vals;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<Widget> segments = [];

        final num totalAngle =
            segmentAngles.reduce((value, element) => value + element);

        if (totalAngle == 0) {
          return Container();
        }

        double startAngle = -pi / 2;

        for (int i = 0; i < colors.length; i++) {
          final angle = (2 * pi) * (segmentAngles[i] / totalAngle);
          segments.add(
            SizedBox(
              width: radius * 2,
              height: radius * 2,
              child: CustomPaint(
                painter: _CircleSegmentPainter(
                  color: colors[i],
                  startAngle: startAngle,
                  sweepAngle: angle,
                  radius: radius,
                  text: vals[i],
                ),
              ),
            ),
          );
          startAngle += angle;
        }
        return Stack(
          children: segments,
        );
      },
    );
  }
}

class _CircleSegmentPainter extends CustomPainter {
  _CircleSegmentPainter({
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
    required this.radius,
    required this.text,
  });
  final Color color;
  final double startAngle;
  final double sweepAngle;
  final double radius;
  final String text;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      true,
      paint,
    );

    if (sweepAngle > 0.33) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final textCenter = center +
          Offset(
            (radius * 0.55) * cos(startAngle + sweepAngle / 2),
            (radius * 0.55) * sin(startAngle + sweepAngle / 2),
          ) -
          Offset(textPainter.width / 2, textPainter.height / 2);
      textPainter.paint(canvas, textCenter);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
