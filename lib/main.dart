import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/api.dart';
import 'utils/jwt_helper.dart';
import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/feature2_viewmodel.dart';
import 'views/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = "http://10.0.2.2:5000";

    const String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImxlY3QxIiwicm9sZSI6ImxlY3R1cmVyIiwiaWF0IjoxNzY2MTIwMjAxLCJleHAiOjE3NjY3MjUwMDF9.LFAW1G61bG-TB9ImU4SdGRS4Sti8oN0ILscNUVhIs_s"; // student token

    final String userRole = getRoleFromJwt(token); // 👈 KEY LINE

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final vm = DashboardViewModel();
            vm.loadDashboard();
            return vm;
          },
        ),

        ChangeNotifierProvider(
          create: (_) => Feature2ViewModel(
            api: Api(baseUrl: baseUrl, token: token),
          ),
        ),

        // 👇 Make role globally available
        Provider<String>.value(value: userRole),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
        home: const DashboardView(),
      ),
    );
  }
}
