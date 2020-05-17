# shimmer_animation

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)

This is a new shimmer animation widget that can help you bring simple yet beautiful animations to your project with ease.

A preview of this:

![Shimmer Animation](https://github.com/maddyb99/shimmer_animation/blob/master/screenshots/shimmer.gif)

## How to use

Add `shimmer_animation` to `pubspec.yaml` of your project:

```yaml
dependencies:
  shimmer_animation: ^0.0.3
```

Import it in your Dart code:

```dart
import 'package:shimmer_animation/shimmer_animation.dart';
```

Wrap any widget with `Shimmer()` widget to apply animaton:

```dart
Shimmer(
  color: Colors.black,
  child: Container(
    color: Colors.red,
  ),
),
```

## License

[MIT License](https://github.com/maddyb99/shimmer_animation/blob/master/LICENSE).
