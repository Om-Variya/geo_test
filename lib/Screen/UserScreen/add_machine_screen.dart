import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Optional: for clean date formatting (Make sure to add intl to pubspec.yaml if you use it, or format manually below)

class AddMachineScreen extends StatefulWidget {
  const AddMachineScreen({super.key});

  @override
  State<AddMachineScreen> createState() => _AddMachineScreenState();
}

class _AddMachineScreenState extends State<AddMachineScreen> {
  String _selectedStatus = 'Active';
  String? _selectedMachineType;

  // Controller to hold and display the selected purchase date
  final TextEditingController _purchaseDateController = TextEditingController();

  @override
  void dispose() {
    _purchaseDateController.dispose();
    super.dispose();
  }

  // Function to open the Date Picker dialog
  Future<void> _selectPurchaseDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2554C7), // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        // Formats date as mm/dd/yyyy to match your design hint
        _purchaseDateController.text =
            "${pickedDate.month.toString().padLeft(2, '0')}/"
            "${pickedDate.day.toString().padLeft(2, '0')}/"
            "${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Machines',
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header: MACHINE IDENTITY
            _buildSectionHeader('MACHINE IDENTITY'),
            const SizedBox(height: 12),
            _buildTextField(
              label: 'Machine Name',
              hintText: 'e.g. Compression Testing Machine',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Machine ID / Code',
              hintText: 'e.g. ABC-020',
            ),
            const SizedBox(height: 24),

            // Section Header: TECHNICAL SPECS
            _buildSectionHeader('TECHNICAL SPECS'),
            const SizedBox(height: 12),
            const Text(
              'Machine Type',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
            const SizedBox(height: 6),
            _buildDropdownField(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Manufacturer',
                    hintText: 'e.g. xyz mecha',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    label: 'Model Number',
                    hintText: 'ABC-020',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Purchase Date Field with Interactive Date Picker
            _buildDatePickerField(
              label: 'Purchase Date',
              hintText: 'mm/dd/yyyy',
              controller: _purchaseDateController,
              onTap: () => _selectPurchaseDate(context),
            ),
            const SizedBox(height: 24),

            // Section Header: OPERATIONAL STATUS
            _buildSectionHeader('OPERATIONAL STATUS'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatusButton('Active', Colors.green)),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatusButton('Maintenance', Colors.indigo),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildStatusButton('Inactive', Colors.red)),
              ],
            ),
            const SizedBox(height: 24),

            // Section Header: DOCUMENTATION
            _buildSectionHeader('DOCUMENTATION'),
            const SizedBox(height: 12),
            _buildTextField(
              label: 'Operational Notes',
              hintText:
                  'Enter maintenance history, calibration requirements, or site location details...',
              maxLines: 4,
            ),
            const SizedBox(height: 16),

            // Add Machine Photo Box
            _buildPhotoUploadBox(),
            const SizedBox(height: 32),

            // Confirm and Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm and Save Asset',
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

  // --- Helper Widgets ---

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

  Widget _buildTextField({
    required String label,
    required String hintText,
    IconData? suffixIcon,
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
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: const Color(0xFF6B7280), size: 20)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Specific widget for Purchase Date with click-to-open calendar behavior
  Widget _buildDatePickerField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required VoidCallback onTap,
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
          controller: controller,
          readOnly:
              true, // Prevents manual typing; forces calendar picker usage
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
            filled: true,
            fillColor: const Color(0xFFF3F4F6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Color(0xFF6B7280),
              size: 20,
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

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedMachineType,
          hint: const Text(
            'Select Type',
            style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
          ),
          isExpanded: true,
          items: ['Testing Machine', 'Lathe', 'CBR Machine'].map((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(fontSize: 13)),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedMachineType = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildStatusButton(String status, MaterialColor color) {
    bool isSelected = _selectedStatus == status;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStatus = status;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? color.shade100 : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? color.shade400 : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          status,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? color.shade700 : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadBox() {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9CA3AF),
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_alt_outlined, color: Color(0xFF2554C7), size: 28),
          SizedBox(height: 8),
          Text(
            'Add Machine Photo',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}
