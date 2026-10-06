import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/add_machine_screen.dart';
import 'package:geo_test/Screen/UserScreen/machine_details_screen.dart';

class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy machine data
    final List<Map<String, dynamic>> machines = [
      {
        'name': 'Lathe Machine',
        'code': 'ABC-020',
        'status': 'Active',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
        'icon': Icons.precision_manufacturing,
      },
      {
        'name': 'CBR Testing Machine',
        'code': 'CBR-002',
        'status': 'Inactive',
        'statusColor': Colors.red,
        'bgColor': Colors.red.shade50,
        'icon': Icons.science,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // ============================================================
      // BODY
      // ============================================================

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ========================================================
            // SEARCH BAR
            // ========================================================

            _buildSearchBar(),

            const SizedBox(height: 20),

            // ========================================================
            // MACHINES LIST
            // ========================================================

            Expanded(
              child: ListView.builder(
                itemCount: machines.length,
                itemBuilder: (context, index) {
                  final machine = machines[index];

                  return MachineCard(
                    name: machine['name'],
                    code: machine['code'],
                    status: machine['status'],
                    statusColor: machine['statusColor'],
                    bgColor: machine['bgColor'],
                    icon: machine['icon'],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // ADD MACHINE BUTTON
      // ============================================================

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMachineScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF1967D2),
        shape: const CircleBorder(),
        elevation: 2,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  // ================================================================
  // SEARCH BAR
  // Same design as Reports page
  // ================================================================

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Machines...',
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
        ),
      ),
    );
  }
}

// ==================================================================
// MACHINE CARD
// ==================================================================

class MachineCard extends StatelessWidget {
  final String name;
  final String code;
  final String status;
  final Color statusColor;
  final Color bgColor;
  final IconData icon;

  const MachineCard({
    super.key,
    required this.name,
    required this.code,
    required this.status,
    required this.statusColor,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      // ============================================================
      // SAME CARD DESIGN AS REPORTS
      // ============================================================

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),

          // ========================================================
          // CARD CLICK
          // ========================================================

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MachineDetailsScreen(
                  title: name,
                  code: code,
                  isActive: status == 'Active',
                ),
              ),
            );
          },

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // ==================================================
                // MACHINE ICON
                // ==================================================

                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.blueGrey,
                    size: 28,
                  ),
                ),

                const SizedBox(width: 14),

                // ==================================================
                // MACHINE INFORMATION
                // ==================================================

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        code,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // ==================================================
                // STATUS INDICATOR
                // Right side, next to arrow
                // ==================================================

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // ==================================================
                // ARROW
                // ==================================================

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
