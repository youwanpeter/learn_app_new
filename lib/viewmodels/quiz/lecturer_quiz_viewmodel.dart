import 'package:flutter/material.dart';

import '../../models/quiz.dart'; // 👈 contains Question type

class LecturerQuizViewModel extends ChangeNotifier {
  final List<Quiz> _quizzes = [];

  final Map<String, bool> _publishedStatus = {};

  List<Quiz> get quizzes => _quizzes;

  bool isPublished(String quizId) =>
      _publishedStatus[quizId] ?? false;

  Quiz? _editingQuiz;
  Quiz? get editingQuiz => _editingQuiz;

  /// Create quiz
  void createQuiz(String title) {
    final quiz = Quiz(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      questions: [],
    );

    _quizzes.add(quiz);
    _publishedStatus[quiz.id] = false;
    notifyListeners();
  }

  void selectQuiz(Quiz quiz) {
    _editingQuiz = quiz;
  }

  /// ✅ ADD QUESTION (correct Question type)
  void addQuestion({
    required String question,
    required List<String> options,
    required int correctIndex,
  }) {
    if (_editingQuiz == null) return;

    _editingQuiz!.questions.add(
      Question(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        question: question,
        options: options,
        correctAnswerIndex: correctIndex,
      ),
    );

    notifyListeners();
  }

  void deleteQuestion(int index) {
    if (_editingQuiz == null) return;
    _editingQuiz!.questions.removeAt(index);
    notifyListeners();
  }

  void publishQuiz() {
    if (_editingQuiz == null) return;
    _publishedStatus[_editingQuiz!.id] = true;
    notifyListeners();
  }
}
