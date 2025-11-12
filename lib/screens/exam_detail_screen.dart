import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Предмет: ${exam.subject}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 6),
                Text("Датум и време: ${exam.dateTime.toLocal()}".split('.')[0]),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.room),
                const SizedBox(width: 6),
                Text("Простории: ${exam.rooms.join(", ")}"),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "До испитот останува: $days дена, $hours часа",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
