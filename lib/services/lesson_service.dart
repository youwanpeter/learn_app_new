import 'dart:convert';
import 'package:http/http.dart' as http;

class LessonService {
  final String token;
  final String baseUrl = "http://10.0.2.2:5000/api/lessons";

  LessonService({required this.token});

  Map<String, String> get _headers => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  Future<List<dynamic>> fetchLessons(String courseId) async {
    final res = await http.get(
      Uri.parse("$baseUrl?courseId=$courseId"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to load lessons");
    }

    return jsonDecode(res.body);
  }

  Future<void> createLesson({
    required String courseId,
    required String title,
  }) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: _headers,
      body: jsonEncode({
        "courseId": courseId,
        "title": title,
      }),
    );

    if (res.statusCode != 201 && res.statusCode != 200) {
      throw Exception("Failed to add lesson");
    }
  }

  Future<void> updateLesson({
    required String id,
    required String title,
  }) async {
    final res = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: _headers,
      body: jsonEncode({"title": title}),
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to update lesson");
    }
  }

  Future<void> deleteLesson(String id) async {
    final res = await http.delete(
      Uri.parse("$baseUrl/$id"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to delete lesson");
    }
  }
}
