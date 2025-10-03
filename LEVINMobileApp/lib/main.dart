import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LEVIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13101C),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF13101C),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF13101C),
        ),
      ),
      home: const HomePage(title: 'LEVIN'),
    );
  }
}