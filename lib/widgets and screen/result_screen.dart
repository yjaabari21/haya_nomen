import 'package:flutter/material.dart';
import 'package:haya_nomen/models/quests.dart';

import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("النتيجة")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              score >= (questions.length / 2)
                  ? "🎉 أحسنت!"
                  : "😊 حاول مرة أخرى",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              "$score /  ${questions.length}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.restart_alt),
                  SizedBox(width: 8),
                  Text("إعادة اللعب"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
