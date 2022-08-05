import 'package:flutter/material.dart';

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    path.cubicTo(
        size.height - size.width,
        2 * size.height,
        size.height - size.width,
        size.height / 1,
        size.width,
        size.width / 12 + size.height / 2);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
