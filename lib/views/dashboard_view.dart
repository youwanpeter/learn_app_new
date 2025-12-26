import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_footer.dart';
import '../widgets/progress_card.dart';
import '../widgets/analytics_chart.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DashboardViewModel>(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const DashboardHeader(),
          Expanded(
            child: vm.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: EdgeInsets.all(w * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Courses section
                        Text(
                          "Your Courses",
                          style: TextStyle(
                            fontSize: w * 0.027,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: h * 0.015),

                        if (vm.progressList.isEmpty)
                          const Text(
                            "No progress data available",
                            style: TextStyle(color: Colors.grey),
                          )
                        else
                          ...vm.progressList.map((course) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: h * 0.018),
                              child: ProgressCard(course: course),
                            );
                          }),

                        SizedBox(height: h * 0.025),

                        ///Analytics section
                        Text(
                          "Weekly Analytics",
                          style: TextStyle(
                            fontSize: w * 0.027,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        ///Chart
                        Container(
                          height: h * 0.3,
                          padding: EdgeInsets.all(w * 0.04),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 0.02),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 0, 0),
                                Color.fromARGB(255, 138, 4, 4),
                              ],
                            ),
                          ),
                          child: vm.analyticsAvailable
                              ? const AnalyticsChart()
                              : const Center(
                                  child: Text(
                                    "Please connect to the internet to view analytics",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                        ),

                        SizedBox(height: h * 0.03),

                        ///Stats 
                        if (vm.analytics != null)
                          Row(
                            children: [
                              _StatTile(
                                icon: Icons.book_rounded,
                                label: "Lessons",
                                value: vm.analytics!.lessonsCompleted
                                    .toString(),
                                w: w,   
                              ),
                              SizedBox(width: w * 0.02),
                              _StatTile(
                                icon: Icons.star_rounded,
                                label: "Quiz Avg",
                                value:
                                    "${vm.analytics!.averageQuizScore}%",
                                w: w,    
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
          ),

          const DashboardFooter(currentIndex: 0),
        ],
      ),
    );
  }
}

///Stat tile
class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double w;

  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(w * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(w * 0.02),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blueAccent),
            SizedBox(height: w * 0.02),
            Text(
              value,
              style: TextStyle(
                fontSize: w * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
