import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Profile Image Placeholder
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 24),
            
            // User Name
            const Text(
              'Om Variya',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            
            // Settings Options
            _buildSettingsOption('Edit Profile', onTap: () {}),
            _buildSettingsOption('About App', onTap: () {}),
            _buildSettingsOption('Notifications', onTap: () {}),
            _buildSettingsOption('Privacy Policy', onTap: () {}),
            _buildSettingsOption('Terms & Conditions', onTap: () {}),
            
            const SizedBox(height: 40),
            
            // Log Out Button
            InkWell(
              onTap: () {
                // Add logout logic here
              },
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.red.shade300, width: 1.5),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Bottom padding
          ],
        ),
      ),
    );
  }

  // Reusable widget for the list items
  Widget _buildSettingsOption(String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}