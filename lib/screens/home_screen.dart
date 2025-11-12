import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Exam> exams = [
    Exam(subject: "Математика 1", dateTime: DateTime(2025, 11, 09, 9, 0), rooms: ["Лаб 13"]),
    Exam(subject: "Структорно Програмирање", dateTime: DateTime(2025, 11, 10, 11, 0), rooms: ["Лаб 215"]),
    Exam(subject: "Вовед во компјутерски науки", dateTime: DateTime(2025, 11, 17, 14, 0), rooms: ["Лаб 200аб"]),
    Exam(subject: "Професионални Вештини", dateTime: DateTime(2025, 11, 18, 10, 0), rooms: ["Лаб 3"]),
    Exam(subject: "Бизнис и менаџмент", dateTime: DateTime(2025, 11, 19, 13, 0), rooms: ["Лаб 12"]),
    Exam(subject: "Математика 2", dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ["Лаб 2"]),
    Exam(subject: "Компјутерски архитектури", dateTime: DateTime(2025, 11, 21, 12, 0), rooms: ["Лаб 117"]),
    Exam(subject: "Објектно ориентирано програмирање", dateTime: DateTime(2025, 11, 22, 15, 0), rooms: ["Лаб 138"]),
    Exam(subject: "Основи на сајбер безбедност", dateTime: DateTime(2025, 11, 23, 10, 0), rooms: ["Лаб 200в"]),
    Exam(subject: "Основи на веб дизајн", dateTime: DateTime(2025, 11, 24, 11, 0), rooms: ["Лаб 215"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 212052"),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(exam: exams[index]);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: const Color.fromARGB(255, 164, 243, 236),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
