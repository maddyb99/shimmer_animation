import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

void main() {
  testWidgets('Shimmer() can be constructed', (tester) async {
    await tester.pumpWidget(
      Shimmer(
        child: Container(),
      ),
    );
  });
}
