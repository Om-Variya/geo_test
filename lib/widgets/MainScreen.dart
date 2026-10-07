import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/dashboard_screen.dart';
import 'package:geo_test/Screen/UserScreen/inventory.dart';
import 'package:geo_test/Screen/UserScreen/machines_screen.dart';
import 'package:geo_test/Screen/UserScreen/reports_screen.dart';
import 'package:geo_test/Screen/UserScreen/profile.dart';
import '../../widgets/top_nav_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/app_drawer.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardBody(), // Index 0: Dashboard
    const ReportsScreen(), // Index 1: Reports
    const MachinesScreen(), // Index 2: Machines
    const InventoryScreen(), // Index 3: Inventory
    const ProfileScreen(), // Index 4: Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopNavBar(),
      drawer: const AppDrawer(),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
