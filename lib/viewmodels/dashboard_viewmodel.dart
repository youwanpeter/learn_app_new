import 'package:flutter/material.dart';
import '../models/course_progress.dart';
import '../models/analytics_model.dart';
import '../services/progress_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final ProgressService _service = ProgressService();

  List<CourseProgress> progressList = [];
  AnalyticsData? analytics;

  bool isLoading = false;
  bool analyticsAvailable = true;

  Future<void> loadDashboard() async {
    isLoading = true;
    notifyListeners();

    progressList = await _service.fetchProgress();

    AnalyticsData? onlineAnalytics = await _service.fetchAnalytics();

    if (onlineAnalytics != null) {
      analytics = onlineAnalytics;
    } else {
      analytics = await _service.loadCachedStats();
    }

    isLoading = false;
    notifyListeners();
  }
}
