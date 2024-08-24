import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Widget center;
  final Color progressColor;

  const CircularPercentIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.center,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: radius,
          width: radius,
          child: CustomPaint(
            painter: _GradientCircularProgressPainter(
              lineWidth: lineWidth,
              percent: percent,
              gradientColors: [Colors.purple, Colors.deepPurple],
            ),
          ),
        ),
        center,
      ],
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double lineWidth;
  final double percent;
  final List<Color> gradientColors;

  _GradientCircularProgressPainter({
    required this.lineWidth,
    required this.percent,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * percent;

    final gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * math.pi,
      colors: gradientColors,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;


    canvas.drawCircle(size.center(Offset.zero), size.width / 2, backgroundPaint);


    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
