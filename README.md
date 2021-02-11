# Flutter Heart Animation Overlay

A simple flutter plugin to add instagram like heart animation overlay to your app

## installing

in your pubspec.yaml add

```yaml
dependencies:
  flutter_heart_animation_overlay:
    git: https://github.com/shreyassanthu77/flutter_heart_animation_overlay
```

## usage

import the package

```dart
import 'package:flutter_heart_animation_overlay/heart_animation_overlay.dart'
```

use the package

```dart
FlutterHeartAnimationOverlay(
    builder: (BuildContext context, void Function() animateHeart) {
        return Container(
            child: ElevatedButton(
                child: Text("Like..."),
                onPressed: () {
                    animateHeart();
                }
            )
        );
    }
)
```
