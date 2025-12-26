import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/notification_vm.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NotificationVM>();

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.builder(
        itemCount: vm.notifications.length,
        itemBuilder: (_, i) {
          final n = vm.notifications[i];
          return ListTile(
            leading: Icon(
              n.type == "course" ? Icons.book : Icons.play_circle,
              color: Colors.indigo,
            ),
            title: Text(n.message),
            subtitle: Text(n.createdAt),
          );
        },
      ),
    );
  }
}
