import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';
import 'add_question_view.dart';


class ManageQuestionsView extends StatelessWidget {
  const ManageQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LecturerQuizViewModel>();
    final quiz = vm.editingQuiz!;

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.publish),
            onPressed: vm.publishQuiz,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddQuestionView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: quiz.questions.length,
        itemBuilder: (_, index) {
          final q = quiz.questions[index];
          return ListTile(
            title: Text(q.question),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => vm.deleteQuestion(index),
            ),
          );
        },
      ),
    );
  }
}
