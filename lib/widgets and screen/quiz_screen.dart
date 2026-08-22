import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_nomen/models/quests.dart';
import 'package:haya_nomen/widgets%20and%20screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswerIndex;
  bool showFeedback = false;
  bool isCorrectAnswer = false;
  bool showMilestone = false;

  late final AnimationController _celebrationController;
  late final Animation<double> _celebrationAnimation;

  @override
  void initState() {
    super.initState();
    _celebrationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _celebrationAnimation = CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    super.dispose();
  }

  Future<void> checkAnswer(int selectedAnswer) async {
    if (showFeedback || showMilestone) return;

    final isCorrect =
        selectedAnswer == questions[currentQuestion].correctAnswer;

    setState(() {
      selectedAnswerIndex = selectedAnswer;
      isCorrectAnswer = isCorrect;
      showFeedback = true;
    });

    if (isCorrect) {
      score++;
      _celebrationController.reset();
      _celebrationController.forward();
    }

    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;

    final reachedMilestone = (currentQuestion + 1) % 10 == 0;

    if (reachedMilestone && currentQuestion < questions.length - 1) {
      setState(() {
        showMilestone = true;
        showFeedback = false;
      });
      return;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswerIndex = null;
        showFeedback = false;
        isCorrectAnswer = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen(score: score)),
      );
    }
  }

  void continueAfterMilestone() {
    setState(() {
      currentQuestion++;
      selectedAnswerIndex = null;
      showFeedback = false;
      isCorrectAnswer = false;
      showMilestone = false;
    });
  }

  Color? _buttonColor(int index) {
    if (!showFeedback) return null;

    final correctIndex = questions[currentQuestion].correctAnswer;

    if (index == correctIndex) {
      return Colors.green.shade600;
    }

    if (selectedAnswerIndex == index) {
      return Colors.red.shade600;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    if (showMilestone) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "إختبارات",
            style: GoogleFonts.ibmPlexSansArabic(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.08 * 255).round()),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '🎉 رائع! 🎉',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'أكملت ${currentQuestion + 1} من ${questions.length} سؤالًا،\nاستمر يا بطل! 💪',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: continueAfterMilestone,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('استمرار'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إختبارات",
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "${currentQuestion + 1} / ${questions.length}",
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 20),
                if (question.image != null)
                  Image.asset(question.image!, height: 180),
                const SizedBox(height: 20),
                Text(
                  question.question,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                ...List.generate(question.answers.length, (index) {
                  final buttonColor = _buttonColor(index);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: showFeedback
                            ? null
                            : () => checkAnswer(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? buttonColor ??
                                    const Color.fromARGB(255, 18, 143, 192)
                              : buttonColor ?? Colors.grey[300],
                          foregroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          padding: const EdgeInsets.all(15),
                        ),
                        child: Text(
                          question.answers[index],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? const Color.fromARGB(255, 193, 152, 32)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                if (showFeedback && isCorrectAnswer)
                  AnimatedBuilder(
                    animation: _celebrationAnimation,
                    builder: (context, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _emojiChip('🎉', _celebrationAnimation.value),
                          const SizedBox(width: 8),
                          _emojiChip('✨', _celebrationAnimation.value),
                          const SizedBox(width: 8),
                          _emojiChip('🌈', _celebrationAnimation.value),
                        ],
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emojiChip(String emoji, double value) {
    return Transform.scale(
      scale: 0.8 + value * 0.4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.08 * 255).round()),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(emoji, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
