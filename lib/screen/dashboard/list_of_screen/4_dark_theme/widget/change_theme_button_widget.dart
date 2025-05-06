import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/4_dark_theme/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget1 extends StatelessWidget {
  const ChangeThemeButtonWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(!themeProvider.isDarkMode);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        child: Icon(
          themeProvider.isDarkMode ? Icons.wb_sunny_sharp : Icons.nightlight,
          color: themeProvider.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
