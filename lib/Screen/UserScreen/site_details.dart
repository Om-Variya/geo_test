import 'package:flutter/material.dart';

class SiteDetailsScreen extends StatelessWidget {
  const SiteDetailsScreen({super.key});

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
          'Site Details',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabeledTextField(
              label: 'Client / Company Name',
              hint: 'ABC Construction Pvt. Ltd.',
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Project / Site Name',
              hint: 'Residential Building',
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Site Address / Location',
              hint: 'Mavdi , Rajkot Gujarat',
            ),
            const SizedBox(height: 16),
            
            // Row for Work Order and Sample Date
            Row(
              children: [
                Expanded(
                  child: _buildLabeledTextField(
                    label: 'Work Order /Reference No.',
                    hint: 'WO-2026-118',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildLabeledTextField(
                    label: 'Sample Received Date',
                    hint: '24 Jul 2026',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Test Date',
              hint: 'mm/dd/yyyy',
              suffixIcon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Engineer',
              hint: 'Om Patel',
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Site Contact Person',
              hint: 'Mr. Rajesh',
            ),
            const SizedBox(height: 16),
            
            _buildLabeledTextField(
              label: 'Remarks',
              hint: 'Sample Collected from site.',
              maxLines: 4,
            ),
            
            const SizedBox(height: 24),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF28C759), // Vibrant green from the design
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  'Save Site Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Reusable widget to generate text fields with labels consistently
  Widget _buildLabeledTextField({
    required String label,
    required String hint,
    int maxLines = 1,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF555555),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey.shade700, size: 20)
                : null,
          ),
        ),
      ],
    );
  }
}