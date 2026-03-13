import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grades & Performance",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Spring Semester 2026",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // 1. Performance Overview Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.4,
              children: [
                _buildStatCard("Current GPA", "3.75", Icons.workspace_premium, Colors.amber),
                _buildStatCard("Total Credits", "20", null, Colors.transparent),
                _buildStatCard("Completed", "28", null, Colors.transparent),
                _buildStatCard("Pending", "8", null, Colors.transparent),
              ],
            ),
            const SizedBox(height: 30),

            // 2. Subject Grade Details
            _buildCourseGradeCard(
              code: "CS401",
              title: "Database Systems",
              currentGrade: "90.2%",
              letterGrade: "A",
              assignments: [
                {"name": "Assignment 1", "score": "95/100", "weight": "10%", "status": "95.0%"},
                {"name": "Assignment 2", "score": "88/100", "weight": "10%", "status": "88.0%"},
                {"name": "Midterm", "score": "87/100", "weight": "30%", "status": "87.0%"},
                {"name": "Final Project", "score": "-", "weight": "30%", "status": "Pending"},
                {"name": "Participation", "score": "18/20", "weight": "20%", "status": "90.0%"},
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildStatCard(String title, String value, IconData? icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title Text - Size 13 or 14 is best for labels
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'regular', // Using your Khmer-supported font
                ),
              ),
              if (icon != null) Icon(icon, color: iconColor, size: 24),
            ],
          ),
          // Value Text - Size 26 or 28 makes the number stand out
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGradeCard({
    required String code,
    required String title,
    required String currentGrade,
    required String letterGrade,
    required List<Map<String, String>> assignments,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCodeChip(code),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(currentGrade, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Text("Current Grade", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(width: 15),
                  _buildLetterGrade(letterGrade),
                  const SizedBox(width: 10),
                  const Icon(Icons.trending_up, color: Colors.green, size: 20),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),

          // Assignment Table Header
          Row(
            children: const [
              Expanded(flex: 2, child: Text("Assignment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              Expanded(child: Text("Score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              Expanded(child: Text("Weight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              Expanded(child: Center(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)))),
            ],
          ),
          const Divider(height: 30),

          // Assignment Rows
          ...assignments.map((data) => _buildAssignmentRow(data)),
        ],
      ),
    );
  }

  Widget _buildAssignmentRow(Map<String, String> data) {
    bool isPending = data["status"] == "Pending";
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(data["name"]!, style: const TextStyle(fontSize: 13))),
          Expanded(child: Text(data["score"]!, style: const TextStyle(fontSize: 13))),
          Expanded(child: Text(data["weight"]!, style: const TextStyle(fontSize: 13))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isPending ? Colors.grey.shade50 : Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: isPending ? Border.all(color: Colors.grey.shade200) : null,
              ),
              child: Center(
                child: Text(
                  data["status"]!,
                  style: TextStyle(
                    color: isPending ? Colors.black54 : Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeChip(String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(code, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLetterGrade(String grade) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D2B), // Dark Navy/Black
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          grade,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text("SPI SMS"),
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white)),
      IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.white)),
    ],
    backgroundColor: Colors.greenAccent,
    foregroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 80,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
  );
}
Widget _drawerItem(IconData icon, String title, Color color, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: color, size: 28),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
    onTap: onTap,
    visualDensity: const VisualDensity(vertical: -1), // Tighter spacing like the image
  );
}
