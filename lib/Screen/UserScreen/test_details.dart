import 'package:flutter/material.dart';

class TestDetailsScreen extends StatefulWidget {
  const TestDetailsScreen({super.key});

  @override
  State<TestDetailsScreen> createState() => _TestDetailsScreenState();
}

class _TestDetailsScreenState extends State<TestDetailsScreen> {
  // Dropdown selections
  String? _selectedMachineType;
  String? _selectedTestType;

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
          'Test Details',
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
            // TEST INFORMATION
            // ======================================================
            _buildSectionHeader('TEST INFORMATION'),

            const SizedBox(height: 12),

            // Machine Type
            _buildDropdownField(
              label: 'Machine Type',
              hintText: 'Select Type',
              value: _selectedMachineType,
              items: ['Type A', 'Type B', 'Type C'],
              onChanged: (value) {
                setState(() {
                  _selectedMachineType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Test Type
            _buildDropdownField(
              label: 'Test Type',
              hintText: 'Select Type',
              value: _selectedTestType,
              items: ['Test 1', 'Test 2', 'Test 3'],
              onChanged: (value) {
                setState(() {
                  _selectedTestType = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // ======================================================
            // SAMPLE DETAILS
            // ======================================================
            _buildSectionHeader('SAMPLE DETAILS'),

            const SizedBox(height: 12),

            _buildTextField(
              label: 'Sample Description / ID',
              hintText: 'e.g. ABC-020',
            ),

            const SizedBox(height: 16),

            _buildTextField(label: 'Quantity', hintText: 'e.g. 3 Nos'),

            const SizedBox(height: 24),

            // ======================================================
            // TEST STANDARD
            // ======================================================
            _buildSectionHeader('TEST STANDARD'),

            const SizedBox(height: 12),

            _buildTextField(
              label: 'Test Method / Standard',
              hintText: 'e.g. IS 516 : 1959',
            ),

            const SizedBox(height: 32),

            // ======================================================
            // ADD TEST BUTTON
            // ======================================================
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  // Add another test action
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                child: const Text(
                  'Save Report',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // SECTION HEADER
  // ================================================================

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

        const Divider(color: Color(0xFFE5E7EB), thickness: 1),
      ],
    );
  }

  // ================================================================
  // TEXT FIELD
  // ================================================================

  Widget _buildTextField({
    required String label,
    required String hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),

        const SizedBox(height: 6),

        TextField(
          maxLines: maxLines,

          decoration: InputDecoration(
            hintText: hintText,

            hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),

            filled: true,

            fillColor: const Color(0xFFF3F4F6),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // DROPDOWN FIELD
  // ================================================================

  Widget _buildDropdownField({
    required String label,
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),

        const SizedBox(height: 6),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,

              hint: Text(
                hintText,
                style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
              ),

              isExpanded: true,

              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF6B7280),
              ),

              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,

                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF374151),
                    ),
                  ),
                );
              }).toList(),

              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
