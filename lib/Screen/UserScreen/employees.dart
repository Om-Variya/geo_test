import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/add_employees.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

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
          'Employees',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: 'Search by Name or EID',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
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
          ),
          
          // Employee List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                EmployeeCard(
                  name: 'Christopher Nolan',
                  role: 'Senior Engineer',
                  eid: 'ENG-001',
                ),
                SizedBox(height: 12),
                EmployeeCard(
                  name: 'MJ',
                  role: 'Junior Engineer',
                  eid: 'ENG-002',
                ),
                SizedBox(height: 12),
                EmployeeCard(
                  name: 'Peter Parker',
                  role: 'Lab Operator',
                  eid: 'OPT-001',
                ),
                SizedBox(height: 12),
                EmployeeCard(
                  name: 'Mraval', // Empty name handled gracefully for the 4th card
                  role: 'Lab Operator',
                  eid: 'OPT-001',
                ),
              ],
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEmployeeScreen()),
          );
        },
        backgroundColor: const Color(0xFF2956D3),
        shape: const CircleBorder(),
        elevation: 2,
        child: const Icon(Icons.person_add_alt_1, color: Colors.white, size: 28),
      ),
      // Bottom Total Employees Bar
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF2956D3),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Employees :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Employee Card Widget
class EmployeeCard extends StatelessWidget {
  final String name;
  final String role;
  final String eid;

  const EmployeeCard({
    super.key,
    required this.name,
    required this.role,
    required this.eid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Silhouette Icon Container
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              Icons.person,
              size: 45,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(width: 16),
          
          // Employee Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name.isNotEmpty) ...[
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  eid,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // Right Arrow
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}