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
        // This is the ONLY required parameter
        child: Container(
          color: Colors.deepPurple,
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
    );
  }
}
