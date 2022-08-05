import 'package:flutter/material.dart';
import 'package:web_test/ui/helpers/colors.dart';
import 'package:web_test/ui/responsive_layout.dart';

class TabBarTitle extends StatelessWidget {
  final String text;

  const TabBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:  TextStyle(
            color: CustomColors.textColor,
            fontSize: ResponsiveLayout.isMobile(context) ? 15 : 35,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
