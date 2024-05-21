import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/common_item.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/widget_home_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/screen/sql_home_screen.dart';
// import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_dark_theme/dark_theme_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/4_product_get_api/screen/api_home_screen.dart';

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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WidgetHomeScreen()));
                }
              ),
              ConstWidget.commonItem(
                index: "2",
                name: "Sqlite Database",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SqlHomeScreen()));
                  }
              ),
              ConstWidget.commonItem(
                index: "3",
                name: "Dark Theme",
                onTap: (){

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const DarkThemeScreen()));
                }
              ),
              ConstWidget.commonItem(
                index: "4",
                name: "Product Get Api",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ApiHomeScreen()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
