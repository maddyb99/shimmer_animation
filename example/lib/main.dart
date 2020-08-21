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
        duration: Duration(seconds: 3),
        //Default value
        color: Colors.white,
        //Default value
        enabled: true,
        //Default value
        direction: ShimmerDirection.fromLTRB(),
        //Default Value
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
