library shimmer_animation;

import 'package:flutter/material.dart';
import 'package:shimmer_animation/src/shimmer_animator.dart';

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

  //Stacks the animation over the child if animation is enabled
  @override
  Widget build(BuildContext context) {
    if (enabled)
      return Stack(
        children: <Widget>[
          child,
          Positioned.fill(
            child: ShimmerAnimator(
              color: color,
              duration: duration,
              direction: direction,
            ),
          ),
        ],
      );
    else
      return child;
  }
}

class ShimmerDirection{
  final Alignment begin,end;

  const ShimmerDirection._fromLTRB({this.begin=Alignment.topLeft,
    this.end=Alignment.bottomRight,});

  const ShimmerDirection._fromRTLB({this.begin=Alignment.centerRight,
    this.end=Alignment.topLeft,});

  const ShimmerDirection._fromLBRT({this.begin=Alignment.bottomLeft,
    this.end=Alignment.centerRight,});

  const ShimmerDirection._fromRBLT({this.begin=Alignment.topRight,
    this.end=Alignment.centerLeft,});

  const ShimmerDirection._fromLeftToRight({this.begin=Alignment.centerLeft,
  this.end=Alignment.centerRight,});

  const ShimmerDirection._fromRightToLeft({this.begin=Alignment.centerLeft,
  this.end=Alignment.centerRight,});

  factory ShimmerDirection(){
    var temp= ShimmerDirection._fromLTRB();
    return temp;
  }

  const factory ShimmerDirection.fromLTRB()=ShimmerDirection._fromLTRB;

  const factory ShimmerDirection.fromRTLB()=ShimmerDirection._fromRTLB;

  const factory ShimmerDirection.fromLBRT()=ShimmerDirection._fromLBRT;

  const factory ShimmerDirection.fromRBLT()=ShimmerDirection._fromRBLT;

  const factory ShimmerDirection.fromLeftToRight()=ShimmerDirection._fromLeftToRight;

  const factory ShimmerDirection.fromRightToLeftt()=ShimmerDirection._fromRightToLeft;

}
