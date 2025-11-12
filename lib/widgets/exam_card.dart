import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast
          ? Theme.of(context).cardColor.withValues()
          : Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          Icons.school,
          size: 36,
          color: isPast ? Colors.grey : Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          exam.subject,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.grey[400] : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 6),
                Text(DateFormat('dd.MM.yyyy - HH:mm').format(exam.dateTime)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 16),
                const SizedBox(width: 6),
                Flexible(child: Text(exam.rooms.join(', '))),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
          );
        },
      ),
    );
  }
}
