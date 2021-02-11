library flutter_heart_animation_overlay;

import 'package:flutter/material.dart';

class FlutterHeartAnimationOverlay extends StatefulWidget {
  final Widget Function(BuildContext, void Function()) builder;
  FlutterHeartAnimationOverlay({@required this.builder});
  @override
  _FlutterHeartAnimationOverlayState createState() =>
      _FlutterHeartAnimationOverlayState();
}

class _FlutterHeartAnimationOverlayState
    extends State<FlutterHeartAnimationOverlay> {
  double endAlpha1 = 0;
  double endAlpha2 = 0;
  double endAlpha3 = 0;

  void animateHeart() {
    setState(() {
      endAlpha1 = 255;
      endAlpha2 = 100;
      endAlpha3 = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.builder(context, animateHeart),
        IgnorePointer(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: endAlpha1),
            duration: Duration(milliseconds: 200),
            onEnd: () => setState(() => endAlpha1 = 0),
            builder: (ctx, alpha, child) {
              return Center(
                child: Icon(
                  Icons.favorite_rounded,
                  size: 100,
                  color: Colors.pink.withAlpha(alpha.round()),
                ),
              );
            },
          ),
        ),
        IgnorePointer(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: endAlpha2),
            duration: Duration(milliseconds: 200),
            onEnd: () => setState(() => endAlpha2 = 0),
            builder: (ctx, alpha, child) => Center(
              child: Icon(
                Icons.favorite_rounded,
                size: 200,
                color: Colors.pink.withAlpha(alpha.round()),
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: endAlpha3),
            duration: Duration(milliseconds: 150),
            onEnd: () => setState(() => endAlpha3 = 0),
            builder: (ctx, alpha, child) => Center(
              child: Icon(
                Icons.favorite_rounded,
                size: 300,
                color: Colors.pink.withAlpha(alpha.round()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
