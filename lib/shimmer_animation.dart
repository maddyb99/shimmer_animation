library shimmer_animation;

import 'package:flutter/material.dart';
import 'package:shimmer_animation/src/shimmer_animator.dart';

class Shimmer extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool enabled;
  final Duration duration;

  Shimmer({
    @required this.child,
    this.enabled = true,
    this.color = Colors.white,
    this.duration = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    print("enabled: $enabled");
    if (enabled)
      return Stack(
        children: <Widget>[
          child,
          Positioned.fill(
            child: ShimmerAnimator(
              color: color,
              duration: duration,
            ),
          ),
        ],
      );
    else
      return child;
  }
}
