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
    return Scaffold(
      body: Shimmer(
        //Default value
        duration: Duration(seconds: 3),
        //Default value: Duration(seconds: 0)
        interval: Duration(seconds: 5),
        //Default value
        color: Colors.white,
        //Default value
        enabled: true,
        //Default value
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
