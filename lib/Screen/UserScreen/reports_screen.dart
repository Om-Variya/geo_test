import 'package:flutter/material.dart';
import 'site_details.dart';
import 'test_details.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy report data matching the UI mockup
    final List<Map<String, dynamic>> reports = [
      {
        'id': 'RPT-2026-042',
        'client': 'ABC Construction',
        'test': 'RCC Cube Test',
        'status': 'Completed',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
      },
      {
        'id': 'RPT-2026-041',
        'client': 'XYZ Construction',
        'test': 'Soil CBR Test',
        'status': 'Draft',
        'statusColor': Colors.blue.shade700,
        'bgColor': Colors.blue.shade50,
      },
      {
        'id': 'RPT-2026-040',
        'client': 'BuildX',
        'test': 'Iron Roads Test',
        'status': 'Testing',
        'statusColor': Colors.orange.shade800,
        'bgColor': Colors.orange.shade50,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Reports...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(height: 20),

            // Reports List
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
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
                        // Tapping the main card navigates to Site Details
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Info Section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    report['id'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    report['client'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    report['test'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),

                              // Right Section: Status Badge & Test Details Action Button
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: report['bgColor'],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      report['status'],
                                      style: TextStyle(
                                        color: report['statusColor'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Action Button leading to Test Details
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SiteDetailsScreen()),
          );
        },

        backgroundColor: const Color(0xFF1967D2),

        // Makes the button completely circular
        shape: const CircleBorder(),

        elevation: 2,

        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
