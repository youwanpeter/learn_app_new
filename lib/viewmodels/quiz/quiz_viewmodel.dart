import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../../dummy_data/quiz_dummy_data.dart';

class QuizViewModel extends ChangeNotifier {
  List<Quiz> quizzes = QuizDummyData.quizzes;

  Quiz? selectedQuiz;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  void startQuiz(Quiz quiz) {
    selectedQuiz = quiz;
    currentQuestionIndex = 0;
    correctAnswers = 0;
    notifyListeners();
  }

  void answerQuestion(int selectedIndex) {
    final question = selectedQuiz!.questions[currentQuestionIndex];
    if (selectedIndex == question.correctAnswerIndex) {
      correctAnswers++;
    }
  }

  bool nextQuestion() {
    if (currentQuestionIndex < selectedQuiz!.questions.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
      return true;
    }
    return false;
  }

  int calculateScore() {
    final total = selectedQuiz!.questions.length;
    final score = ((correctAnswers / total) * 100).round();
    selectedQuiz!.scorePercentage = score;
    return score;
  }
}
