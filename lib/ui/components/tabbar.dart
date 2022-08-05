import 'package:flutter/material.dart';
import 'package:web_test/ui/helpers/colors.dart';
import 'package:web_test/ui/helpers/size_config.dart';
import 'package:web_test/ui/responsive_layout.dart';
import 'package:web_test/ui/tabbar/employer_tab.dart';
import 'package:web_test/ui/tabbar/office_tab.dart';
import 'package:web_test/ui/tabbar/worker_tab.dart';

class JobTab extends StatefulWidget {
  const JobTab({Key? key}) : super(key: key);

  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> with TickerProviderStateMixin {
  TabController? tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController!.addListener(() {
      setState(() {
        _selectedIndex = tabController!.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _tabSection(context: context);
  }

  Widget _tabSection({required BuildContext context}) => DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              height: 40,
              width:ResponsiveLayout.isMobile(context) ? SizeConfig.screenWidth! * 0.94 : SizeConfig.screenWidth! * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.tabBorderColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: tabBar,
            ),
            tabBarView,
          ],
        ),
      );

  Widget get tabBar => TabBar(
        controller: tabController,
        splashBorderRadius: BorderRadius.circular(0),
        unselectedLabelColor: CustomColors.greenGradient,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return states.contains(MaterialState.focused)
                ? null
                : Colors.transparent;
          },
        ),
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_selectedIndex == 0
                  ? 12
                  : _selectedIndex == 1
                      ? 0
                      : 0),
              bottomLeft: Radius.circular(_selectedIndex == 0
                  ? 12
                  : _selectedIndex == 1
                      ? 0
                      : 0),
              topRight: Radius.circular(_selectedIndex == 0
                  ? 0
                  : _selectedIndex == 1
                      ? 0
                      : 12),
              bottomRight: Radius.circular(_selectedIndex == 0
                  ? 0
                  : _selectedIndex == 1
                      ? 0
                      : 12),
            ),
            color: CustomColors.activeTabColor),
        tabs: const[
           Tab(
            iconMargin: EdgeInsets.all(10),
            child: Text(
              "Arbeitnehmer",
            ),
          ),
          Tab(
            iconMargin: EdgeInsets.all(10),
            child: Text(
              "Arbeitgeber",
            ),
          ),
           Tab(
            iconMargin: EdgeInsets.all(10),
            child: Text(
              "Temporärbüro",
            ),
          ),
        ],
      );

  Widget get tabBarView => SizedBox(
        height: SizeConfig.screenHeight!,
        width: double.infinity,
        child: TabBarView(controller: tabController, children: const [
          WorkerTab(),
          EmployerTab(),
          OfficeTab(),
        ]),
      );
}
