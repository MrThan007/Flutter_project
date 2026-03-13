import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 15),
      //       child: OutlinedButton.icon(
      //         onPressed: () {},
      //         icon: const Icon(Icons.edit, size: 18, color: Colors.black),
      //         label: const Text("Edit Profile", style: TextStyle(color: Colors.black)),
      //         style: OutlinedButton.styleFrom(
      //           backgroundColor: Colors.white,
      //           side: const BorderSide(color: Colors.black),
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // 1. Header Profile Section
            _buildHeaderSection(),
            const SizedBox(height: 25),

            // 2. Personal Information Section
            _buildSectionContainer(
              title: "Personal Information",
              children: [
                _buildInfoField("Full Name", "John Anderson"),
                _buildInfoField("Email", "kolsoka272@gmail.com"),
                _buildInfoField("Phone Number", "+1 (555) 123-4567"),
                _buildInfoField("Emergency Contact", "+1 (555) 987-6543"),
                _buildInfoField("Address", "123 University Ave, City, State 12345"),
              ],
            ),
            const SizedBox(height: 20),

            // 3. Academic Information Section
            _buildSectionContainer(
              title: "Academic Information",
              icon: Icons.book_outlined,
              children: [
                _buildInfoField("Student ID", "STU2023001"),
                _buildInfoField("Department", "Computer Science"),
                _buildInfoField("Enrollment Date", "Sep 1, 2023"),
                _buildInfoField("Academic Status", "Good Standing", isStatus: true),
              ],
            ),
            const SizedBox(height: 20),

            // 4. Security Settings
            _buildSectionContainer(
              title: "Security Settings",
              children: [
                _buildSecurityButton("Change Password"),
                _buildSecurityButton("Enable Two-Factor Authentication"),
                _buildSecurityButton("Manage Connected Devices"),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- Helper UI Methods ---

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          // 1. Align the Edit Button to the top right
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, size: 16, color: Colors.black),
              label: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),

          // 2. Profile Avatar (JA)
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFF3F4F6),
            child: Text(
              "JA",
              style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 15),

          // 3. User Name & ID
          const Text(
            "John Anderson",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "STU2023001",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),

          const SizedBox(height: 10),

          // 4. Department Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Text(
              "Computer Science",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 15),

          // 5. Change Photo Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: const Text("Change Photo", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContainer({required String title, IconData? icon, required List<Widget> children}) {
    return Container(
      width: double.infinity,
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
            children: [
              if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, String value, {bool isStatus = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          if (isStatus)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.green.shade500, borderRadius: BorderRadius.circular(8)),
              child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
              child: Text(value, style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ),
        ],
      ),
    );
  }

  Widget _buildSecurityButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
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
