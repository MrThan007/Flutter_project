import 'package:final_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

// import 'event2/evt.dart';
// import 'event2/evt2.dart';
// import 'form/form1.dart';
// import 'homeworks/homework8.dart';
// import 'homeworks/homework2.dart';
// import 'homeworks/homework4.dart';
// import 'homeworks/homework6.dart';
// import 'homeworks/homework7.dart';
// import 'homeworks/homework9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SPI APP",
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // ================= AppBar =================
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



}

