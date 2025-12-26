import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== CORE =====
import 'services/api.dart';
import 'utils/jwt_helper.dart';

// ===== VIEWMODELS =====
import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/feature2_viewmodel.dart';
import 'viewmodels/course_vm.dart';
import 'viewmodels/lesson_vm.dart';

// ===== SCREENS =====
import 'views/dashboard_view.dart';
import 'views/course/course_list_screen.dart';
import 'views/lesson/lesson_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = "http://10.0.2.2:5000";

    // 🔐 TEMP JWT (replace with login later)
    const String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6I"
        "mxlY3QxIiwicm9sZSI6ImxlY3R1cmVyIiwiaWF0IjoxNzY2MjM5OTkxLCJleH"
        "AiOjE3NjY4NDQ3OTF9.NzN1oL6SO0JJanzl5K2Z7T11JSxX5cvxTnx8JmlDAeo"; // student token

    final String userRole = getRoleFromJwt(token);

    return MultiProvider(
      providers: [
        // ===== DASHBOARD =====
        ChangeNotifierProvider(
          create: (_) {
            final vm = DashboardViewModel();
            vm.loadDashboard();
            return vm;
          },
        ),

        // ===== FEATURE 1: COURSES & LESSONS =====
        ChangeNotifierProvider(
          create: (_) => CourseVM(token: token),
        ),

        ChangeNotifierProvider(
          create: (_) => LessonVM(token: token),
        ),


        // ===== FEATURE 2 =====
        ChangeNotifierProvider(
          create: (_) => Feature2ViewModel(
            api: Api(baseUrl: baseUrl, token: token),
          ),
        ),

        // ===== GLOBAL ROLE =====
        Provider<String>.value(value: userRole),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.indigo,
        ),

        // ✅ Dashboard first
        home: const DashboardView(),

        // ✅ Named routes for full app navigation
        routes: {
          '/dashboard': (_) => const DashboardView(),
          '/courses': (_) => CourseListScreen(role: userRole),

          // Lessons need arguments → handled via onGenerateRoute
        },

        // ✅ Lesson route with arguments
        onGenerateRoute: (settings) {
          if (settings.name == '/lessons') {
            final args = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(
              builder: (_) => LessonListScreen(
                courseId: args['courseId'],
                role: userRole,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
