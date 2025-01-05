import 'package:flutter/material.dart';

class CustomSplashAnimation extends CustomPainter {
  final BuildContext context;
  double position, opacity;
  double width = 0.2;
  final Color color;
  final Alignment begin, end;

  CustomSplashAnimation({
    required this.context,
    required this.position,
    required this.color,
    required this.opacity,
    required this.begin,
    required this.end,
  });

  //Custom Painter to paint one frame of the animation. This is called in a loop to animate
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var stops = [
      0.0,
      position,
      (position + width) > 1 ? 1.0 : position + width,
      (position + (width * 2)) > 1 ? 1.0 : position + (width * 2),
      1.0
    ];
    // position = 0.7;
    paint.style = PaintingStyle.fill;
    paint.shader = LinearGradient(
      tileMode: TileMode.decal,
      begin: begin,
      end: end,
      stops: stops,
      colors: [
        Colors.transparent,
        (color).withValues(alpha: 0.05),
        (color).withValues(alpha: opacity),
        (color).withValues(alpha: 0.05),
        Colors.transparent
      ],
    ).createShader(
      Rect.fromLTRB(
          size.width * -0.5,
          (size.height > size.width) ? 0 : size.height * -0.5,
          size.width * 1.5,
          size.height * 1.5),
    );
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomSplashAnimation oldDelegate) => oldDelegate.position != position;
}
