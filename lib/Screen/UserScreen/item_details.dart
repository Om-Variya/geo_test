import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Item Details',
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

      // ============================================================
      // BODY
      // ============================================================

      body: Column(
        children: [
          // ==========================================================
          // CONTENT
          // ==========================================================

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // ITEM HEADER CARD
                  // ==================================================

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ============================================
                        // ITEM IMAGE
                        // ============================================

                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Image.asset(
                            'lib/resources/images/ultratech-cement-500x500.jpg',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.inventory_2_outlined,
                                color: Colors.grey.shade500,
                                size: 32,
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 14),

                        // ============================================
                        // ITEM INFORMATION
                        // ============================================

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cement (OPC 53 Grade)',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                'CEM - 001',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // ======================================
                              // STOCK STATUS
                              // ======================================

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'In Stock',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // ITEM INFORMATION
                  // ==================================================

                  _buildSectionHeader('ITEM INFORMATION'),

                  const SizedBox(height: 16),

                  _buildDetailRow(
                    'Category',
                    'Construction Material',
                  ),

                  _buildDetailRow(
                    'Unit',
                    'Bag',
                  ),

                  const SizedBox(height: 8),

                  // ==================================================
                  // STOCK DETAILS
                  // ==================================================

                  _buildSectionHeader('STOCK DETAILS'),

                  const SizedBox(height: 16),

                  _buildDetailRow(
                    'Current Stock',
                    '50',
                  ),

                  _buildDetailRow(
                    'Minimum Stock Level',
                    '20',
                  ),

                  const SizedBox(height: 8),

                  // ==================================================
                  // STORAGE & SUPPLIER
                  // ==================================================

                  _buildSectionHeader('STORAGE & SUPPLIER'),

                  const SizedBox(height: 16),

                  _buildDetailRow(
                    'Storage Location',
                    'Godown - A',
                  ),

                  _buildDetailRow(
                    'Supplier',
                    'UltraTech Cement',
                  ),

                  const SizedBox(height: 8),

                  // ==================================================
                  // PURCHASE DETAILS
                  // ==================================================

                  _buildSectionHeader('PURCHASE DETAILS'),

                  const SizedBox(height: 16),

                  _buildDetailRow(
                    'Purchase Date',
                    '15-07-2026',
                  ),

                  const SizedBox(height: 8),

                  // ==================================================
                  // DOCUMENTATION
                  // ==================================================

                  _buildSectionHeader('DOCUMENTATION'),

                  const SizedBox(height: 16),

                  _buildNotesBox(
                    'Keep in dry place.',
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // ==========================================================
          // BOTTOM ACTION BUTTONS
          // ==========================================================

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // ================================================
                // STOCK IN
                // ================================================

                Expanded(
                  child: _buildActionButton(
                    label: 'Stock In',
                    bgColor: Colors.green.shade50,
                    textColor: Colors.green.shade700,
                    borderColor: Colors.green.shade300,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                // ================================================
                // STOCK OUT
                // ================================================

                Expanded(
                  child: _buildActionButton(
                    label: 'Stock Out',
                    bgColor: Colors.red.shade50,
                    textColor: Colors.red.shade700,
                    borderColor: Colors.red.shade300,
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                // ================================================
                // EDIT
                // ================================================

                Expanded(
                  child: _buildActionButton(
                    label: 'Edit',
                    bgColor: Colors.amber.shade50,
                    textColor: Colors.amber.shade900,
                    borderColor: Colors.amber.shade300,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // SECTION HEADER
  // Same style used in Add Machine / Site Details
  // ================================================================

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
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

  // ================================================================
  // DETAIL ROW
  // ================================================================

  Widget _buildDetailRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LABEL
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // VALUE
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // NOTES BOX
  // ================================================================

  Widget _buildNotesBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF374151),
          height: 1.4,
        ),
      ),
    );
  }

  // ================================================================
  // ACTION BUTTON
  // Same shape and size as Machine Details
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
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
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
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
