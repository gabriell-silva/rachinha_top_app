import 'package:flutter/material.dart';
import 'package:rachinha_top_app/pages/home.dart';
import 'package:rachinha_top_app/pages/sort_teams.dart';
import 'package:rachinha_top_app/pages/timer.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  List<Widget> pages = [
    const HomePage(),
    const SortTeamsPage(),
    const TimerPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "Sortear Times"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_sharp), label: "Temporizador"),
          ]),
    );
  }
}
