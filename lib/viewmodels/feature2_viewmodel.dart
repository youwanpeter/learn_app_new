import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../models/material.dart';
import '../models/assignment.dart';
import '../services/api.dart';

class Feature2ViewModel extends ChangeNotifier {
  final Api api;
  Feature2ViewModel({required this.api});

  bool isLoading = false;
  String? error;

  List<StudyMaterial> materials = [];
  List<Assignment> assignments = [];

  Future<void> loadAll(String courseId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final m = await api.getList(
        "/api/materials",
        query: {"courseId": courseId},
      );
      materials = m.map((e) => StudyMaterial.fromJson(e)).toList();

      final a = await api.getList(
        "/api/assignments",
        query: {"courseId": courseId},
      );
      assignments = a.map((e) => Assignment.fromJson(e)).toList();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addMaterial({
    required String courseId,
    required String title,
    required String type,
    String description = "",
    String url = "",
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    await api.postMultipart(
      "/api/materials",
      fields: {
        "courseId": courseId,
        "title": title,
        "description": description,
        "type": type,
        "url": url,
      },
      bytes: fileBytes,
      filename: fileName,
    );

    await loadAll(courseId);
  }

  Future<void> deleteMaterial(String courseId, String id) async {
    await api.delete("/api/materials/$id");
    await loadAll(courseId);
  }

  Future<void> addAssignment({
    required String courseId,
    required String title,
    required String instructions,
    required DateTime dueDate,
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    await api.postMultipart(
      "/api/assignments",
      fields: {
        "courseId": courseId,
        "title": title,
        "instructions": instructions,
        "dueDate": dueDate.toIso8601String(),
      },
      bytes: fileBytes,
      filename: fileName,
    );

    await loadAll(courseId);
  }

  Future<void> deleteAssignment(String courseId, String id) async {
    await api.delete("/api/assignments/$id");
    await loadAll(courseId);
  }
}
