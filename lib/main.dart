import 'package:flutter/material.dart';
import 'package:medication/core/theme/app_theme.dart';
import 'package:medication/screens/add_child_screen.dart';
import 'package:medication/screens/edit_child_screen.dart';
import 'package:medication/screens/home_screen.dart';
import 'package:medication/screens/medication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/add_child': (context) => AddChildScreen(),
        '/edit_child': (context) => EditChildScreen(),
        '/medications': (context) => MedicationScreen(),
      },
    );
  }
}
