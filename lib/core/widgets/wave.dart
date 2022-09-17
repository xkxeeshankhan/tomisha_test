import 'package:flutter/material.dart';

/// @{template}
/// [Wave1] used custom clip, to createa wave structure for the bottom side.
/// @{endTemplate}
class Wave1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
      size.width / 4,
      size.height,
      3 * size.width / 4,
      size.height * .75,
      size.width,
      size.height * 0.85,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// @{template}
/// [Wave2] used custom clip, to create wave structure for the top side.
/// @{endTemplate}
class Wave2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .15);

    path.cubicTo(
      size.width * .25,
      0,
      size.width * .5,
      size.height * .2,
      size.width,
      size.height * .1,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// @{template}
/// [Wave3] used custom clip, to create wave structure for the bottom side.
/// @{endTemplate}
class Wave3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .78);
    path.cubicTo(
      size.width * .4,
      size.height * .82,
      size.width * .8,
      size.height,
      size.width,
      size.height * .75,
    );
    path.lineTo(size.width, size.height * .7);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
