class Assignment {
  final String id;
  final String courseId;
  final String title;
  final String instructions;
  final DateTime dueDate;
  final String attachmentUrl;

  Assignment({
    required this.id,
    required this.courseId,
    required this.title,
    required this.instructions,
    required this.dueDate,
    required this.attachmentUrl,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
    id: json["_id"],
    courseId: json["courseId"],
    title: json["title"],
    instructions: json["instructions"] ?? "",
    dueDate: DateTime.parse(json["dueDate"]),
    attachmentUrl: json["attachmentUrl"] ?? "",
  );
}
