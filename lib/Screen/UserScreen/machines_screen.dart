import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/add_machine_screen.dart';
import 'package:geo_test/Screen/UserScreen/machine_details_screen.dart';

class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // The parent MainScreen handles the App Bar and Bottom Nav.
      // We use a Scaffold here solely to position the Floating Action Button.
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 24),

            // Machines List
            Expanded(
              child: ListView(
                children: const [
                  MachineCard(
                    title: 'Lathe Machine',
                    subtitle: '(ABC-020)',
                    isActive: true,
                    // Placeholder icon. Replace with Image.asset() when ready.
                    iconData: Icons.precision_manufacturing,
                  ),
                  SizedBox(height: 16),
                  MachineCard(
                    title: 'CBR Testing Machine',
                    subtitle: '(CBR-002)',
                    isActive: false,
                    iconData: Icons.science,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigates to Add New Machines page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMachineScreen()),
          );
        },
        backgroundColor: const Color(0xFF2554C7),
        shape: const CircleBorder(),
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search machines...',
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// ==========================================
// REUSABLE MACHINE CARD WIDGET
// ==========================================
class MachineCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final IconData iconData;

  const MachineCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to MachineDetailsScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MachineDetailsScreen(
              title: title,
              code: subtitle,
              isActive: isActive,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Icon(iconData, size: 32, color: Colors.blueGrey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isActive
                            ? Colors.green.shade400
                            : Colors.red.shade400,
                        width: 0.5,
                      ),
                    ),
                    child: Text(
                      isActive ? 'ACTIVE' : 'INACTIVE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isActive
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}
