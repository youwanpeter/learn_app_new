import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/course_progress.dart';
import '../models/analytics_model.dart';

class ProgressService {

  static const String _progressKey = 'cached_course_progress';
  static const String _statsKey = 'cached_dashboard_stats';

  Future<List<CourseProgress>> fetchProgress() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      List<CourseProgress> progressList = [
        CourseProgress(
          courseName: "Flutter",
          completedLessons: 7,
          totalLessons: 10,
        ),
        CourseProgress(
          courseName: "Algorithms",
          completedLessons: 5,
          totalLessons: 8,
        ),
      ];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, dynamic>> jsonList = [];

      for (CourseProgress course in progressList) {
        jsonList.add({
          'name': course.courseName,
          'completed': course.completedLessons,
          'total': course.totalLessons,
        });
      }

      await prefs.setString(_progressKey, jsonEncode(jsonList));

      return progressList;

    } catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedData = prefs.getString(_progressKey);

      if (cachedData == null) {
        return [];
      }

      List decoded = jsonDecode(cachedData);
      List<CourseProgress> cachedProgress = [];

      for (var item in decoded) {
        cachedProgress.add(
          CourseProgress(
            courseName: item['name'],
            completedLessons: item['completed'],
            totalLessons: item['total'],
          ),
        );
      }

      return cachedProgress;
    }
  }

  Future<AnalyticsData?> fetchAnalytics() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      AnalyticsData analytics = AnalyticsData(
        weeklyLearningTime: [20, 40, 30, 60, 50, 45, 70],
        lessonsCompleted: 12,
        averageQuizScore: 82,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _statsKey,
        jsonEncode({
          'lessonsCompleted': analytics.lessonsCompleted,
          'averageQuizScore': analytics.averageQuizScore,
        }),
      );

      return analytics;

    } catch (e) {
      return null;
    }
  }

  Future<AnalyticsData> loadCachedStats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString(_statsKey);

    if (cachedData == null) {
      return AnalyticsData(
        weeklyLearningTime: [],
        lessonsCompleted: 0,
        averageQuizScore: 0,
      );
    }

    Map decoded = jsonDecode(cachedData);

    return AnalyticsData(
      weeklyLearningTime: [],
      lessonsCompleted: decoded['lessonsCompleted'],
      averageQuizScore: decoded['averageQuizScore'],
    );
  }
}
