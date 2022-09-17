import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IllustrationAnimation extends StatelessWidget {
  IllustrationAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// Transition
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: -50.0, end: 0.0),
      delay: Duration(milliseconds: 100),
      duration: Duration(milliseconds: 300),
      builder: (_, animation, _child) => Transform(
        transform: Matrix4.translationValues(
          0,
          animation,
          0,
        ),
        child: _child!,
      ),

      /// Opacity
      child: PlayAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        delay: Duration(milliseconds: 100),
        duration: Duration(milliseconds: 400),
        builder: (_, animation, _child) => Opacity(
          opacity: animation,
          child: _child!,
        ),
        child: child,
      ),
    );
  }
}
