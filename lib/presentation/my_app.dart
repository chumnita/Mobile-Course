import 'package:flutter/material.dart';
import 'package:crud_ass3/presentation/users_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Transactions',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const UsersScreen(),
    );
  }
}
