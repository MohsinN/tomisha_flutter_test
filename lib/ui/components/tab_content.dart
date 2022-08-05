import 'package:flutter/material.dart';
import 'package:web_test/ui/components/space.dart';
import 'package:web_test/ui/helpers/size_config.dart';
import 'package:web_test/ui/responsive_layout.dart';

class TabContent extends StatelessWidget {
  final Widget title;
  final Widget stepOne;
  final Widget stepTwo;
  final Widget arrowImage;
  final Widget rightArrow;
  final Widget stepThree;

  const TabContent(
      {Key? key,
      required this.title,
      required this.stepOne,
      required this.rightArrow,
      required this.arrowImage,
      required this.stepThree,
      required this.stepTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: ResponsiveLayout.isMobile(context) || ResponsiveLayout.isTablet(context)
          ? Column(
              children: [
                title,
                verticalSpace(30),
                stepOne,
                verticalSpace(30),
                stepTwo,
                verticalSpace(30),
                stepThree,
                verticalSpace(0),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                verticalSpace(30),
                stepOne,
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: SizeConfig.screenHeight!,
                    ),
                    stepTwo,
                    Positioned(
                      top: 0,
                      child: arrowImage,
                    ),
                    Positioned(
                        bottom: 0,
                        top: 20,
                        left: 0,
                        right: 180,
                        child: rightArrow),
                    Positioned(bottom: 200, left: 150, child: stepThree),
                  ],
                ),
                verticalSpace(60),
              ],
            ),
    );
  }
}
