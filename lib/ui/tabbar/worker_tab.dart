import 'package:flutter/material.dart';
import 'package:web_test/ui/components/left_arrow_image.dart';
import 'package:web_test/ui/components/right_arrow_image.dart';
import 'package:web_test/ui/components/step_one_component.dart';
import 'package:web_test/ui/components/step_two.dart';
import 'package:web_test/ui/components/tab_bar_title.dart';
import 'package:web_test/ui/components/tab_content.dart';
import 'package:web_test/ui/helpers/images.dart';
import 'package:web_test/ui/responsive_layout.dart';

class WorkerTab extends StatefulWidget {
  const WorkerTab({Key? key}) : super(key: key);

  @override
  _WorkerTabState createState() => _WorkerTabState();
}

class _WorkerTabState extends State<WorkerTab> {
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
        text: "Drei einfache Schritte\nzu deinem neuen Job",
      );

  Widget get stepOne => TabStep(
        widgetKey: stepOneKey,
        image: CustomImages.jobStepOne,
        stepCount: '1.',
        stepText: 'Erstellen dein Lebenslauf',
        imageScale: ResponsiveLayout.isMobile(context) ? 4.5 : 2,
      );

  Widget get stepTwo => StepTwo(
        arrowImage: leftArrow,
        stepImage: CustomImages.jobStepTwo,
        stepText: 'Erstellen dein Lebenslauf',
        scale: ResponsiveLayout.isMobile(context) ? 7 : 3.5,
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
        image: CustomImages.jobStepThree,
        stepCount: '3.',
        stepText: 'Mit nur einem Klick bewerben',
        imageScale:ResponsiveLayout.isMobile(context) ? 10 : 5,
      );
}
