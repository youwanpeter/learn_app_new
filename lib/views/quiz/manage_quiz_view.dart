// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';
// import 'create_quiz_view.dart';
// import 'manage_questions_view.dart';


// class ManageQuizView extends StatelessWidget {
//   const ManageQuizView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<LecturerQuizViewModel>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Manage Quizzes")),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const CreateQuizView()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: ListView.builder(
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];
//           return ListTile(
//             title: Text(quiz.title),
//             subtitle: Text(
//               quiz.isPublished ? "Published" : "Draft",
//               style: TextStyle(
//                 color: quiz.isPublished ? Colors.green : Colors.orange,
//               ),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               vm.selectQuiz(quiz);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const ManageQuestionsView(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';
// import 'create_quiz_view.dart';
// import 'manage_questions_view.dart';

// class ManageQuizView extends StatelessWidget {
//   const ManageQuizView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<LecturerQuizViewModel>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Manage Quizzes"),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const CreateQuizView(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: ListView.builder(
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];
//           final bool published = vm.isPublished(quiz.id); // ✅ FIX

//           return ListTile(
//             title: Text(quiz.title),
//             subtitle: Text(
//               published ? "Published" : "Draft",
//               style: TextStyle(
//                 color: published ? Colors.green : Colors.orange,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               vm.selectQuiz(quiz);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const ManageQuestionsView(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';
// import 'create_quiz_view.dart';
// import 'manage_questions_view.dart';

// class ManageQuizView extends StatelessWidget {
//   const ManageQuizView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<LecturerQuizViewModel>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Manage Quizzes"),
//         centerTitle: true,
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const CreateQuizView(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),

//       body: vm.quizzes.isEmpty
//           // ===============================
//           // ✅ EMPTY STATE (NO QUIZZES)
//           // ===============================
//           ? Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.quiz_rounded,
//                       size: 80,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "No quizzes created yet",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Create a new quiz to add questions and publish it for students.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 24),

//                     /// ✅ MAIN CTA BUTTON
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const CreateQuizView(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           "Create a new quiz",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )

//           // ===============================
//           // ✅ QUIZ LIST (EDIT FLOW)
//           // ===============================
//           : ListView.builder(
//               itemCount: vm.quizzes.length,
//               itemBuilder: (_, index) {
//                 final quiz = vm.quizzes[index];
//                 final published = vm.isPublished(quiz.id);

//                 return ListTile(
//                   title: Text(
//                     quiz.title,
//                     style: const TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   subtitle: Text(
//                     published ? "Published" : "Draft",
//                     style: TextStyle(
//                       color: published ? Colors.green : Colors.orange,
//                     ),
//                   ),
//                   trailing: const Icon(Icons.edit),
//                   onTap: () {
//                     vm.selectQuiz(quiz);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const ManageQuestionsView(),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/quiz/lecturer_quiz_viewmodel.dart';
import 'create_quiz_view.dart';
import 'manage_questions_view.dart';

class ManageQuizView extends StatelessWidget {
  const ManageQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LecturerQuizViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Quizzes"),
        centerTitle: true,
      ),

      /// ===============================
      /// ✅ FAB — CREATE QUIZ
      /// ===============================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                value: context.read<LecturerQuizViewModel>(),
                child: const CreateQuizView(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: vm.quizzes.isEmpty
          // ===============================
          // ✅ EMPTY STATE
          // ===============================
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.quiz_rounded,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "No quizzes created yet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Create a new quiz to add questions and publish it for students.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    /// ✅ MAIN CTA BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value:
                                    context.read<LecturerQuizViewModel>(),
                                child: const CreateQuizView(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Create a new quiz",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )

          // ===============================
          // ✅ QUIZ LIST (EDIT FLOW)
          // ===============================
          : ListView.builder(
              itemCount: vm.quizzes.length,
              itemBuilder: (_, index) {
                final quiz = vm.quizzes[index];
                final published = vm.isPublished(quiz.id);

                return ListTile(
                  title: Text(
                    quiz.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    published ? "Published" : "Draft",
                    style: TextStyle(
                      color: published ? Colors.green : Colors.orange,
                    ),
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    vm.selectQuiz(quiz);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                          value: context.read<LecturerQuizViewModel>(),
                          child: const ManageQuestionsView(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
