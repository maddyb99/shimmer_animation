import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shimmer_animation/src/custom_shimmer_animation.dart';
import 'package:shimmer_animation/src/shimmer_mode.dart';

class ShimmerAnimator extends StatefulWidget {
  final Color color;
  final double opacity;
  final Duration duration;
  final Duration interval;
  final Duration beginDelay;
  final ShimmerDirection direction;
  final ShimmerMode mode;
  final Widget child;

  ShimmerAnimator({
    required this.child,
    required this.color,
    required this.opacity,
    required this.duration,
    required this.interval,
    required this.beginDelay,
    required this.direction,
    required this.mode,
  });

  @override
  State<ShimmerAnimator> createState() => _ShimmerAnimatorState();
}

//Animator state controls the animation using all the parameters defined
class _ShimmerAnimatorState extends State<ShimmerAnimator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Timer? timer;
  late bool isRepeat;

  @override
  void initState() {
    super.initState();
    isRepeat = widget.mode == ShimmerMode.repeat;

    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.6, curve: Curves.decelerate),
    ))
      ..addListener(animationEventListener);
    Future.delayed(widget.beginDelay, () => controller.forward(),);
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationEventListener)
      ..dispose();
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.isAnimating ? CustomPaint(
      foregroundPainter: CustomSplashAnimation(
        context: context,
        position: animation.value,
        color: widget.color,
        opacity: widget.opacity,
        begin: widget.direction.begin,
        end: widget.direction.end,
      ),
      child: widget.child,
    ) : widget.child;
  }

  void animationEventListener() {
    if (controller.isCompleted) {
      if (isRepeat) {
        timer = Timer(widget.interval,
                () => mounted ? controller.forward(from: 0) : null);
      }
    }
    setState(() {});
  }
}
