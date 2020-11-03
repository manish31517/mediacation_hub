import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_covid_dashboard_ui/screens/Awarness_info.dart';
import 'package:flutter_covid_dashboard_ui/screens/hospital.dart';
import 'package:flutter_covid_dashboard_ui/screens/screens.dart';
class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StatsScreen(),
    Hospital(),
    AwarnessInfo(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        //selectedItemColor: Colors.white,
        unselectedItemColor: Colors.pink,
        elevation: 0.0,
        items:
            [Icons.home, Icons.insert_chart, Icons.local_hospital, Icons.info]
                .asMap()
                .map((key, value) => MapEntry(
                      key,
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          value,
                          color: Colors.green,
                          size: 28,
                        ),
                        title: Text(''),
                        icon: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: _currentIndex == key
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(value),
                        ),
                      ),
                    ))
                .values
                .toList(),
      ),
    );
  }
}
