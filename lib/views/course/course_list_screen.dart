import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/course.dart';
import '../../viewmodels/course_vm.dart';

class CourseListScreen extends StatelessWidget {
  final String role;

  const CourseListScreen({super.key, required this.role});

  bool get canEdit => role == "lecturer" || role == "admin";

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CourseVM>();

    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      floatingActionButton: canEdit
          ? FloatingActionButton(
        onPressed: () => _openDialog(context),
        child: const Icon(Icons.add),
      )
          : null,
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vm.courses.length,
        itemBuilder: (_, i) {
          final course = vm.courses[i];

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Icon(Icons.book, color: Colors.white),
              ),

              //  CLICK COURSE → LESSONS
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/lessons',
                  arguments: {
                    'courseId': course.id,
                  },
                );
              },

              title: Text(
                course.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(course.description),

              //  EDIT / DELETE
              trailing: canEdit
                  ? PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "edit") {
                    _openDialog(context, course: course);
                  }
                  if (value == "delete") {
                    vm.deleteCourse(course.id);
                    _notify(context, "Course deleted");
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: "edit", child: Text("Edit")),
                  PopupMenuItem(
                      value: "delete", child: Text("Delete")),
                ],
              )
                  : null,
            ),
          );
        },
      ),
    );
  }

  // ================= ADD / EDIT =================

  void _openDialog(BuildContext context, {Course? course}) {
    final titleCtrl = TextEditingController(text: course?.title ?? "");
    final descCtrl =
    TextEditingController(text: course?.description ?? "");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(course == null ? "Add Course" : "Edit Course"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: "Description")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final vm = context.read<CourseVM>();
              if (course == null) {
                vm.addCourse(titleCtrl.text, descCtrl.text);
                _notify(context, "Course added");
              } else {
                vm.updateCourse(course.id, titleCtrl.text, descCtrl.text);
                _notify(context, "Course updated");
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _notify(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.indigo, content: Text(msg)),
    );
  }
}
