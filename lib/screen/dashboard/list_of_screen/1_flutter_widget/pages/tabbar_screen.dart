import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> tabs = [
    const Tab(
      text: "Tab 1",
    ),
    const Tab(
      text: "Tab 2",
    ),
    const Tab(
      text: "Tab 3",
    )
  ];

  final List<Tab> iconTabs = [
    const Tab(
      icon: Icon(Icons.home),
    ),
    const Tab(
      icon: Icon(Icons.search),
    ),
    const Tab(
      icon: Icon(Icons.settings),
    ),
  ];

  final List<Tab> titleAndIconTabs = [
    const Tab(
      icon: Icon(Icons.home),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Tab 1",
    ),
    const Tab(
      icon: Icon(Icons.search),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Tab 2",
    ),
    const Tab(
      icon: Icon(Icons.settings),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Tab 3",
    ),
  ];

  final List<Widget> bodyTabs = [
    const ReuseableAppBodyWidget(
      icon: Icons.home,
      title: "Tab 1",
    ),
    const ReuseableAppBodyWidget(
      icon: Icons.search,
      title: "Tab 2",
    ),
    const ReuseableAppBodyWidget(
      icon: Icons.settings,
      title: "Tab 3",
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  //*=> 1
                  TabBar(
                    tabs: tabs,
                    controller: tabController,
                    labelColor: const Color(0xFF7676F5),
                    indicatorColor: const Color(0xFF7676F5),
                    unselectedLabelColor: const Color(0xff5f6368),
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  //*=> 2
                  TabBar(
                    tabs: tabs,
                    controller: tabController,
                    labelColor: const Color(0xFF7676F5),
                    indicatorColor: const Color(0xFF7676F5),
                    unselectedLabelColor: const Color(0xff5f6368),
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  //*=> 3
                  TabBar(
                    tabs: tabs,
                    controller: tabController,
                    labelColor: const Color(0xFF7676F5),
                    unselectedLabelColor: const Color(0xff5f6368),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 4,
                        color: Color(0xFF7676F5),
                      ),
                    ),
                  ),
                  //*=> 4
                  TabBar(
                    tabs: iconTabs,
                    controller: tabController,
                    labelColor: const Color(0xFF7676F5),
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: const Color(0xFF7676F5).withOpacity(0.2),
                    ),
                  ),
                  //*=> 5
                  TabBar(
                    tabs: tabs,
                    controller: tabController,
                    labelColor: const Color(0xFF7676F5),
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF7676F5).withOpacity(0.2),
                    ),
                  ),
                  //*=> 6
                  Container(
                    height: kToolbarHeight - 8.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8.0)),
                    child: TabBar(
                      tabs: tabs,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF7676F5),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                    ),
                  ),
                  //*=> 7
                  Container(
                    height: kToolbarHeight - 8.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8.0)),
                    child: TabBar(
                      tabs: titleAndIconTabs,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF7676F5),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                    ),
                  ),
                  //*=> 8
                  Container(
                    height: kToolbarHeight + 8.0,
                    padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF7676F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: TabBar(
                      tabs: tabs,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicator: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                    ),
                  ),
                ]
                    .map(
                      (item) => Column(
                        children: [
                          item,
                          const Divider(
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                controller: tabController,
                children: bodyTabs,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableAppBodyWidget extends StatelessWidget {
  const ReuseableAppBodyWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: const Color(0xFF7676F5),
          ),
          Text(
            "$title contents\nlike image, info or...",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF7676F5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
