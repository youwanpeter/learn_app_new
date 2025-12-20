// import '../models/quiz.dart';

// class QuizDummyData {
//   static List<Quiz> quizzes = [
//     Quiz(
//       id: 'quiz1',
//       title: 'Flutter Basics',
//       questions: [
//         Question(
//           id: 'q1',
//           question: 'What language does Flutter use?',
//           options: ['Java', 'Swift', 'Dart', 'Kotlin'],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q2',
//           question: 'Which widget is immutable?',
//           options: [
//             'StatefulWidget',
//             'InheritedWidget',
//             'StatelessWidget',
//             'Container'
//           ],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q3',
//           question: 'Flutter is developed by?',
//           options: ['Apple', 'Meta', 'Google', 'Microsoft'],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q4',
//           question: 'Which command creates a Flutter app?',
//           options: [
//             'flutter init',
//             'flutter new',
//             'flutter create',
//             'flutter start'
//           ],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q5',
//           question: 'Hot Reload is used for?',
//           options: [
//             'Restart app',
//             'Update UI instantly',
//             'Build APK',
//             'Debug crash'
//           ],
//           correctAnswerIndex: 1,
//         ),
//       ],
//     ),

//     Quiz(
//       id: 'quiz2',
//       title: 'Dart Fundamentals',
//       questions: [
//         Question(
//           id: 'q1',
//           question: 'Which keyword is used for constants?',
//           options: ['var', 'final', 'const', 'static'],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q2',
//           question: 'Dart is?',
//           options: ['Compiled', 'Interpreted', 'Both', 'None'],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q3',
//           question: 'Main function syntax?',
//           options: [
//             'void main()',
//             'main() void',
//             'function main()',
//             'start()'
//           ],
//           correctAnswerIndex: 0,
//         ),
//         Question(
//           id: 'q4',
//           question: 'Which collection is ordered?',
//           options: ['Set', 'Map', 'List', 'All'],
//           correctAnswerIndex: 2,
//         ),
//         Question(
//           id: 'q5',
//           question: 'Null safety introduced in?',
//           options: ['1.x', '2.0', '2.12', '3.0'],
//           correctAnswerIndex: 2,
//         ),
//       ],
//     ),
//   ];
// }


import '../models/quiz.dart';

class QuizDummyData {
  static List<Quiz> quizzes = [
    /// ================= QUIZ 1 =================
    Quiz(
      id: 'quiz1',
      title: 'Flutter Basics',
      questions: [
        Question(
          id: 'q1',
          question: 'What language does Flutter use?',
          options: ['Java', 'Swift', 'Dart', 'Kotlin'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q2',
          question: 'Which widget is immutable?',
          options: [
            'StatefulWidget',
            'InheritedWidget',
            'StatelessWidget',
            'Container'
          ],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q3',
          question: 'Flutter is developed by?',
          options: ['Apple', 'Meta', 'Google', 'Microsoft'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q4',
          question: 'Which command creates a Flutter app?',
          options: [
            'flutter init',
            'flutter new',
            'flutter create',
            'flutter start'
          ],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q5',
          question: 'Hot Reload is used for?',
          options: [
            'Restart app',
            'Update UI instantly',
            'Build APK',
            'Debug crash'
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),

    /// ================= QUIZ 2 =================
    Quiz(
      id: 'quiz2',
      title: 'Dart Fundamentals',
      questions: [
        Question(
          id: 'q1',
          question: 'Which keyword is used for constants?',
          options: ['var', 'final', 'const', 'static'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q2',
          question: 'Dart is?',
          options: ['Compiled', 'Interpreted', 'Both', 'None'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q3',
          question: 'Main function syntax?',
          options: [
            'void main()',
            'main() void',
            'function main()',
            'start()'
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q4',
          question: 'Which collection is ordered?',
          options: ['Set', 'Map', 'List', 'All'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q5',
          question: 'Null safety introduced in?',
          options: ['1.x', '2.0', '2.12', '3.0'],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    /// ================= QUIZ 3 =================
    Quiz(
      id: 'quiz3',
      title: 'Flutter Widgets',
      questions: [
        Question(
          id: 'q1',
          question: 'Which widget handles layout?',
          options: ['Text', 'Column', 'Image', 'Icon'],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q2',
          question: 'Which widget allows scrolling?',
          options: ['Stack', 'Expanded', 'ListView', 'Align'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q3',
          question: 'Which widget positions children?',
          options: ['Row', 'Stack', 'Text', 'Padding'],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q4',
          question: 'MediaQuery is used to?',
          options: [
            'Access device size',
            'Handle routes',
            'Manage state',
            'Store data'
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q5',
          question: 'SafeArea prevents?',
          options: [
            'Overflows',
            'Keyboard overlap',
            'Notch overlap',
            'Scroll lag'
          ],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    /// ================= QUIZ 4 =================
    Quiz(
      id: 'quiz4',
      title: 'State Management',
      questions: [
        Question(
          id: 'q1',
          question: 'Which is NOT a state management solution?',
          options: ['Provider', 'Bloc', 'Redux', 'Navigator'],
          correctAnswerIndex: 3,
        ),
        Question(
          id: 'q2',
          question: 'Provider is built on?',
          options: ['Streams', 'InheritedWidget', 'SetState', 'Bloc'],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q3',
          question: 'Which widget rebuilds on notifyListeners?',
          options: [
            'Consumer',
            'Builder',
            'FutureBuilder',
            'StreamBuilder'
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q4',
          question: 'setState belongs to?',
          options: [
            'StatelessWidget',
            'StatefulWidget',
            'InheritedWidget',
            'Provider'
          ],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q5',
          question: 'Which is best for large apps?',
          options: ['setState', 'Provider', 'Bloc', 'All'],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    /// ================= QUIZ 5 =================
    Quiz(
      id: 'quiz5',
      title: 'Mobile App Basics',
      questions: [
        Question(
          id: 'q1',
          question: 'APK is used in?',
          options: ['iOS', 'Android', 'Web', 'Windows'],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q2',
          question: 'IPA file is for?',
          options: ['Android', 'Web', 'iOS', 'Linux'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q3',
          question: 'Which platform uses widgets?',
          options: ['Flutter', 'React Native', 'Android', 'iOS'],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q4',
          question: 'Which OS is open source?',
          options: ['iOS', 'Android', 'Windows', 'macOS'],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q5',
          question: 'Which store is for iOS apps?',
          options: ['Play Store', 'Galaxy Store', 'App Store', 'Snap Store'],
          correctAnswerIndex: 2,
        ),
      ],
    ),
  ];
}

