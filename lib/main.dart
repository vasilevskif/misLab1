import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';

void main() {
  runApp(const ExamScheduleApp());
}

class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseDark = ThemeData.dark();
    return MaterialApp(
      title: 'Распоред за испити',
      debugShowCheckedModeBanner: false,
      theme: baseDark.copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      home: const ExamListScreen(),
    );
  }
}
