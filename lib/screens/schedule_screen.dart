import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

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
              "Class Schedule",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Spring Semester 2026 • Week of Jan 13-17",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Column(
                children: [
                  const Text(
                    "Weekly Schedule",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Monday
                  _buildDayHeader("Monday", "Jan 13"),
                  _buildScheduleCard("CS201", "2:00 PM - 3:00 PM", "Room 301", const Color(0xFF00C853)),
                  _buildScheduleCard("CS250", "3:30 PM - 5:00 PM", "Lab 308", const Color(0xFF00BFA5)),

                  const SizedBox(height: 20),

                  // Tuesday
                  _buildDayHeader("Tuesday", "Jan 14"),
                  _buildScheduleCard("CS405", "2:00 PM - 3:30 PM", "Lab 105", const Color(0xFFFF6D00)),
                  _buildScheduleCard("CS302", "11:00 AM - 12:30 PM", "Room 405", const Color(0xFFAA00FF)),

                  const SizedBox(height: 20),

                  // Wednesday
                  _buildDayHeader("Wednesday", "Jan 15"),
                  _buildScheduleCard("CS401", "9:00 AM - 10:30 AM", "Lab 203", const Color(0xFF2979FF)),

                  const SizedBox(height: 20),

                  // Thursday
                  _buildDayHeader("Thursday", "Jan 16"),
                  _buildScheduleCard("CS101", "8:30 AM - 10:00 AM", "Room 202", Colors.pinkAccent),
                  _buildScheduleCard("CS210", "1:00 PM - 2:30 PM", "Lab 305", Colors.cyan),

                  const SizedBox(height: 20),

                  // Friday
                  _buildDayHeader("Friday", "Jan 17"),
                  _buildScheduleCard("CS330", "10:30 AM - 12:00 PM", "Room 101", Colors.amber),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDayHeader(String day, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'regular'),
          ),
          Text(
            date,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String code, String time, String location, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white70, size: 14),
              const SizedBox(width: 5),
              Text(time, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white70, size: 14),
              const SizedBox(width: 5),
              Text(location, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ],
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
