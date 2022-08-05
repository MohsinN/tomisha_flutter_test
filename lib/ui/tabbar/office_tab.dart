import 'package:flutter/material.dart';
import 'package:web_test/ui/components/left_arrow_image.dart';
import 'package:web_test/ui/components/right_arrow_image.dart';
import 'package:web_test/ui/components/step_one_component.dart';
import 'package:web_test/ui/components/step_two.dart';
import 'package:web_test/ui/components/tab_bar_title.dart';
import 'package:web_test/ui/components/tab_content.dart';
import 'package:web_test/ui/helpers/images.dart';
import 'package:web_test/ui/responsive_layout.dart';

class OfficeTab extends StatefulWidget {
  const OfficeTab({Key? key}) : super(key: key);

  @override
  _OfficeTabState createState() => _OfficeTabState();
}

class _OfficeTabState extends State<OfficeTab> {
  GlobalKey stepOneKey = GlobalKey();
  ValueNotifier<double> stepOneValue = ValueNotifier(0);
  ValueNotifier<bool> positionKnown = ValueNotifier<bool>(false);

  render() {
    RenderBox locationBox =
        stepOneKey.currentContext?.findRenderObject() as RenderBox;
    stepOneValue.value = locationBox.size.width;
    positionKnown.value = true;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => render());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabContent(
      title: title,
      stepOne: stepOne,
      stepTwo: stepTwo,
      stepThree: stepThree,
      arrowImage: leftArrow,
      rightArrow: rightArrow,
    );
  }

  Widget get title => const TabBarTitle(
        text: "Drei einfache Schritte zur\nVermittlung neuer Mitarbeiter",
      );

  Widget get stepOne => TabStep(
        widgetKey: stepOneKey,
        image: CustomImages.jobStepOne,
        stepCount: '1.',
        stepText: ResponsiveLayout.isMobile(context) ? 'Drei einfache Schritte zur\nVermittlung neuer Mitarbeiter' : 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
        imageScale: ResponsiveLayout.isMobile(context) ? 5 : 2,
      );

  Widget get stepTwo => StepTwo(
        arrowImage: leftArrow,
        stepText: 'Erstellen dein Lebenslauf',
        stepImage: CustomImages.officeStepTwo,
        scale: ResponsiveLayout.isMobile(context) ? 6 :3,
      );

  Widget get leftArrow => ValueListenableBuilder(
      valueListenable: positionKnown,
      builder: (BuildContext context, value, Widget? child) {
        return LeftArrowImage(
          padding: EdgeInsets.only(left: stepOneValue.value * 2.5),
        );
      });

  Widget get rightArrow => ValueListenableBuilder(
      valueListenable: positionKnown,
      builder: (BuildContext context, value, Widget? child) {
        return const RightArrow();
      });

  Widget get stepThree =>  TabStep(
        image: CustomImages.officeStepThree,
        stepCount: '3.',
        stepText: ResponsiveLayout.isMobile(context) ?'Vermittlung nach Provision\noder Stundenlohn' : 'Vermittlung nach Provision oder Stundenlohn',
        imageScale:ResponsiveLayout.isMobile(context) ? 8 : 4,
      );
}
