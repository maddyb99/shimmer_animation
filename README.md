# Shimmer Animation

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)
![Libraries.io dependency status for latest release](https://img.shields.io/librariesio/release/pub/shimmer_animation)
![License](https://img.shields.io/github/license/maddyb99/shimmer_animation)

This is a new shimmer animation widget that can help you bring simple yet beautiful animations to your project with ease.

## Examples

An example can be found in the example directory of this repository.

A list of detailed examples can be found in this [Examples Repository](https://github.com/maddyb99/shimmer_examples)

|  Full Screen |  Individual Widgets |
|---|---|
|<img  height="500" src="https://github.com/maddyb99/shimmer_animation/blob/master/screenshots/shimmer.gif">| <img height="500" src="https://github.com/maddyb99/shimmer_examples/blob/master/loading_cards/screenshots/shimmer.gif?raw=true">|

## How to use

Add `shimmer_animation` to `pubspec.yaml` of your project:

```yaml
dependencies:
  shimmer_animation: ^0.0.9
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

## License

[MIT License](https://github.com/maddyb99/shimmer_animation/blob/master/LICENSE).

[Examples]: #examples

