import 'package:flutter/material.dart';
import 'package:web_test/ui/components/space.dart';
import 'package:web_test/ui/components/tab_clip_path.dart';
import 'package:web_test/ui/helpers/colors.dart';
import 'package:web_test/ui/helpers/size_config.dart';
import 'package:web_test/ui/helpers/text_styles.dart';
import 'package:web_test/ui/responsive_layout.dart';

class StepTwo extends StatefulWidget {
  final Widget arrowImage;
  final String stepImage;
  final String stepText;
  final double scale;

  const StepTwo(
      {super.key,
      required this.arrowImage,
      required this.stepImage,
      required this.stepText,
      required this.scale});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return stepTwo;
  }

  Widget get stepTwo => Positioned(
        top: ResponsiveLayout.isMobile(context) ? 40 : 130,
        right: 0,
        left: 0,
        child: ClipPath(
          clipper: TabClipPathClass(),
          child: clipper,
        ),
      );

  Widget get clipper => Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: ResponsiveLayout.isMobile(context)
            ? SizeConfig.screenHeight! * 0.2
            : SizeConfig.screenHeight! * 0.3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            CustomColors.highlightedText,
            CustomColors.imageBackground,
          ],
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 20),
              child: Image.asset(
                widget.stepImage,
                scale: widget.scale,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                        color: CustomColors.stepTextColor,
                        fontSize: ResponsiveLayout.isMobile(context) ? 30 : 70),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: ResponsiveLayout.isMobile(context) ?  8 :15),
                    child: Text(
                      widget.stepText,
                      style: TextStyle(
                          color: CustomColors.stepTextColor,
                          fontSize:
                              ResponsiveLayout.isMobile(context) ? 12 : 18),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(20),
          ],
        ),
      );
}
