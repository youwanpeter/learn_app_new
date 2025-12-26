import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/lesson.dart';
import '../../viewmodels/lesson_vm.dart';

class LessonListScreen extends StatefulWidget {
  final String role;
  final String courseId;

  const LessonListScreen({
    super.key,
    required this.role,
    required this.courseId,
  });

  @override
  State<LessonListScreen> createState() => _LessonListScreenState();
}

class _LessonListScreenState extends State<LessonListScreen> {
  bool _loaded = false;

  bool get canEdit =>
      widget.role == "lecturer" || widget.role == "admin";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loaded) {
      context.read<LessonVM>().loadLessons(widget.courseId);
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LessonVM>();

    return Scaffold(
      appBar: AppBar(title: const Text("Lessons")),
      floatingActionButton: canEdit
          ? FloatingActionButton(
        onPressed: () => _openDialog(context),
        child: const Icon(Icons.add),
      )
          : null,
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : vm.lessons.isEmpty
          ? const Center(child: Text("No lessons yet"))
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vm.lessons.length,
        itemBuilder: (_, i) {
          final lesson = vm.lessons[i];

          return Card(
            color: Colors.blueGrey.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const Icon(Icons.play_circle,
                  color: Colors.teal),
              title: Text(
                lesson.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600),
              ),
              trailing: canEdit
                  ? PopupMenuButton<String>(
                onSelected: (v) {
                  if (v == "edit") {
                    _openDialog(context, lesson: lesson);
                  }
                  if (v == "delete") {
                    context
                        .read<LessonVM>()
                        .deleteLesson(
                        lesson.id, widget.courseId);
                    _notify(context, "Lesson deleted");
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: "edit",
                      child: Text("Edit")),
                  PopupMenuItem(
                      value: "delete",
                      child: Text("Delete")),
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

  void _openDialog(BuildContext context, {Lesson? lesson}) {
    final ctrl = TextEditingController(text: lesson?.title ?? "");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(lesson == null ? "Add Lesson" : "Edit Lesson"),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(labelText: "Lesson title"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final vm = context.read<LessonVM>();
              if (lesson == null) {
                vm.addLesson(widget.courseId, ctrl.text);
                _notify(context, "Lesson added");
              } else {
                vm.updateLesson(lesson.id, ctrl.text);
                _notify(context, "Lesson updated");
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
      SnackBar(
        backgroundColor: Colors.indigo,
        content: Text(msg),
      ),
    );
  }
}
