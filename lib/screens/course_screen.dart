import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

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
              "My Courses",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Spring Semester 2026",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildCourseCard(
              code: "CS401",
              title: "Database Systems",
              instructor: "Dr. Sarah Johnson",
              year: "2026",
              room: "Lab 203",
              department: "Computer Science",
              credits: "3 Credits",
              enrollment: "45/50 students",
              imagePath: 'assets/courses/db.png', // Replace with your image
            ),
            _buildCourseCard(
              code: "CS302",
              title: "Web Development",
              instructor: "Prof. Michael Chen",
              year: "2026",
              room: "Room 405",
              department: "Computer Science",
              credits: "4 Credits",
              enrollment: "38/40 students",
              imagePath: 'assets/courses/web.png', // Replace with your image
            ),_buildCourseCard(
              code: "CS302",
              title: "Web Development",
              instructor: "Prof. Michael Chen",
              year: "2026",
              room: "Room 405",
              department: "Computer Science",
              credits: "4 Credits",
              enrollment: "38/40 students",
              imagePath: 'assets/courses/web.png', // Replace with your image
            ),_buildCourseCard(
              code: "CS302",
              title: "Web Development",
              instructor: "Prof. Michael Chen",
              year: "2026",
              room: "Room 405",
              department: "Computer Science",
              credits: "4 Credits",
              enrollment: "38/40 students",
              imagePath: 'assets/courses/web.png', // Replace with your image
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String code,
    required String title,
    required String instructor,
    required String year,
    required String room,
    required String department,
    required String credits,
    required String enrollment,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(code, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Column
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _infoRow(Icons.school_outlined, instructor, Colors.blue),
                    _infoRow(Icons.calendar_today_outlined, year, Colors.green),
                    _infoRow(Icons.location_on_outlined, room, Colors.purple),
                    _infoRow(Icons.business_outlined, department, Colors.indigo),
                    _infoRow(Icons.workspace_premium_outlined, credits, Colors.orange),
                  ],
                ),
              ),
              // Image with Badge
              Expanded(
                flex: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          code,
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Enrollment", style: TextStyle(color: Colors.grey)),
              Text(enrollment, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
