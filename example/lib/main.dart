import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

void main() {
  runApp(FullPageShimmerExample());
}

class FullPageShimmerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          Shimmer(
            // This is the ONLY required parameter
            child: Container(
              color: Colors.deepPurple,
              height: 200,
              width: 200,
            ),
            // This is the default value
            duration: Duration(seconds: 3),
            // This is NOT the default value. Default value: Duration(seconds: 0)
            interval: Duration(seconds: 5),
            // This is the default value
            color: Colors.white,
            // This is the default value
            colorOpacity: 0.3,
            // This is the default value
            enabled: true,
            // This is the default value
            direction: ShimmerDirection.fromLTRB(),
          ),
          SizedBox(
            height: 20,
          ),
          _delayExample(),
          SizedBox(
            height: 20,
          ),
          _clipperExample(),
        ]),
      )),
    ));
  }

  Widget _delayExample() {
    return Column(children: [
      Text("Using delay"),
      Shimmer(
        child: ElevatedButton(
          child: Text("1 sec delay"),
          onPressed: () {},
        ),
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        direction: ShimmerDirection.fromLTRB(),
        delay: Duration(seconds: 1),
      ),
      Shimmer(
        child: ElevatedButton(
          child: Text("2 sec delay"),
          onPressed: () {},
        ),
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        direction: ShimmerDirection.fromLTRB(),
        delay: Duration(seconds: 2),
      ),
    ]);
  }

  Widget _clipperExample() {
    return Row(children: [
      Expanded(
          child: Column(children: [
        Text("Without Clippers"),
        Padding(
          child: Shimmer(
            child: ElevatedButton(
              child: Text("Rounded Rectangle"),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  // if you don't set [tapTargetSize] to shrinkWrap there will be extra margins
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
            color: Colors.red,
            interval: Duration(milliseconds: 200),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Padding(
          child: Shimmer(
            child: Container(
              child: Center(child: Text("Circle")),
              width: 60,
              height: 60,
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            color: Colors.red,
            interval: Duration(milliseconds: 200),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Shimmer(
          child: Container(
              child: CustomPaint(
                painter: CustomShapePainter(),
              ),
              width: 100,
              height: 100),
          color: Colors.yellow,
          interval: Duration(milliseconds: 200),
        )
      ])),
      Expanded(
          child: Column(children: [
        Text("With Clippers"),
        Padding(
          child: ClipRRect(
            child: Shimmer(
              child: ElevatedButton(
                child: Text("Rounded Rectangle"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // if you don't set [tapTargetSize] to shrinkWrap there will be extra margins
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              color: Colors.red,
              interval: Duration(milliseconds: 200),
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Padding(
          child: ClipOval(
              child: Shimmer(
            child: Container(
              child: Center(child: Text("Circle")),
              width: 60,
              height: 60,
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            color: Colors.red,
            interval: Duration(milliseconds: 200),
          )),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        ClipPath(
          child: Shimmer(
            child: Container(
                child: CustomPaint(
                  painter: CustomShapePainter(),
                ),
                width: 100,
                height: 100),
            color: Colors.yellow,
            interval: Duration(milliseconds: 200),
          ),
          clipper: CustomShapeClipper(),
        )
      ]))
    ]);
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(customPath(size), Paint()..color = Colors.cyan);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return customPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Path customPath(Size size) {
  return Path()
    ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.height / 2))
    ..addOval(Rect.fromCenter(
        center: Offset(3 * size.width / 4, size.height / 2),
        width: size.width / 3,
        height: size.height / 3))
    ..addOval(Rect.fromCenter(
        center: Offset(size.width / 4, size.height / 2),
        width: size.width / 3,
        height: size.height / 3));
}
