import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours.remainder(24);

    final isPast = difference.isNegative;

    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Предмет: ${exam.subject}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.meeting_room),
                    const SizedBox(width: 8),
                    Text("Простории: ${exam.rooms.join(', ')}"),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                Text(
                  isPast
                      ? "Испитот е веќе одржан."
                      : "Преостанато време: $days дена, $hours часа",
                  style: TextStyle(
                    color: isPast ? Colors.grey : Colors.tealAccent[200],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
