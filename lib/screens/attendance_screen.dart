import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
              "Attendance Tracking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Spring Semester 2026",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // 1. Overall Attendance Card
            _buildOverallAttendanceCard(),

            const SizedBox(height: 25),

            // 2. Individual Subject Card
            _buildSubjectAttendanceCard(
              code: "CS401",
              title: "Database Systems",
              percentage: "92.9%",
              present: 26,
              absent: 2,
              late: 0,
              total: 28,
              recentAttendance: [
                {"date": "Jan 13, 2026", "status": "Present", "time": "9:05 AM"},
                {"date": "Jan 11, 2026", "status": "Present", "time": "9:02 AM"},
                {"date": "Jan 8, 2026", "status": "Absent", "time": "-"},
                {"date": "Jan 6, 2026", "status": "Present", "time": "9:00 AM"},
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- UI Components Matching Your Images ---

  Widget _buildOverallAttendanceCard() {
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
          const Text("Overall Attendance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem("Total Classes", "112", Colors.black),
              _statItem("Attended", "107", Colors.green),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem("Absent", "5", Colors.red),
              _statItem("Late", "3", Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Percentage", style: TextStyle(color: Colors.grey, fontSize: 13)),
          const Text("95.5%", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.955,
              minHeight: 8,
              backgroundColor: Color(0xFFEEEEEE),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectAttendanceCard({
    required String code,
    required String title,
    required String percentage,
    required int present,
    required int absent,
    required int late,
    required int total,
    required List<Map<String, String>> recentAttendance,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCodeChip(code),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(percentage, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("$present/$total Classes", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              )
            ],
          ),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Row(
            children: [
              _miniStat(Icons.check_circle_outline, "Present", present, Colors.green),
              const SizedBox(width: 15),
              _miniStat(Icons.cancel_outlined, "Absent", absent, Colors.red),
              const SizedBox(width: 15),
              _miniStat(Icons.access_time, "Late", late, Colors.orange),
            ],
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: present / total,
              minHeight: 6,
              backgroundColor: const Color(0xFFEEEEEE),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(height: 25),
          const Text("Recent Attendance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 10),
          ...recentAttendance.map((record) => _buildRecentRow(record)),
        ],
      ),
    );
  }

  // --- Sub-Widgets ---

  Widget _statItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }

  Widget _miniStat(IconData icon, String label, int count, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 5),
        Text("$label: ", style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text("$count", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCodeChip(String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(6), border: Border.all(color: Colors.grey.shade200)),
      child: Text(code, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildRecentRow(Map<String, String> record) {
    bool isPresent = record["status"] == "Present";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(record["date"]!, style: const TextStyle(fontSize: 13, color: Colors.black87)),
          _statusChip(record["status"]!),
          Text(record["time"]!, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _statusChip(String status) {
    bool isPresent = status == "Present";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPresent ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
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
