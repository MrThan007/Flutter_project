import 'package:final_project/screens/profile_screen.dart';
import 'package:final_project/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'course_screen.dart';
import 'attendance_screen.dart';
import 'grades_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      drawer: Drawer(
        backgroundColor: const Color(
          0xFFC7DEED,
        ), // Matches the light blue in the image
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            // 1. Custom Header with Logo
            Container(
              padding: const EdgeInsets.only(top: 60, left: 20, bottom: 20),
              child: Row(
                children: [
                  // Circular Logo Placeholder
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color:
                          Colors.white, // Changed to white so the logo is clear
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip
                        .antiAlias, // This keeps the image perfectly circular
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover, // Makes the logo fill the circle
                      errorBuilder: (context, error, stackTrace) {
                        // This shows a placeholder if the image file is missing
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'វិទ្យាស្ថានសន្តប៉ូល',
                        style: TextStyle(
                          fontFamily:
                              'regular', // Matches the family name in pubspec
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Saint Paul Institute",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: Color(0xFF9ABBD3), thickness: 1, height: 1),

            // 2. Profile Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage(
                      'assets/profile/img1.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Yit Than",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 3. Navigation List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(Icons.home, "Home", Colors.green[900]!, () {
                    Navigator.pop(context);
                  }),
                  _drawerItem(
                    Icons.book_outlined,
                    "Courses",
                    Colors.purpleAccent,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerItem(
                    Icons.calendar_month,
                    "Schedule",
                    Colors.green,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScheduleScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerItem(Icons.access_time, "Attendance", Colors.blue, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendanceScreen(),
                      ),
                    );
                  }),
                  _drawerItem(
                    Icons.edit_note,
                    "Current GPA",
                    Colors.grey[700]!,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GradesScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerItem(
                    Icons.person_outline,
                    "My Profile",
                    Colors.blueAccent,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerItem(Icons.logout, "Logout", Colors.black, () {
                    Navigator.pop(context);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false, // This removes all previous routes
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            const Text(
              "Welcome back, Than!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Information technology",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 35),

            // 2. Modern Stat Cards (Replacing your old Rows)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.3,
              children: [
                _buildStatCard(
                  "Attendance Rate",
                  "92%",
                  Icons.access_time,
                  Colors.blue,
                ),
                _buildStatCard(
                  "Current GPA",
                  "3.75",
                  Icons.trending_up,
                  Colors.green,
                ),
                _buildStatCard(
                  "Active Courses",
                  "6",
                  Icons.book_outlined,
                  Colors.purple,
                ),
                _buildStatCard(
                  "Credits Earned",
                  "98",
                  Icons.workspace_premium_outlined,
                  Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 3. Upcoming Classes Section (Replacing DataTable)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Upcoming Classes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildClassItem(
                    "Database Systems",
                    "9:00 AM - 10:30 AM",
                    "Lab 203",
                    "Today",
                    true,
                  ),
                  _buildClassItem(
                    "Web Development",
                    "11:00 AM - 12:30 PM",
                    "Room 405",
                    "Today",
                    true,
                  ),
                  _buildClassItem(
                    "Data Structures",
                    "2:00 PM - 3:30 PM",
                    "Room 301",
                    "Tomorrow",
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modern Stat Card Widget
  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15, // Increased title font size
                    fontFamily: 'regular', // Applied your custom font
                    fontWeight: FontWeight.w900,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, color: color, size: 25), // Slightly larger icon
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26, // Increased value font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Upcoming Class Item Widget
  Widget _buildClassItem(
    String name,
    String time,
    String room,
    String day,
    bool isToday,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              Text(
                room,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isToday ? Colors.black : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              day,
              style: TextStyle(
                color: isToday ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

Widget _drawerItem(
  IconData icon,
  String title,
  Color color,
  VoidCallback onTap,
) {
  return ListTile(
    leading: Icon(icon, color: color, size: 28),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
    onTap: onTap,
    visualDensity: const VisualDensity(
      vertical: -1,
    ), // Tighter spacing like the image
  );
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text("SPI SMS"),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.settings, color: Colors.white),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.share, color: Colors.white),
      ),
    ],
    backgroundColor: Colors.greenAccent,
    foregroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 80,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
    ),
  );
}
