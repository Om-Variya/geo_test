import 'package:flutter/material.dart';
import 'package:geo_test/Screen/UserScreen/add_employees.dart';
import 'package:geo_test/Screen/UserScreen/employee_details.dart';
import 'package:geo_test/widgets/app_drawer.dart';
import 'package:geo_test/widgets/top_nav_bar.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> employees = [
      {
        'name': 'Om Vaiya',
        'id': 'EMP-001',
        'role': 'Site Engineer',
        'status': 'Active',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
      },
      {
        'name': 'Rudra Braiya',
        'id': 'EMP-002',
        'role': 'Lab Technician',
        'status': 'Active',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
      },
      {
        'name': 'Digvijayssinh Vaghela',
        'id': 'EMP-003',
        'role': 'Testing Engineer',
        'status': 'Inactive',
        'statusColor': Colors.red,
        'bgColor': Colors.red.shade50,
      },
      {
        'name': 'MRaval',
        'id': 'EMP-004',
        'role': 'Quality Engineer',
        'status': 'Active',
        'statusColor': Colors.green,
        'bgColor': Colors.green.shade50,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopNavBar(),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ---------------------------------------------------------
            // SEARCH BAR
            // ---------------------------------------------------------
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Employees...',
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
            ),

            const SizedBox(height: 20),

            // ---------------------------------------------------------
            // EMPLOYEE LIST
            // ---------------------------------------------------------
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetailsScreen(
                                name: employee['name'],
                                id: employee['id'],
                                role: employee['role'],
                                isActive: employee['status'] == 'Active',
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // -------------------------------------------------
                              // EMPLOYEE ICON
                              // -------------------------------------------------
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
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF1967D2),
                                  size: 28,
                                ),
                              ),

                              const SizedBox(width: 14),

                              // -------------------------------------------------
                              // EMPLOYEE INFORMATION
                              // -------------------------------------------------
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employee['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      employee['id'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      employee['role'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // -------------------------------------------------
                              // STATUS
                              // -------------------------------------------------
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: employee['bgColor'],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  employee['status'],
                                  style: TextStyle(
                                    color: employee['statusColor'],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              // -------------------------------------------------
                              // ARROW
                              // -------------------------------------------------
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
                },
              ),
            ),

            // ---------------------------------------------------------
            // EMPLOYEE COUNT
            // ---------------------------------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.people_outline,
                    color: Color(0xFF1967D2),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Total Employees: ${employees.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1967D2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------------------------------------------------------
      // ADD EMPLOYEE BUTTON
      // SAME AS REPORTS
      // ---------------------------------------------------------------
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 43.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEmployeeScreen(),
              ),
            );
            // Add Employee navigation
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
      ),
    );
  }
}
