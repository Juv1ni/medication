import 'package:flutter/material.dart';
import 'package:medication/core/theme/app_theme.dart';
import 'package:medication/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: HomePageScreen(),
      routes: {'/home': (context) => HomePageScreen()},
    );
  }
}
