import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/dashboard/common_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 22.0,
              ),
            ),
            Text(
              'Learning',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 22.0,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstWidget.commonItem(
                index: "1",
                name: "Flutter Widget",
              ),
              ConstWidget.commonItem(
                index: "2",
                name: "Local Database",
              ),
              ConstWidget.commonItem(
                index: "3",
                name: "Animation",
              ),
              ConstWidget.commonItem(
                index: "4",
                name: "Firebase CRUD",
              ),
              ConstWidget.commonItem(
                index: "5",
                name: "Logical Task",
              ),
              ConstWidget.commonItem(
                index: "6",
                name: "Firebase FCM",
              ),
              ConstWidget.commonItem(
                index: "7",
                name: "Social login",
              ),
              ConstWidget.commonItem(
                index: "8",
                name: "Dark Theme",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
