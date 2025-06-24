import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/explore_screen.dart';
import 'screens/search_input_screen.dart';
import 'screens/search_result_screen.dart'; // Needed for Navigator.push but DO NOT add to routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Worktency',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/explore': (context) => const ExploreScreen(),
        '/search': (context) => const SearchInputScreen(),
        // Do NOT include SearchResultScreen here because it requires parameters
      },
    );
  }
}
