import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  static const String index = "203174"; // број на индекс

  const ExamListScreen({super.key});

  List<Exam> _buildExams() {
    return [
      Exam(
        subject: "Математика 1",
        dateTime: DateTime(2025, 6, 8, 9, 0),
        rooms: ["Лаб 1", "Лаб 2"],
      ),
      Exam(
        subject: "Визуелно Програмирање",
        dateTime: DateTime(2025, 5, 13, 12, 0),
        rooms: ["Барака 1"],
      ),
      Exam(
        subject: "Алгоритми и податочни  структури",
        dateTime: DateTime(2025, 11, 14, 10, 0),
        rooms: ["Барака 2"],
      ),
      Exam(
        subject: "Бази на податоци",
        dateTime: DateTime(2025, 11, 17, 18, 30),
        rooms: ["223"],
      ),
      Exam(
        subject: "Оперативни системи",
        dateTime: DateTime(2025, 12, 15, 11, 0),
        rooms: ["122"],
      ),
      Exam(
        subject: "Компјутерски мрежи и безбедност",
        dateTime: DateTime(2025, 12, 21, 13, 0),
        rooms: ["225"],
      ),
      Exam(
        subject: "Веб програмирање",
        dateTime: DateTime(2025, 10, 26, 11, 0),
        rooms: ["222"],
      ),
      Exam(
        subject: "Вештачка интелигенција",
        dateTime: DateTime(2025, 11, 16, 9, 0),
        rooms: ["111"],
      ),
      Exam(
        subject: "Машинско учење",
        dateTime: DateTime(2025, 12, 26, 14, 0),
        rooms: ["512"],
      ),
      Exam(
        subject: "Софтверско инженерство",
        dateTime: DateTime(2025, 9, 9, 13, 0),
        rooms: ["213"],
      ),
      Exam(
        subject: "Професионални вештини",
        dateTime: DateTime(2025, 11, 11, 9, 0),
        rooms: ["312"],
      ),
      Exam(
        subject: "Визуелизација",
        dateTime: DateTime(2025, 10, 28, 9, 0),
        rooms: ["189"],
      ),
      Exam(
        subject: "Податочно рударство",
        dateTime: DateTime(2025, 12, 28, 8, 0),
        rooms: ["555"],
      ),
      Exam(
        subject: "Претприемништво",
        dateTime: DateTime(2025, 9, 19, 10, 0),
        rooms: ["333"],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _buildExams();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(title: const Text('Распоред за испити - $index')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.confirmation_num),
                const SizedBox(width: 8),
                Text(
                  "Вкупно испити: ${exams.length}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
