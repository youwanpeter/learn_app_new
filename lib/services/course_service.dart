import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseService {
  final String token;
  final String baseUrl = "http://10.0.2.2:5000/api/courses";

  CourseService({required this.token});

  Map<String, String> get _headers => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  Future<List<dynamic>> fetchCourses() async {
    final res = await http.get(Uri.parse(baseUrl), headers: _headers);
    return jsonDecode(res.body);
  }

  Future<void> createCourse({
    required String title,
    required String description,
  }) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: _headers,
      body: jsonEncode({"title": title, "description": description}),
    );
  }

  Future<void> updateCourse({
    required String id,
    required String title,
    required String description,
  }) async {
    await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: _headers,
      body: jsonEncode({"title": title, "description": description}),
    );
  }

  Future<void> deleteCourse(String id) async {
    await http.delete(
      Uri.parse("$baseUrl/$id"),
      headers: _headers,
    );
  }
}
