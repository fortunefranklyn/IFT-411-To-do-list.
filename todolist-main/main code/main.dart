import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/task_home_view.dart';

void main() {
  runApp(const MintyTodoApp());
}

class MintyTodoApp extends StatelessWidget {
  const MintyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(),
      home: const TaskHomeView(),
    );
  }
}
