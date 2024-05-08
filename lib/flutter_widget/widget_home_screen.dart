import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/flutter_widget/pages/listview_screen.dart';

class WidgetHomeScreen extends StatelessWidget {
  const WidgetHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widget"),
          bottom: TabBar(tabs: [
            Tab(text: "Text"),
            Tab(text: "Button"),
            Tab(text: "Listview"),
          ]),
        ),
        body: Center(
          child: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              ListViewScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
