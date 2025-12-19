import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../viewmodels/feature2_viewmodel.dart';
import '../../widgets/dashboard_header.dart';
import '../../widgets/dashboard_footer.dart';

class StudyMaterialsAssignmentsScreen extends StatefulWidget {
  final String courseId;

  const StudyMaterialsAssignmentsScreen({super.key, required this.courseId});

  @override
  State<StudyMaterialsAssignmentsScreen> createState() =>
      _StudyMaterialsAssignmentsScreenState();
}

class _StudyMaterialsAssignmentsScreenState
    extends State<StudyMaterialsAssignmentsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Feature2ViewModel>().loadAll(widget.courseId);
    });
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  bool _canEdit(BuildContext context) {
    final role = Provider.of<String>(context, listen: false);
    return ["lecturer", "staff", "admin"].contains(role);
  }

  Future<void> _openUrl(String raw) async {
    final uri = Uri.tryParse(raw);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<Feature2ViewModel>();
    final canEdit = _canEdit(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          DashboardHeader(),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            child: Row(
              children: [
                Icon(
                  Icons.school_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Study Hub",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TabBar(
              controller: _tabs,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
              ),
              tabs: const [
                Tab(text: "Materials"),
                Tab(text: "Assignments"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: vm.isLoading
                ? const Center(child: CircularProgressIndicator())
                : vm.error != null
                ? Center(
                    child: Text(
                      vm.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : TabBarView(
                    controller: _tabs,
                    children: [
                      _materialsTab(vm, canEdit),
                      _assignmentsTab(vm, canEdit),
                    ],
                  ),
          ),

          DashboardFooter(
            currentIndex: 2,
            onDashboardTap: () => Navigator.pop(context),
          ),
        ],
      ),

      floatingActionButton: canEdit
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text("Add"),
              onPressed: () {
                if (_tabs.index == 0) {
                  _addMaterialSheet(context);
                } else {
                  _addAssignmentSheet(context);
                }
              },
            )
          : null,
    );
  }

  // ================= MATERIALS TAB =================
  Widget _materialsTab(Feature2ViewModel vm, bool canEdit) {
    if (vm.materials.isEmpty) {
      return const Center(child: Text("No study materials added yet"));
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 110),
      itemCount: vm.materials.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) {
        final m = vm.materials[i];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            title: Text(
              m.title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              m.type == "pdf" ? "PDF • Tap to open" : "Link • Tap to open",
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.withOpacity(0.1),
              child: Icon(
                m.type == "pdf" ? Icons.picture_as_pdf : Icons.link,
                color: Colors.indigo,
              ),
            ),
            onTap: () async {
              if (m.type == "pdf" && m.fileUrl.isNotEmpty) {
                await _openUrl(m.fileUrl);
              } else if (m.url.isNotEmpty) {
                await _openUrl(m.url);
              }
            },
            trailing: canEdit
                ? IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => context
                        .read<Feature2ViewModel>()
                        .deleteMaterial(widget.courseId, m.id),
                  )
                : null,
          ),
        );
      },
    );
  }

  // ================= ASSIGNMENTS TAB =================
  Widget _assignmentsTab(Feature2ViewModel vm, bool canEdit) {
    if (vm.assignments.isEmpty) {
      return const Center(child: Text("No assignments available"));
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 110),
      itemCount: vm.assignments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) {
        final a = vm.assignments[i];
        final due = DateFormat("EEE, d MMM yyyy").format(a.dueDate);

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            title: Text(
              a.title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text("Due: $due"),
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFE8EAF6),
              child: Icon(Icons.assignment_outlined, color: Colors.indigo),
            ),
            onTap: () async {
              if (a.attachmentUrl.isNotEmpty) {
                await _openUrl(a.attachmentUrl);
              }
            },
            trailing: canEdit
                ? IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => context
                        .read<Feature2ViewModel>()
                        .deleteAssignment(widget.courseId, a.id),
                  )
                : null,
          ),
        );
      },
    );
  }

  // ================= ADD MATERIAL (PDF / LINK) =================
  Future<void> _addMaterialSheet(BuildContext context) async {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final urlCtrl = TextEditingController();

    String type = "pdf";
    Uint8List? fileBytes;
    String? fileName;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setLocal) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Study Material",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: type,
                items: const [
                  DropdownMenuItem(value: "pdf", child: Text("PDF Upload")),
                  DropdownMenuItem(value: "link", child: Text("External Link")),
                ],
                onChanged: (v) => setLocal(() => type = v ?? "pdf"),
                decoration: const InputDecoration(labelText: "Material Type"),
              ),
              const SizedBox(height: 12),

              if (type == "pdf")
                OutlinedButton.icon(
                  icon: const Icon(Icons.upload_file),
                  label: Text(
                    fileName == null ? "Pick PDF file" : "Selected: $fileName",
                  ),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ["pdf"],
                      withData: true,
                    );
                    if (result != null && result.files.single.bytes != null) {
                      setLocal(() {
                        fileBytes = result.files.single.bytes;
                        fileName = result.files.single.name;
                      });
                    }
                  },
                ),

              if (type == "link")
                TextField(
                  controller: urlCtrl,
                  decoration: const InputDecoration(labelText: "External URL"),
                ),

              const SizedBox(height: 16),
              FilledButton(
                onPressed: () async {
                  if (titleCtrl.text.trim().isEmpty) return;

                  await context.read<Feature2ViewModel>().addMaterial(
                    courseId: widget.courseId,
                    title: titleCtrl.text.trim(),
                    description: descCtrl.text.trim(),
                    type: type,
                    url: urlCtrl.text.trim(),
                    fileBytes: fileBytes,
                    fileName: fileName,
                  );

                  if (ctx.mounted) Navigator.pop(ctx);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ADD ASSIGNMENT (PDF UPLOAD) =================
  Future<void> _addAssignmentSheet(BuildContext context) async {
    final titleCtrl = TextEditingController();
    final instCtrl = TextEditingController();
    DateTime due = DateTime.now().add(const Duration(days: 7));

    Uint8List? fileBytes;
    String? fileName;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setLocal) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Assignment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: instCtrl,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Instructions"),
              ),
              const SizedBox(height: 10),

              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Due date"),
                subtitle: Text(DateFormat("EEE, d MMM yyyy").format(due)),
                trailing: const Icon(Icons.calendar_month),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: ctx,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialDate: due,
                  );
                  if (picked != null) setLocal(() => due = picked);
                },
              ),

              OutlinedButton.icon(
                icon: const Icon(Icons.attach_file),
                label: Text(
                  fileName == null
                      ? "Attach PDF (optional)"
                      : "Attached: $fileName",
                ),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ["pdf"],
                    withData: true,
                  );
                  if (result != null && result.files.single.bytes != null) {
                    setLocal(() {
                      fileBytes = result.files.single.bytes;
                      fileName = result.files.single.name;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),
              FilledButton(
                onPressed: () async {
                  if (titleCtrl.text.trim().isEmpty) return;

                  await context.read<Feature2ViewModel>().addAssignment(
                    courseId: widget.courseId,
                    title: titleCtrl.text.trim(),
                    instructions: instCtrl.text.trim(),
                    dueDate: due,
                    fileBytes: fileBytes,
                    fileName: fileName,
                  );

                  if (ctx.mounted) Navigator.pop(ctx);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
