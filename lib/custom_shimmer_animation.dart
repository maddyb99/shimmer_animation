import 'package:flutter/material.dart';

class CustomSplashAnimation extends CustomPainter {
  final BuildContext context;
  double position;
  double width = 0.3;
  final Color color;

  CustomSplashAnimation({
    @required this.context,
    @required this.position,
    this.color = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
//    position = 0.7;
    paint.style = PaintingStyle.fill;
    paint.shader = LinearGradient(
      tileMode: TileMode.clamp,
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      stops: [position, position + width, position + width + 0.2],
      colors: [
        Colors.transparent,
        (color ?? Colors.white).withOpacity(0.1),
        Colors.transparent
      ],
    ).createShader(
        Rect.fromLTRB(-size.width / 2, 0, size.width * 1.5, size.height));
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
