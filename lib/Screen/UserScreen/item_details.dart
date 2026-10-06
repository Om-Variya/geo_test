import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Item Card
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Container
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'lib/resources/images/ultratech-cement-500x500.jpg',
                            fit: BoxFit.contain,
                            // Fallback icon just in case the image path isn't in pubspec.yaml yet
                            errorBuilder: (context, error, stackTrace) => 
                                const Icon(Icons.image, color: Colors.grey, size: 40),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Title and Badge
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cement (OPC 53 Grade)',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'CEM-001',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade200,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'In Stock',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
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
                  
                  // Details List
                  _buildDetailItem('CATEGORY', 'Construction Material'),
                  _buildDetailItem('UNIT', 'Bag'),
                  _buildDetailItem('CURRENT STOCK', '50 Unit'),
                  _buildDetailItem('MINIMUM STOCK LEVEL', '20 Unit'),
                  _buildDetailItem('STORAGE LOCATION', 'Godown - A'),
                  _buildDetailItem('SUPPLIER', 'UltraTech Cement'),
                  _buildDetailItem('PURCHASE DATE', '15-07-2026'),
                  _buildDetailItem('NOTES', 'Keep in dry place.'),
                ],
              ),
            ),
          ),
          
          // Bottom Action Buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                _buildActionButton('Stock In', Colors.green),
                const SizedBox(width: 12),
                _buildActionButton('Stock Out', Colors.red),
                const SizedBox(width: 12),
                _buildActionButton('Edit', Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable widget for textual details
  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable widget for the bottom buttons
  Widget _buildActionButton(String title, MaterialColor color) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: color.shade100.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: color.shade300),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: color.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}