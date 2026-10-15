import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final String name;
  final String id;
  final String role;
  final bool isActive;

  const EmployeeDetailsScreen({
    super.key,
    required this.name,
    required this.id,
    required this.role,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ------------------------------------------------------------
      // APP BAR
      // ------------------------------------------------------------
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Employee Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),

      // ------------------------------------------------------------
      // BODY
      // ------------------------------------------------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EMPLOYEE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                      ),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 38,
                      color: Color(0xFF1967D2),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          id,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildStatusIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // EMPLOYEE INFORMATION
            _buildSectionHeader('EMPLOYEE INFORMATION'),

            _buildDetailRow('Full Name', name),
            _buildDetailRow('Employee ID', id),
            _buildDetailRow('Designation', role),

            const SizedBox(height: 12),

            _buildDetailRow(
              'Employment Status',
              isActive ? 'Active' : 'Inactive',
              valueColor: isActive
                  ? Colors.green.shade700
                  : Colors.red.shade700,
            ),

            const SizedBox(height: 28),

            // CONTACT DETAILS
            _buildSectionHeader('CONTACT DETAILS'),

            _buildDetailRow('Email', 'Not provided'),
            _buildDetailRow('Phone', 'Not provided'),

            const SizedBox(height: 28),

            // ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    label: 'Edit',
                    bgColor: Colors.amber.shade50,
                    textColor: Colors.amber.shade900,
                    borderColor: Colors.amber.shade300,
                    onTap: () {
                      // Navigate to edit employee screen
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildActionButton(
                    label: 'Change Status',
                    bgColor: Colors.indigo.shade50,
                    textColor: Colors.indigo.shade700,
                    borderColor: Colors.indigo.shade300,
                    onTap: () {
                      // Implement status change
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildActionButton(
                    label: 'Delete',
                    bgColor: Colors.red.shade50,
                    textColor: Colors.red.shade700,
                    borderColor: Colors.red.shade300,
                    onTap: () {
                      // Implement employee deletion
                    },
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

  // ---------------------------------------------------------------
  // SECTION HEADER
  // ---------------------------------------------------------------
  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2554C7),
          ),
        ),
        const SizedBox(height: 4),
        const Divider(
          color: Color(0xFFE5E7EB),
          thickness: 1,
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // STATUS INDICATOR
  // ---------------------------------------------------------------
  Widget _buildStatusIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.green.shade50
            : Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'ACTIVE' : 'INACTIVE',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isActive
              ? Colors.green.shade700
              : Colors.red.shade700,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // DETAIL ROW
  // ---------------------------------------------------------------
  Widget _buildDetailRow(
    String label,
    String value, {
    Color valueColor = const Color(0xFF111827),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // ACTION BUTTON
  // ---------------------------------------------------------------
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
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
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