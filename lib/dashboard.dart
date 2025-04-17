import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/view/home.dart';
import 'package:nba_flutter_app/learn/view/cubit/learn_cubit.dart';
import 'package:nba_flutter_app/learn/view/learn.dart';

enum DashboardTab { home, learn }

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardTab _selectedTab = DashboardTab.home;

  final Map<DashboardTab, Widget> _tabScreens = {
    DashboardTab.home: BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Home(),
    ),
    DashboardTab.learn: BlocProvider(
      create: (context) => LearnCubit(),
      child: Learn(),
    ), // Replace with actual Profile widget
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = DashboardTab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabScreens[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        backgroundColor: Colors.black,
        currentIndex: _selectedTab.index,
        selectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white.withOpacity(0.6),
        ),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/learn.png', width: 24, height: 24),
            label: 'Learn',
          ),
        ],
      ),
    );
  }
}
