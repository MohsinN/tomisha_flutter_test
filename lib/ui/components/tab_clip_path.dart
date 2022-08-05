import 'package:flutter/material.dart';

class TabClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/3, size.height
        - 30, size.width/2, size.height-10);
    path.quadraticBezierTo(size.width, size.height,
        size.width, size.height-60);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
