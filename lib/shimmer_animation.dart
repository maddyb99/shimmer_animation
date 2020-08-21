library shimmer_animation;

import 'package:flutter/material.dart';
import 'package:shimmer_animation/src/shimmer_animator.dart';

/// Creates simple yet beautiful shimmer animations
///
/// This widget is easily customizable to configure some basic and advance aspects of itself
///
/// By default, the widget will select the preset config but it can be easily customized
///
/// required [child] : accepts a child [Widget] over which the animation is to be displayed
/// [color] : accepts a parameter of type [Color] and sets the color of the animation overlay. Default value is [Colors.white]
/// [enabled] : accepts a [bool] toggles animation. Default value is [true]
/// [duration] : accepts a [Duration] that would be the time period of animation. Default value is [Duration(seconds: 3)]
/// [direction] : accepts a [ShimmerDirection] and aligns the animation accordingly. Default value is [ShimmerDirection.fromLBRT()]
class Shimmer extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool enabled;
  final Duration duration;
  final ShimmerDirection direction;

  Shimmer({
    @required this.child,
    this.enabled = true,
    this.color = Colors.white,
    this.duration = const Duration(seconds: 3),
    this.direction = const ShimmerDirection.fromLTRB(),
  });

  @override
  Widget build(BuildContext context) {
    if (enabled)
      return ShimmerAnimator(
        child: child,
        color: color,
        duration: duration,
        direction: direction,
      );
    else
      return child;
  }
}

/// A direction along which the shimmer animation will travel
///
///
/// Shimmer animation can travel in 6 possible directions:
///
/// Diagonal Directions:
/// 1. [ShimmerDirection.fromLTRB] : animation starts from Left Top and moves towards the Right Bottom. This is also the default behaviour if no direction is specified.
/// 2. [ShimmerDirection.fromRTLB] : animation starts from Right Top and moves towards the Left Bottom
/// 3. [ShimmerDirection.fromLBRT] : animation starts from Left Bottom and moves towards the Right Top
/// 4. [ShimmerDirection.fromRBLT] : animation starts from Right Bottom and moves towards the Left Top
///
/// Directions along the axes:
/// 5. [ShimmerDirection.fromLeftToRight] : animation starts from Left Center and moves towards the Right Center
/// 5. [ShimmerDirection.fromRightToLeft] : animation starts from Right Center and moves towards the Left Center
class ShimmerDirection {
  final Alignment begin, end;

  const ShimmerDirection._fromLTRB({
    this.begin = Alignment.topLeft,
    this.end = Alignment.centerRight,
  });

  const ShimmerDirection._fromRTLB({
    this.begin = Alignment.centerRight,
    this.end = Alignment.topLeft,
  });

  const ShimmerDirection._fromLBRT({
    this.begin = Alignment.bottomLeft,
    this.end = Alignment.centerRight,
  });

  const ShimmerDirection._fromRBLT({
    this.begin = Alignment.topRight,
    this.end = Alignment.centerLeft,
  });

  const ShimmerDirection._fromLeftToRight({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });

  const ShimmerDirection._fromRightToLeft({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });

  factory ShimmerDirection() => ShimmerDirection._fromLTRB();

  /// Animation starts from Left Top and moves towards the Right Bottom
  const factory ShimmerDirection.fromLTRB() = ShimmerDirection._fromLTRB;

  /// Animation starts from Right Top and moves towards the Left Bottom
  const factory ShimmerDirection.fromRTLB() = ShimmerDirection._fromRTLB;

  /// Animation starts from Left Bottom and moves towards the Right Top
  const factory ShimmerDirection.fromLBRT() = ShimmerDirection._fromLBRT;

  /// Animation starts from Right Bottom and moves towards the Left Top
  const factory ShimmerDirection.fromRBLT() = ShimmerDirection._fromRBLT;

  /// Animation starts from Left Center and moves towards the Right Center
  const factory ShimmerDirection.fromLeftToRight() =
      ShimmerDirection._fromLeftToRight;

  /// Animation starts from Right Center and moves towards the Left Center
  const factory ShimmerDirection.fromRightToLeft() =
      ShimmerDirection._fromRightToLeft;
}
