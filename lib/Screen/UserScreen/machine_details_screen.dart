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

      // ============================================================
      // APP BAR
      // ============================================================
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

      // ============================================================
      // BODY
      // ============================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================
            // MACHINE HEADER CARD
            // ======================================================
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(16),

                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),

              child: Row(
                children: [
                  // ------------------------------------------------
                  // MACHINE ICON
                  // ------------------------------------------------
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

                  // ------------------------------------------------
                  // MACHINE INFORMATION
                  // ------------------------------------------------
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

                        // Status Indicator
                        _buildStatusIndicator(
                          text: isActive ? 'ACTIVE' : 'INACTIVE',
                          textColor: isActive
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          backgroundColor: isActive
                              ? Colors.green.shade50
                              : Colors.red.shade50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ======================================================
            // SPECIFICATIONS
            // ======================================================
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

            // ======================================================
            // NOTE SECTION
            // ======================================================
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

            // ------------------------------------------------------
            // NOTE BOX
            // ------------------------------------------------------
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

            // ======================================================
            // ACTION BUTTONS
            // ======================================================
            Row(
              children: [
                // --------------------------------------------------
                // EDIT
                // --------------------------------------------------
                Expanded(
                  child: _buildActionButton(
                    label: 'Edit',
                    bgColor: Colors.amber.shade50,
                    textColor: Colors.amber.shade900,
                    borderColor: Colors.amber.shade300,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                // --------------------------------------------------
                // CHANGE STATUS
                // --------------------------------------------------
                Expanded(
                  child: _buildActionButton(
                    label: 'Change Status',
                    bgColor: Colors.indigo.shade50,
                    textColor: Colors.indigo.shade700,
                    borderColor: Colors.indigo.shade300,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                // --------------------------------------------------
                // DELETE
                // --------------------------------------------------
                Expanded(
                  child: _buildActionButton(
                    label: 'Delete',
                    bgColor: Colors.red.shade50,
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

  // ================================================================
  // STATUS INDICATOR
  // ================================================================

  Widget _buildStatusIndicator({
    required String text,
    required Color textColor,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,

        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  // ================================================================
  // SPECIFICATION ROW
  // ================================================================

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

          const SizedBox(width: 16),

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

  // ================================================================
  // ACTION BUTTON
  // ================================================================

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

          // Keep the original rectangular button shape
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
