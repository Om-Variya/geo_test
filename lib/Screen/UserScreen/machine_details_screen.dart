import 'package:flutter/material.dart';

class MachineDetailsScreen extends StatelessWidget {
  final String title;
  final String code;
  final bool isActive;

  const MachineDetailsScreen({
    super.key,
    required this.title,
    required this.code,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Machines Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: const Icon(
                      Icons.precision_manufacturing,
                      size: 36,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          code,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
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
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Specifications Details List
            _buildSpecRow('Machine Type', 'Compression Testing Machine'),
            _buildSpecRow('Manufacturer', 'Aimil'),
            _buildSpecRow('Model Number', 'CTM-2000'),
            _buildSpecRow('Purchase Date', '15 Jan 2024'),
            _buildSpecRow('Last Calibration', '12 Jan 2026'),
            _buildSpecRow(
              'Next Calibration',
              '12 Jan 2027',
              valueColor: const Color(0xFF2554C7),
            ),
            const SizedBox(height: 24),

            // Note Section Header
            const Text(
              'NOTE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2554C7),
              ),
            ),
            const SizedBox(height: 4),
            const Divider(color: Color(0xFFE5E7EB), thickness: 1),
            const SizedBox(height: 8),

            // Note Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: const Text(
                'A lathe machine is a tool that rotates a piece of material while a stationary cutting blade trims it down. It is mainly used to make round, symmetrical parts out of metal, wood, or plastic.',
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF374151),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Action Buttons Row (Edit, Change Status, Delete)
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    label: 'Edit',
                    bgColor: Colors.amber.shade100,
                    textColor: Colors.amber.shade900,
                    borderColor: Colors.amber.shade300,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    label: 'Change Stauts',
                    bgColor: Colors.indigo.shade100,
                    textColor: Colors.indigo.shade800,
                    borderColor: Colors.indigo.shade300,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    label: 'Delete',
                    bgColor: Colors.red.shade100,
                    textColor: Colors.red.shade700,
                    borderColor: Colors.red.shade300,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSpecRow(
    String label,
    String value, {
    Color valueColor = const Color(0xFF111827),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7280),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
