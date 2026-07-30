class Question {
  final String question;
  final String? image;
  final List<String> answers;
  final int correctAnswer;

  Question({
    required this.question,
    this.image,
    required this.answers,
    required this.correctAnswer,
  });
}
