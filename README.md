# Shimmer Animation

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)
![Libraries.io dependency status for latest release](https://img.shields.io/librariesio/release/pub/shimmer_animation)
![License](https://img.shields.io/github/license/maddyb99/shimmer_animation)
[![Null Safety](https://img.shields.io/badge/Null%20Safety-Supported-green)](https://dart.dev/null-safety)

Shimmer Animation provides a simple and customizable widget to create **skeleton loaders** and **placeholder effects** with ease.  
It works seamlessly across **Android**, **iOS**, and **Web**, helping developers improve the loading experience while focusing on core functionality.

## Table of Contents

-   [Why use this package?](#-why-use-this-package)
-   [Examples](#-examples)
-   [Installation](#-installation)
-   [Quick Start](#-quick-start)
-   [Contributing](#-contributing)
-   [License](#-license)

---

## ✨ Why use this package?

- Lightweight and easy to use  
- Highly customizable (duration, interval, direction, color, opacity)  
- Works across **Flutter mobile**, **web** and **desktop**
- Perfect for **skeleton loaders** and **placeholder UIs**  

## 📸 Examples

- Full project example: [`example/`](./example)  
- More detailed usage demos: [Shimmer Examples Repository](https://github.com/maddyb99/shimmer_examples)

| Full Screen | Loading Widgets | Loading Buttons |
|-------------|-----------------|-----------------|
| <img height="400" src="https://github.com/maddyb99/shimmer_animation/blob/master/screenshots/shimmer.gif?raw=true"> | <img height="400" src="https://github.com/maddyb99/shimmer_examples/blob/master/loading_cards/screenshots/shimmer.gif?raw=true"> | <img height="400" src="https://github.com/maddyb99/shimmer_examples/blob/master/buttons/screenshots/shimmer.gif?raw=true"> |

## 📦 Installation

To add `shimmer_animation` to your project, add the following dependency to your `pubspec.yaml` file:

  ```yaml
  dependencies:
    shimmer_animation: ^2.1.0
  ```
Then, run `flutter pub get` to install the package.

## 🚀 Quick Start

1. Import Package

  ```dart
  import 'package:shimmer_animation/shimmer_animation.dart';
  ```
2. Wrap Any Widget

  ```dart
  Shimmer(
    child: Container(
      color: Colors.deepPurple,
    ),
  )
  ```

## ⚙️ Customization

The Shimmer widget exposes several parameters to control the animation:

  ```dart
  Shimmer(
      // The widget over which the animation is to be displayed.
      required Widget child,
      
      // The duration of a single animation cycle.
      // Default is Duration(seconds: 3).
      Duration duration = const Duration(seconds: 3),
    
      // The interval between repeating animation cycles.
      // Default is Duration(seconds: 0).
      Duration interval = const Duration(seconds: 0),
    
      // The color of the animation overlay.
      // Default is Colors.white.
      Color color = Colors.white,
    
      // The opacity of the animation overlay color.
      // Default is 0.3.
      double colorOpacity = 0.3,
    
      // Toggles the animation on or off.
      // Default is true.
      bool enabled = true,
    
      // The direction of the animation.
      // Default is ShimmerDirection.fromLTRB().
      ShimmerDirection direction = const ShimmerDirection.fromLTRB(),
  )
  ```

📚 A complete API reference can be found [here](https://pub.dev/documentation/shimmer_animation/latest/shimmer_animation/)

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📄 License

This project is licensed under the [MIT License](./LICENSE)
