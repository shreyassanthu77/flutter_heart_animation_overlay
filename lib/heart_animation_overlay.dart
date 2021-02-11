library heart_animation_overlay;

import 'package:flutter/material.dart';

class HeartAnimationOverlay extends StatefulWidget {
  final Widget Function(BuildContext, void Function()) childBuilder;
  HeartAnimationOverlay({@required this.childBuilder});
  @override
  _HeartAnimationOverlayState createState() => _HeartAnimationOverlayState();
}

class _HeartAnimationOverlayState extends State<HeartAnimationOverlay> {
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
        widget.childBuilder(context, animateHeart),
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
