import 'package:flutter/material.dart';

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
            Tab(text: "List"),
          ]),
        ),
        body: Center(
          child: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
