class StudyMaterial {
  final String id;
  final String courseId;
  final String title;
  final String description;
  final String type; // pdf, video, link
  final String url;
  final String fileUrl;

  StudyMaterial({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.type,
    required this.url,
    required this.fileUrl,
  });

  factory StudyMaterial.fromJson(Map<String, dynamic> json) => StudyMaterial(
    id: json["_id"],
    courseId: json["courseId"],
    title: json["title"],
    description: json["description"] ?? "",
    type: json["type"],
    url: json["url"] ?? "",
    fileUrl: json["fileUrl"] ?? "",
  );
}
