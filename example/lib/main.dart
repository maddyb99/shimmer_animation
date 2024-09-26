import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

void main() {
  runApp(const FullPageShimmerExample());
}

class FullPageShimmerExample extends StatelessWidget {
  const FullPageShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatelessWidget {
  const ShimmerPage({super.key});

  final _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 21.0,
      fontWeight: FontWeight.w400
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Shimmer(
              // This is the ONLY required parameter
              duration: const Duration(seconds: 3),
              // This is NOT the default value. Default value: Duration(seconds: 0)
              interval: const Duration(milliseconds: 5),
              // This is the default value
              color: Colors.white,
              // This is the default value
              colorOpacity: 0.3,
              // This is the default value
              enabled: true,
              // This is the default value
              direction: const ShimmerDirection.fromLTRB(),
              // This is the ONLY required parameter
              child: Container(
                color: Colors.deepPurple,
              ),
            )
          ),
          Expanded(
            child: Stack(
              children: [
                Shimmer(
                  duration: const Duration(seconds: 5),
                  beginDelay: const Duration(seconds: 2),
                  mode: ShimmerMode.oneShot,
                  child: Container(
                    color: Colors.deepOrange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("mode: ShimmerMode.oneShot\nbeginDelay: const Duration(seconds: 2)",
                    style: _textStyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
