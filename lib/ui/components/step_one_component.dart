import 'package:flutter/material.dart';
import 'package:web_test/ui/components/space.dart';
import 'package:web_test/ui/helpers/colors.dart';
import 'package:web_test/ui/helpers/size_config.dart';
import 'package:web_test/ui/helpers/text_styles.dart';
import 'package:web_test/ui/responsive_layout.dart';

class TabStep extends StatelessWidget {
  final String stepCount;
  final String stepText;
  final String? image;
  final GlobalKey? widgetKey;
  final double imageScale;
  const TabStep(
      {Key? key,
      required this.image,
       this.widgetKey,
      required this.stepCount,
        required this.imageScale,
      required this.stepText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: ResponsiveLayout.isMobile(context) ? SizeConfig.screenWidth! * 0.06 : SizeConfig.screenWidth! * 0.16,
        ),
        CircleAvatar(
          key: widgetKey,
          radius:ResponsiveLayout.isMobile(context) ? 30 : 60,
          backgroundColor: CustomColors.stepTextBackground,
          child: Text(
            stepCount,
            style: TextStyle(color: CustomColors.stepTextColor,fontSize: ResponsiveLayout.isMobile(context) ? 30 :70),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom:ResponsiveLayout.isMobile(context) ? 20 : 30),
          child: Text(
            stepText,
            style: TextStyle(color: CustomColors.stepTextColor,fontSize: ResponsiveLayout.isMobile(context) ? 12 :18),
          ),
        ),
        ResponsiveLayout.isMobile(context) ? horizontalSpace(30) : horizontalSpace(60),
        Image.asset(
          image!,
          scale: imageScale,
        ),
      ],
    );
  }
}
