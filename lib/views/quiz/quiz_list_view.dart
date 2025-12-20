// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import 'quiz_attempt_view.dart';

// class QuizListView extends StatelessWidget {
//   const QuizListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Quizzes')),
//       body: ListView.builder(
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];

//           return Card(
//             margin: const EdgeInsets.all(12),
//             child: ListTile(
//               title: Text(quiz.title),
//               subtitle: quiz.scorePercentage != null
//                   ? Text('Score: ${quiz.scorePercentage}%')
//                   : const Text('Not attempted'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 vm.startQuiz(quiz);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const QuizAttemptView(),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import 'quiz_attempt_view.dart';

// class QuizListView extends StatelessWidget {
//   const QuizListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quizzes'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 /// Quiz Icon
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.indigo.withOpacity(0.1),
//                   ),
//                   child: const Icon(
//                     Icons.quiz_rounded,
//                     color: Colors.indigo,
//                   ),
//                 ),

//                 const SizedBox(width: 16),

//                 /// Title + Status
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         quiz.title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         quiz.scorePercentage != null
//                             ? 'Score: ${quiz.scorePercentage}%'
//                             : 'Not attempted',
//                         style: TextStyle(
//                           color: quiz.scorePercentage != null
//                               ? Colors.green
//                               : Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 /// Arrow
//                 IconButton(
//                   icon: const Icon(Icons.arrow_forward_ios_rounded),
//                   onPressed: () {
//                     vm.startQuiz(quiz);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const QuizAttemptView(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import 'quiz_attempt_view.dart';

// class QuizListView extends StatelessWidget {
//   const QuizListView({super.key});

//   static const Color accentRed = Color.fromARGB(255, 255, 0, 0);

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quizzes'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 /// Quiz Icon (RED)
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: accentRed.withOpacity(0.1),
//                   ),
//                   child: const Icon(
//                     Icons.quiz_rounded,
//                     color: accentRed,
//                   ),
//                 ),

//                 const SizedBox(width: 16),

//                 /// Title + Status
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         quiz.title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         quiz.scorePercentage != null
//                             ? 'Score: ${quiz.scorePercentage}%'
//                             : 'Not attempted',
//                         style: TextStyle(
//                           color: quiz.scorePercentage != null
//                               ? Colors.green
//                               : Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 /// Arrow (RED)
//                 IconButton(
//                   icon: const Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: accentRed,
//                   ),
//                   onPressed: () {
//                     vm.startQuiz(quiz);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const QuizAttemptView(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../viewmodels/quiz/quiz_viewmodel.dart';
// import '../../widgets/dashboard_footer.dart';
// import 'quiz_attempt_view.dart';

// class QuizListView extends StatelessWidget {
//   final int currentIndex;
//   final VoidCallback onDashboardTap;
//   final VoidCallback onCoursesTap;
//   final VoidCallback onLessonsTap;
//   final VoidCallback onQuizTap;
//   final VoidCallback onAnalyticsTap;
//   final VoidCallback onProfileTap;

//   const QuizListView({
//     super.key,
//     required this.currentIndex,
//     required this.onDashboardTap,
//     required this.onCoursesTap,
//     required this.onLessonsTap,
//     required this.onQuizTap,
//     required this.onAnalyticsTap,
//     required this.onProfileTap,
//   });

//   static const Color accentRed = Color.fromARGB(255, 255, 0, 0);

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<QuizViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quizzes'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: vm.quizzes.length,
//         itemBuilder: (_, index) {
//           final quiz = vm.quizzes[index];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 /// Quiz Icon
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: accentRed.withOpacity(0.1),
//                   ),
//                   child: const Icon(
//                     Icons.quiz_rounded,
//                     color: accentRed,
//                   ),
//                 ),

//                 const SizedBox(width: 16),

//                 /// Title + Status
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         quiz.title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         quiz.scorePercentage != null
//                             ? 'Score: ${quiz.scorePercentage}%'
//                             : 'Not attempted',
//                         style: TextStyle(
//                           color: quiz.scorePercentage != null
//                               ? Colors.green
//                               : Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 /// Arrow
//                 IconButton(
//                   icon: const Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: accentRed,
//                   ),
//                   onPressed: () {
//                     vm.startQuiz(quiz);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const QuizAttemptView(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),

//       /// ✅ Dashboard Footer
//       bottomNavigationBar: DashboardFooter(
//         currentIndex: currentIndex,
//         onDashboardTap: onDashboardTap,
//         onCoursesTap: onCoursesTap,
//         onLessonsTap: onLessonsTap,
//         onQuizTap: onQuizTap,
//         onAnalyticsTap: onAnalyticsTap,
//         onProfileTap: onProfileTap,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/quiz/quiz_viewmodel.dart';
import 'quiz_attempt_view.dart';

class QuizListView extends StatelessWidget {
  const QuizListView({super.key});

  static const Color accentRed = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuizViewModel>(context);

    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 255, 0, 0),
  foregroundColor: Colors.white,
  title: const Text(
    'Quizzes',
    style: TextStyle(
      fontWeight: FontWeight.w600,
    ),
  ),
  centerTitle: true,
  elevation: 0,
),

      // appBar: AppBar(
      //   title: const Text('Quizzes'),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vm.quizzes.length,
        itemBuilder: (_, index) {
          final quiz = vm.quizzes[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentRed.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.quiz_rounded,
                    color: accentRed,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quiz.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        quiz.scorePercentage != null
                            ? 'Score: ${quiz.scorePercentage}%'
                            : 'Not attempted',
                        style: TextStyle(
                          color: quiz.scorePercentage != null
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: accentRed,
                  ),
                  onPressed: () {
                    vm.startQuiz(quiz);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuizAttemptView(),
                      ),
                    );
                  },
                ),

                
              ],
            ),
          );
        },
      ),

      
    );
  }
}

