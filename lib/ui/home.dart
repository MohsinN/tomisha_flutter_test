import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_test/ui/components/clip_path.dart';
import 'package:web_test/ui/components/custom_appbar.dart';
import 'package:web_test/ui/components/custom_button.dart';
import 'package:web_test/ui/components/space.dart';
import 'package:web_test/ui/components/tabbar.dart';
import 'package:web_test/ui/helpers/colors.dart';
import 'package:web_test/ui/helpers/images.dart';
import 'package:web_test/ui/helpers/size_config.dart';
import 'package:web_test/ui/responsive_layout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();

  bool showLoginButton = false;

  @override
  void initState() {
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: ResponsiveLayout.isMobile(context) ? mobileAppBar : desktopAppBar,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollController.offset > 330) {
            showLoginButton = true;
            setState(() {});
          }
          if (scrollController.offset < 330) {
            showLoginButton = false;
            setState(() {});
          }
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                header,
                const JobTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get header => ResponsiveLayout.isMobile(context)
      ? mobileHeader
      : ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.45,
            decoration: const BoxDecoration(
                color: CustomColors.imageBackground,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    CustomColors.highlightedText,
                    CustomColors.imageBackground,
                  ],
                )),
            child: desktopHeader,
          ),
        );

  PreferredSizeWidget get mobileAppBar => const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: SafeArea(child: CustomAppBar()));

  PreferredSizeWidget get desktopAppBar => PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: CustomAppBar(
        showLoginButton: showLoginButton,
      ));

  Widget get desktopHeader => Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth! * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(60),
                defineJobText,
                verticalSpace(30),
                CustomButton(
                  width: SizeConfig.screenWidth! * 0.14,
                  height: SizeConfig.screenHeight! * 0.035,
                  title: 'Kostenlos  Registrieren',
                  onPressed: () {},
                ),
              ],
            ),
            agreementImage,
            SizedBox(
              width: SizeConfig.screenWidth! * 0.1,
            ),
          ],
        ),
      );

  Widget get mobileHeader => Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          color: CustomColors.imageBackground,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              verticalSpace(10),
              defineJobText,
              verticalSpace(10),
              agreementImage,
              verticalSpace(10),
              CustomButton(
                width: SizeConfig.screenWidth! * 0.9,
                height: SizeConfig.screenHeight! * 0.035,
                title: 'Kostenlos  Registrieren',
                onPressed: () {},
              ),
              verticalSpace(20),
            ],
          ),
        ),
      );

  Widget get defineJobText => Text(
        "Define Job \nwebsite",
        style: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveLayout.isMobile(context) ? 20 : 40),
      );

  Widget get agreementImage => CircleAvatar(
      radius: ResponsiveLayout.isMobile(context) ? 60 : 130,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 8),
        child: Image.asset(
          CustomImages.agreement,
          scale: ResponsiveLayout.isMobile(context) ? 2 : 4,
        ),
      ));
}
