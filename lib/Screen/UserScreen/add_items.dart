import 'package:flutter/material.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  // ============================================================
  // DATE CONTROLLER
  // ============================================================

  final TextEditingController _purchaseDateController = TextEditingController();

  @override
  void dispose() {
    _purchaseDateController.dispose();
    super.dispose();
  }

  // ============================================================
  // DATE PICKER
  // ============================================================

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
              primary: Color(0xFF2554C7),
              onPrimary: Colors.white,
              surface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _purchaseDateController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/"
            "${pickedDate.month.toString().padLeft(2, '0')}/"
            "${pickedDate.year}";
      });
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==========================================================
      // APP BAR
      // ==========================================================
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Add New Item',
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

      // ==========================================================
      // BODY
      // ==========================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================
            // ITEM INFORMATION
            // ======================================================
            _buildSectionHeader('ITEM INFORMATION'),

            const SizedBox(height: 12),

            _buildTextField(
              label: 'Category',
              hintText: 'e.g. Construction Material',
            ),

            const SizedBox(height: 16),

            _buildTextField(label: 'Unit', hintText: 'e.g. Bag'),

            const SizedBox(height: 24),

            // ======================================================
            // STOCK DETAILS
            // ======================================================
            _buildSectionHeader('STOCK DETAILS'),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Current Stock',
                    hintText: 'e.g. 50',
                    keyboardType: TextInputType.number,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _buildTextField(
                    label: 'Minimum Stock Level',
                    hintText: 'e.g. 20',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ======================================================
            // STORAGE & SUPPLIER
            // ======================================================
            _buildSectionHeader('STORAGE & SUPPLIER'),

            const SizedBox(height: 12),

            _buildTextField(
              label: 'Storage Location',
              hintText: 'e.g. Godown - A',
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Supplier',
              hintText: 'e.g. UltraTech Cement',
            ),

            const SizedBox(height: 24),

            // ======================================================
            // PURCHASE DETAILS
            // ======================================================
            _buildSectionHeader('PURCHASE DETAILS'),

            const SizedBox(height: 12),

            _buildDatePickerField(
              label: 'Purchase Date',
              hintText: 'dd/mm/yyyy',
              controller: _purchaseDateController,
              onTap: () => _selectPurchaseDate(context),
            ),

            const SizedBox(height: 24),

            // ======================================================
            // DOCUMENTATION
            // ======================================================
            _buildSectionHeader('DOCUMENTATION'),

            const SizedBox(height: 12),

            _buildTextField(
              label: 'Notes',
              hintText: 'e.g. Keep in dry place.',
              maxLines: 4,
            ),

            const SizedBox(height: 32),

            // ======================================================
            // SAVE BUTTON
            // ======================================================
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
                  'Confirm and Save Item',
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

  // ==============================================================
  // SECTION HEADER
  // ==============================================================

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

  // ==============================================================
  // TEXT FIELD
  // ==============================================================

  Widget _buildTextField({
    required String label,
    required String hintText,
    int maxLines = 1,
    TextInputType? keyboardType,
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
          keyboardType: keyboardType,

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

  // ==============================================================
  // DATE PICKER FIELD
  // ==============================================================

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

          readOnly: true,

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
}
