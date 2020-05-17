import 'package:flutter/material.dart';
import 'package:shimmer_animation/src/custom_shimmer_animation.dart';

class ShimmerAnimator extends StatefulWidget {
  final Color color;
  ShimmerAnimator({this.color});
  @override
  _ShimmerAnimatorState createState() => _ShimmerAnimatorState();
}

class _ShimmerAnimatorState extends State<ShimmerAnimator>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Duration duration;

  @override
  void initState() {
    super.initState();
    duration = Duration(milliseconds: 3000);
    controller = AnimationController(vsync: this, duration: duration);
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.6, curve: Curves.decelerate)))
      ..addListener(() async {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomSplashAnimation(
        context: context,
        position: animation.value,
        color: widget.color,
      ),
      child: Container(),
    );
  }
}
