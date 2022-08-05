import 'package:flutter/material.dart';
import 'package:web_test/ui/helpers/images.dart';

class RightArrow extends StatelessWidget {

  const RightArrow({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CustomImages.rightArrow,
      scale: 3,
    );
  }
}
