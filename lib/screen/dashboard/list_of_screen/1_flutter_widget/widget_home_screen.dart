import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/pages/button_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/pages/listview_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/pages/textfiels_screen.dart';

class WidgetHomeScreen extends StatelessWidget {
  const WidgetHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Widget"),
          bottom: const TabBar(tabs: [
            Tab(text: "TextFields"),
            Tab(text: "Button"),
            Tab(text: "Listview"),
          ]),
        ),
        body: Center(
          child:  TabBarView(
            children: [
              TextFieldsScreen(),
              const ButtonScreen(),
              const ListViewScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
