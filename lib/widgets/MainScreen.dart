import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/dashboard_screen.dart';
import 'package:geo_test/Screen/UserScreen/machines_screen.dart';
import '../../widgets/top_nav_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/app_drawer.dart';
import 'package:geo_test/Screen/UserScreen/inventory.dart';
// Ensure this imports your DashboardBody

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens for each bottom nav tab
  final List<Widget> _pages = [
    const DashboardBody(), // Index 0: Dashboard
    const MachinesScreen(), // Index 1: Machines
    const Center(
      child: Text('Machines Page'),
    ), // Index 2: Replace with Machines body
    const InventoryScreen(), // Redirect to InventoryScreen
    const Center(
      child: Text('Profile Page'),
    ), // Index 4: Replace with Profile body
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
      appBar: const TopNavBar(), // Persistent Top Bar
      drawer: const AppDrawer(), // Persistent Drawer
      body: SafeArea(
        // The body changes based on the selected tab
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ), // Persistent Bottom Bar
    );
  }
}
