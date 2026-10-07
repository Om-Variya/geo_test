import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/item_details.dart';
import 'package:geo_test/Screen/UserScreen/add_items.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ============================================================
    // DUMMY INVENTORY DATA
    // ============================================================

    final List<Map<String, dynamic>> items = [
      {
        'title': 'Cement (OPC 53 Grade)',
        'code': 'CEM - 001',
        'unit': 'Bag',
        'quantity': '50',
        'status': 'In Stock',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
      },
      {
        'title': 'Sand (Fine)',
        'code': 'SAN - 001',
        'unit': 'CFT',
        'quantity': '25',
        'status': 'Low Stock',
        'statusColor': Colors.orange,
        'bgColor': Colors.orange.shade50,
      },
      {
        'title': 'Cement (OPC 53 Grade)',
        'code': 'CEM - 001',
        'unit': 'Bag',
        'quantity': '0',
        'status': 'Out Of Stock',
        'statusColor': Colors.red,
        'bgColor': Colors.red.shade50,
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
            // ======================================================
            // SEARCH BAR
            // ======================================================
            _buildSearchBar(),

            const SizedBox(height: 20),

            // ======================================================
            // INVENTORY LIST
            // ======================================================
            Expanded(
              child: ListView.builder(
                itemCount: items.length,

                itemBuilder: (context, index) {
                  final item = items[index];

                  return InventoryCard(
                    title: item['title'],
                    code: item['code'],
                    unit: item['unit'],
                    quantity: item['quantity'],
                    status: item['status'],
                    statusColor: item['statusColor'],
                    bgColor: item['bgColor'],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // ADD ITEM BUTTON
      // ============================================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemsScreen()),
          );
        },

        backgroundColor: const Color(0xFF1967D2),

        // Completely round button
        shape: const CircleBorder(),

        elevation: 2,

        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  // ================================================================
  // SEARCH BAR
  // ================================================================

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Items...',

        hintStyle: TextStyle(color: Colors.grey.shade500),

        prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),

        filled: true,

        fillColor: Colors.grey.shade100,

        contentPadding: const EdgeInsets.symmetric(vertical: 0),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// ==================================================================
// REUSABLE INVENTORY CARD
// ==================================================================

class InventoryCard extends StatelessWidget {
  final String title;
  final String code;
  final String unit;
  final String quantity;
  final String status;
  final Color statusColor;
  final Color bgColor;

  const InventoryCard({
    super.key,
    required this.title,
    required this.code,
    required this.unit,
    required this.quantity,
    required this.status,
    required this.statusColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),

      child: Material(
        color: Colors.transparent,

        child: InkWell(
          borderRadius: BorderRadius.circular(16),

          // ========================================================
          // CARD TAP
          // ========================================================
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemDetailsScreen(),
              ),
            );
          },

          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Row(
              children: [
                // ==================================================
                // LEFT INFORMATION
                // ==================================================
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item Name
                      Text(
                        title,

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Item Code
                      Text(
                        code,

                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 2),

                      // Unit
                      Text(
                        'Unit: $unit',

                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // ==================================================
                // QUANTITY + STOCK INDICATOR
                // ==================================================
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Quantity
                    Text(
                      quantity,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Stock Indicator
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Text(
                        status,

                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),

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
