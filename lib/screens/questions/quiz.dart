import 'package:flutter/material.dart';
import 'questions_screen.dart';
import 'quiz_question.dart';
import 'results_screen.dart';
import '../AIChat/AIChatScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  static String routeName = "/quiz";
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'questions-screen';  // Start directly at the questions screen

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == QuizQuestion.questions.length) {
      setState(() {
        _activeScreen = 'results-screen';  // Go to results screen after last question
      });
    } else {
      setState(() {});  // Update state to stay on current screen with new data
    }
  }

  void _restartQuiz() {
    Navigator.pushNamed(context, AIChatScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (_activeScreen) {
      case 'questions-screen':
        screenWidget = QuestionsScreen(
          onSelectAnswer: _chooseAnswer,
        );
        break;
      case 'results-screen':
        screenWidget = ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: _restartQuiz,
        );
        break;
      default:
        screenWidget = QuestionsScreen(  // Default to questions screen if uncertain
          onSelectAnswer: _chooseAnswer,
        );
        break;
    }

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}