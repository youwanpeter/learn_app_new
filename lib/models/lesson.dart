class Lesson {
  final String id;
  final String title;
  final String courseId;

  Lesson({
    required this.id,
    required this.title,
    required this.courseId,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'] ?? json['id'],
      title: json['title'],
      courseId: json['courseId'],
    );
  }
}
