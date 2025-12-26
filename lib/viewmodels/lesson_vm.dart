import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../services/lesson_service.dart';

class LessonVM extends ChangeNotifier {
  final LessonService _service;

  LessonVM({required String token})
      : _service = LessonService(token: token);

  List<Lesson> lessons = [];
  bool loading = false;

  Future<void> loadLessons(String courseId) async {
    loading = true;
    notifyListeners();

    try {
      final data = await _service.fetchLessons(courseId);
      lessons = data.map((e) => Lesson.fromJson(e)).toList();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> addLesson(String courseId, String title) async {
    await _service.createLesson(courseId: courseId, title: title);
    await loadLessons(courseId); //  refresh list
  }

  Future<void> updateLesson(String id, String title) async {
    await _service.updateLesson(id: id, title: title);
  }

  Future<void> deleteLesson(String id, String courseId) async {
    await _service.deleteLesson(id);
    await loadLessons(courseId); //  refresh list
  }
}
