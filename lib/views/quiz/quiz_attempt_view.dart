// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import 'quiz_result_view.dart';

// class QuizAttemptView extends StatefulWidget {
//   const QuizAttemptView({super.key});

//   @override
//   State<QuizAttemptView> createState() => _QuizAttemptViewState();
// }

// class _QuizAttemptViewState extends State<QuizAttemptView> {
//   int? selectedAnswer;

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);
//     final question =
//         vm.selectedQuiz!.questions[vm.currentQuestionIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Question ${vm.currentQuestionIndex + 1}/${vm.selectedQuiz!.questions.length}',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               question.question,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),

//             ...List.generate(question.options.length, (index) {
//               return RadioListTile<int>(
//                 value: index,
//                 groupValue: selectedAnswer,
//                 title: Text(question.options[index]),
//                 onChanged: (value) {
//                   setState(() => selectedAnswer = value);
//                 },
//               );
//             }),

//             const Spacer(),

//             ElevatedButton(
//               onPressed: selectedAnswer == null
//                   ? null
//                   : () {
//                       vm.answerQuestion(selectedAnswer!);
//                       selectedAnswer = null;

//                       if (!vm.nextQuestion()) {
//                         final score = vm.calculateScore();
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 QuizResultView(score: score),
//                           ),
//                         );
//                       }
//                     },
//               child: Text(
//                 vm.currentQuestionIndex ==
//                         vm.selectedQuiz!.questions.length - 1
//                     ? 'Finish Quiz'
//                     : 'Next',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import 'quiz_result_view.dart';

// class QuizAttemptView extends StatefulWidget {
//   const QuizAttemptView({super.key});

//   @override
//   State<QuizAttemptView> createState() => _QuizAttemptViewState();
// }

// class _QuizAttemptViewState extends State<QuizAttemptView> {
//   int? selectedAnswer;

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);
//     final question =
//         vm.selectedQuiz!.questions[vm.currentQuestionIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Question ${vm.currentQuestionIndex + 1}/${vm.selectedQuiz!.questions.length}',
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             /// Question Card
//             Container(
//                width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                 question.question,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// Options
//             ...List.generate(question.options.length, (index) {
//               return Container(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: selectedAnswer == index
//                         ? Colors.indigo
//                         : Colors.grey.shade300,
//                   ),
//                 ),
//                 child: RadioListTile<int>(
//                   value: index,
//                   groupValue: selectedAnswer,
//                   title: Text(question.options[index]),
//                   activeColor: Colors.indigo,
//                   onChanged: (value) {
//                     setState(() => selectedAnswer = value);
//                   },
//                 ),
//               );
//             }),

//             const Spacer(),

//             /// Full-width Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 onPressed: selectedAnswer == null
//                     ? null
//                     : () {
//                         vm.answerQuestion(selectedAnswer!);
//                         selectedAnswer = null;

//                         if (!vm.nextQuestion()) {
//                           final score = vm.calculateScore();
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   QuizResultView(score: score),
//                             ),
//                           );
//                         }
//                       },
//                 child: Text(
//                   vm.currentQuestionIndex ==
//                           vm.selectedQuiz!.questions.length - 1
//                       ? 'Finish Quiz'
//                       : 'Next',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/quiz/quiz_viewmodel.dart';
import 'quiz_result_view.dart';

class QuizAttemptView extends StatefulWidget {
  const QuizAttemptView({super.key});

  @override
  State<QuizAttemptView> createState() => _QuizAttemptViewState();
}

class _QuizAttemptViewState extends State<QuizAttemptView> {
  int? selectedAnswer;

  static const Color accentRed = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuizViewModel>(context);
    final question =
        vm.selectedQuiz!.questions[vm.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${vm.currentQuestionIndex + 1}/${vm.selectedQuiz!.questions.length}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Align(
  alignment: Alignment.centerLeft,
  child: Text(
    question.question,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
),



            /// Question Card
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(18),
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.05),
            //         blurRadius: 10,
            //       ),
            //     ],
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       question.question,
            //       textAlign: TextAlign.left,
            //       style: const TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),

            /// Options
            /// 
            
            ...List.generate(question.options.length, (index) {
  final bool isSelected = selectedAnswer == index;

  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white, // 👈 always white
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: isSelected ? accentRed : Colors.grey.shade300,
        width: 1.5,
      ),
    ),
    child: RadioListTile<int>(
      value: index,
      groupValue: selectedAnswer,
      title: Text(
        question.options[index],
        style: const TextStyle(color: Colors.black),
      ),
      activeColor: accentRed,
      tileColor: Colors.white, // 👈 force white
      selectedTileColor: Colors.white, // 👈 force white when selected
      selected: isSelected,
      onChanged: (value) {
        setState(() => selectedAnswer = value);
      },
    ),
  );
}),
            // ...List.generate(question.options.length, (index) {
            //   final bool isSelected = selectedAnswer == index;

            //   return Container(
            //     margin: const EdgeInsets.only(bottom: 12),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(14),
            //       border: Border.all(
            //         color: isSelected
            //             ? accentRed
            //             : Colors.grey.shade300,
            //       ),
            //     ),
            //     child: RadioListTile<int>(
            //       value: index,
            //       groupValue: selectedAnswer,
            //       title: Text(question.options[index]),
            //       activeColor: accentRed,
            //       onChanged: (value) {
            //         setState(() => selectedAnswer = value);
            //       },
            //     ),
            //   );
            // }),

            const Spacer(),

            /// Full-width Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentRed,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  disabledBackgroundColor:
                      accentRed.withOpacity(0.4),
                  disabledForegroundColor: Colors.white70,
                ),
                onPressed: selectedAnswer == null
                    ? null
                    : () {
                        vm.answerQuestion(selectedAnswer!);
                        selectedAnswer = null;

                        if (!vm.nextQuestion()) {
                          final score = vm.calculateScore();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  // QuizResultView(score: score),
                                  QuizResultView(
  score: score,
  correctAnswers: vm.correctAnswers,
  totalQuestions: vm.selectedQuiz!.questions.length,
),

                            ),
                          );
                        }
                      },
                child: Text(
                  vm.currentQuestionIndex ==
                          vm.selectedQuiz!.questions.length - 1
                      ? 'Finish Quiz'
                      : 'Next',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

