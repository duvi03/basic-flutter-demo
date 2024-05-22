import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_dark_theme/provider/theme_provider.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_dark_theme/screen/navigation_bar_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_dark_theme/screen/profile_screen.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/3_dark_theme/widget/change_theme_button_widget.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      builder: (context,_){
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Light & Dark Theme",
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const HomePage(),
          );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        title: const Text('Light & Dark Theme'),
        elevation: 0,
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      bottomNavigationBar: const NavigationBarScreen(),
      extendBody: true,
      body: const ProfileScreen(),
    );
  }
}

