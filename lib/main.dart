import 'package:flutter/material.dart';
import 'package:todoss/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}

