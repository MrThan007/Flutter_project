import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Sok Dara", "course": "IT", "status": "Active"},
    {"id": 2, "name": "Chantha", "course": "Business", "status": "Active"},
    {"id": 3, "name": "Visal", "course": "Design", "status": "Inactive"},
  ];

  void addStudent() {
    TextEditingController name = TextEditingController();
    TextEditingController course = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: "Student Name"),
              ),
              TextField(
                controller: course,
                decoration: const InputDecoration(labelText: "Course"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  students.add({
                    "id": students.length + 1,
                    "name": name.text,
                    "course": course.text,
                    "status": "Active"
                  });
                });

                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Management"),
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addStudent,
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Student List",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Course")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Action")),
                  ],
                  rows: students.asMap().entries.map((entry) {

                    int index = entry.key;
                    var student = entry.value;

                    return DataRow(cells: [

                      DataCell(Text(student["id"].toString())),
                      DataCell(Text(student["name"])),
                      DataCell(Text(student["course"])),
                      DataCell(Text(student["status"])),

                      DataCell(
                        Row(
                          children: [

                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () {},
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                deleteStudent(index);
                              },
                            ),

                          ],
                        ),
                      )
                    ]);

                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}