import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Notice there is no appBar or bottomNavigationBar here, 
    // so it fits perfectly inside your MainScreen!
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: 'Search Items...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  InventoryCard(
                    title: 'Cement (OPC 53 Grade)',
                    code: 'CEM - 001',
                    unit: 'Bag',
                    quantity: '50',
                    status: 'in Stock',
                    statusColor: Colors.green,
                  ),
                  SizedBox(height: 12),
                  InventoryCard(
                    title: 'Sand (Fine)',
                    code: 'SAN - 001',
                    unit: 'CFT',
                    quantity: '25',
                    status: 'Low Stock',
                    statusColor: Colors.orange,
                  ),
                  SizedBox(height: 12),
                  InventoryCard(
                    title: 'Cement (OPC 53 Grade)',
                    code: 'CEM - 001',
                    unit: 'Bag',
                    quantity: '0',
                    status: 'Out Of Stock',
                    statusColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2956D3),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class InventoryCard extends StatelessWidget {
  final String title;
  final String code;
  final String unit;
  final String quantity;
  final String status;
  final Color statusColor;

  const InventoryCard({
    super.key,
    required this.title,
    required this.code,
    required this.unit,
    required this.quantity,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                ),
                const SizedBox(height: 4),
                Text(
                  code,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  'Unit : $unit',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quantity,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: statusColor),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}