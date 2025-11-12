import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast ? const Color.fromARGB(255, 230, 140, 140) : const Color.fromARGB(255, 121, 221, 151),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          exam.subject,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text("${exam.dateTime.toLocal()}".split(' ')[0]),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
