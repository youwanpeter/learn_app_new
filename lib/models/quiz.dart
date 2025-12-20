class Quiz {
  final String id;
  final String title;
  final List<Question> questions;
  int? scorePercentage; // stored after attempt

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    this.scorePercentage,
  });
}

class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}
