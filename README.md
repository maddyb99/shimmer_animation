# shimmer_animation

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)

This is a new shimmer animation widget that can help you bring simple yet beautiful animations to your project with ease.

## How to use

Add `shimmer_animation` to `pubspec.yaml` of your project:

```yaml
dependencies:
  shimmer_animation: ^0.0.4
```

Import it in your Dart code:

```dart
import 'package:shimmer_animation/shimmer_animation.dart';
```

Wrap any widget with `Shimmer()` widget to apply animaton:

```dart
  Shimmer(
    duration: Duration(seconds: 3), //Default value
    color: Colors.white, //Default value
    enabled: true, //Default value
    direction: ShimmerDirection.fromLTRB(),  //Default Value
    child: Container(
      color: Colors.deepPurple,
    ),
  ),
```

A preview of this:

![Shimmer Animation](https://github.com/maddyb99/shimmer_animation/blob/master/screenshots/shimmer.gif)

## License

[MIT License](https://github.com/maddyb99/shimmer_animation/blob/master/LICENSE).
