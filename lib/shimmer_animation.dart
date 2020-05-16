library shimmeranimation;

import 'package:flutter/material.dart';
import 'package:shimmer_animation/custom_shimmer_animation.dart';

class Shimmer extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool enabled;

  Shimmer({@required this.child, this.enabled:true, this.color});

  @override
  Widget build(BuildContext context) {
    print("enabled: $enabled");
    if (enabled)
      return Stack(
        children: <Widget>[
          child,
          Positioned.fill(child: Animator(color:color)),
        ],
      );
    else
      return child;
  }
}

class Animator extends StatefulWidget{
  final Color color;
  Animator({this.color});
  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator> with TickerProviderStateMixin{
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