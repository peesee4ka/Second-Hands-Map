import 'package:flutter/material.dart';
import 'package:proj_13_04_2026_1/HomePage.dart';
import 'package:proj_13_04_2026_1/ProfilePage.dart';
import 'package:proj_13_04_2026_1/MapPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final List<Widget> screens = [
    Profilepage(),
    MapPage(),
    Profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              setState(() => currentIndex = index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Main',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: 'Account',
              ),
            ],
      ),
    )
    );
  }
}
