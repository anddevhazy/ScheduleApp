import 'package:flutter/material.dart';
import 'package:schedule_app/features/Add/presentation/pages/add_schedule_home_page.dart';
import 'package:schedule_app/features/View/presentation/pages/view_schedule_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //pages for navigation
  final List<Widget> _pages = [
    AddScheduleHomePage(),
    ViewScheduleHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hazy's Schedule Manager"),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Schedule'),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye_outlined),
              label: 'View Schedule'),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
