import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/course_service.dart';

class CourseVM extends ChangeNotifier {
  final CourseService _service;

  CourseVM({required String token})
      : _service = CourseService(token: token);

  List<Course> courses = [];
  bool loading = false;

  Future<void> loadCourses() async {
    loading = true;
    notifyListeners();

    final data = await _service.fetchCourses();
    courses = data.map((e) => Course.fromJson(e)).toList();

    loading = false;
    notifyListeners();
  }

  Future<void> addCourse(String title, String description) async {
    await _service.createCourse(
      title: title,
      description: description,
    );
    await loadCourses();
  }

  Future<void> updateCourse(
      String id, String title, String description) async {
    await _service.updateCourse(
      id: id,
      title: title,
      description: description,
    );
    await loadCourses();
  }

  Future<void> deleteCourse(String id) async {
    await _service.deleteCourse(id);
    await loadCourses();
  }
}
