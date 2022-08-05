import 'package:flutter/material.dart';
import 'package:web_test/ui/helpers/images.dart';

class LeftArrowImage extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const LeftArrowImage({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        CustomImages.leftArrow,
        scale: 3,
      ),
    );
  }
}
