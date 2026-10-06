import 'package:flutter/material.dart';
import 'package:geo_test/Screen/AuthScreen/login.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header matching your dark theme
          Expanded(
            flex: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              color: const Color(0xFF222222), // Matches top app bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF333333),
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Om Variya', // Pre-filled with user context
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'om@geotest.com',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildMenuItem(Icons.dashboard_outlined, 'Dashboard', () {
                  Navigator.pop(context); // Closes the drawer
                }),
                _buildMenuItem(Icons.article_outlined, 'My Reports', () {}),
                _buildMenuItem(
                  Icons.precision_manufacturing_outlined,
                  'Machine Status',
                  () {},
                ),
                _buildMenuItem(
                  Icons.inventory_2_outlined,
                  'Inventory Management',
                  () {},
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Divider(color: Color(0xFFF3F4F6), thickness: 1),
                ),
                _buildMenuItem(Icons.settings_outlined, 'Settings', () {}),
                _buildMenuItem(Icons.help_outline, 'Help & Support', () {}),
              ],
            ),
          ),

          // Logout Button at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildMenuItem(
              Icons.logout,
              'Logout',
              () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                ); // Navigate to login screen
              },
              iconColor: Colors.red.shade600,
              textColor: Colors.red.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build consistent menu items
  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color iconColor = const Color(0xFF4B5563),
    Color textColor = const Color(0xFF111827),
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      horizontalTitleGap: 0,
      onTap: onTap,
    );
  }
}
