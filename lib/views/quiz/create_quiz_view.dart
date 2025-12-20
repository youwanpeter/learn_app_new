import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';



class CreateQuizView extends StatefulWidget {
  const CreateQuizView({super.key});

  @override
  State<CreateQuizView> createState() => _CreateQuizViewState();
}

class _CreateQuizViewState extends State<CreateQuizView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LecturerQuizViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Create Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Quiz Title",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                vm.createQuiz(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
