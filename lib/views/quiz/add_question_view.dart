import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';


class AddQuestionView extends StatefulWidget {
  const AddQuestionView({super.key});

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  final questionCtrl = TextEditingController();
  final optionCtrls =
      List.generate(4, (_) => TextEditingController());
  int correctIndex = 0;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LecturerQuizViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Question")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: questionCtrl,
              decoration: const InputDecoration(
                labelText: "Question",
              ),
            ),
            const SizedBox(height: 12),

            ...List.generate(4, (i) {
              return RadioListTile(
                value: i,
                groupValue: correctIndex,
                title: TextField(
                  controller: optionCtrls[i],
                  decoration:
                      InputDecoration(labelText: "Option ${i + 1}"),
                ),
                onChanged: (val) {
                  setState(() => correctIndex = i);
                },
              );
            }),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                vm.addQuestion(
                  question: questionCtrl.text,
                  options: optionCtrls.map((e) => e.text).toList(),
                  correctIndex: correctIndex,
                );
                Navigator.pop(context);
              },
              child: const Text("Save Question"),
            ),
          ],
        ),
      ),
    );
  }
}
