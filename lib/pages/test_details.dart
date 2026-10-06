import 'package:flutter/material.dart';

class TestDetailsPage extends StatefulWidget {
  const TestDetailsPage({super.key});

  @override
  State<TestDetailsPage> createState() => _TestDetailsPageState();
}

class _TestDetailsPageState extends State<TestDetailsPage> {
  String? machineType;
  String? testType;

  final TextEditingController sampleDescriptionController =
      TextEditingController();

  final TextEditingController quantityController =
      TextEditingController();

  final TextEditingController testMethodController =
      TextEditingController();

  @override
  void dispose() {
    sampleDescriptionController.dispose();
    quantityController.dispose();
    testMethodController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // Common Input Decoration
  // --------------------------------------------------

  InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFFA8AFB9),
        fontSize: 9,
      ),

      filled: true,
      fillColor: const Color(0xFFF0F0F0),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 10,
      ),

      suffixIcon: suffixIcon,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(
          color: Color(0xFFADB5BF),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(
          color: Color(0xFF28C653),
          width: 1.2,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // Label
  // --------------------------------------------------

  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Color(0xFF303642),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // Dropdown
  // --------------------------------------------------

  Widget dropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldLabel(label),

        DropdownButtonFormField<String>(
          value: value,

          decoration: inputDecoration(
            hintText: "Select Type",
          ),

          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 17,
            color: Color(0xFF555D68),
          ),

          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF555D68),
          ),

          dropdownColor: Colors.white,

          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }

  // --------------------------------------------------
  // Text Field
  // --------------------------------------------------

  Widget textField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldLabel(label),

        TextField(
          controller: controller,

          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF555D68),
          ),

          decoration: inputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // Add Another Test
  // --------------------------------------------------

  void addAnotherTest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Test added successfully",
        ),
        backgroundColor: Color(0xFF28C653),
      ),
    );
  }

  // --------------------------------------------------
  // Build
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ------------------------------------------------
      // App Bar
      // ------------------------------------------------

      appBar: AppBar(
        backgroundColor: const Color(0xFF292929),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 18,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Test Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 17,
            ),
            onPressed: () {},
          ),
        ],
      ),

      // ------------------------------------------------
      // Body
      // ------------------------------------------------

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            18,
            17,
            18,
            17,
          ),

          child: Column(
            children: [

              // Scrollable form
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      // Machine Type
                      dropdownField(
                        label: "Machine Type",
                        value: machineType,
                        items: const [
                          "Machine 1",
                          "Machine 2",
                          "Machine 3",
                        ],
                        onChanged: (value) {
                          setState(() {
                            machineType = value;
                          });
                        },
                      ),

                      const SizedBox(height: 8),

                      // Test Type
                      dropdownField(
                        label: "Test Type",
                        value: testType,
                        items: const [
                          "Concrete Test",
                          "Cement Test",
                          "Steel Test",
                          "Soil Test",
                        ],
                        onChanged: (value) {
                          setState(() {
                            testType = value;
                          });
                        },
                      ),

                      const SizedBox(height: 8),

                      // Sample Description
                      textField(
                        label: "Sample Description / ID",
                        hint: "e.g. ABC-020",
                        controller:
                            sampleDescriptionController,
                      ),

                      const SizedBox(height: 8),

                      // Quantity
                      textField(
                        label: "Quantity",
                        hint: "e.g. 3 Nos",
                        controller: quantityController,
                      ),

                      const SizedBox(height: 8),

                      // Test Method
                      textField(
                        label: "Test Method / Standard",
                        hint: "e.g. 516 : 1959",
                        controller: testMethodController,
                      ),
                    ],
                  ),
                ),
              ),

              // ------------------------------------------------
              // Add Another Test Button
              // ------------------------------------------------

              SizedBox(
                width: double.infinity,
                height: 43,

                child: ElevatedButton(
                  onPressed: addAnotherTest,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF28C653),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(7),
                    ),
                  ),

                  child: const Text(
                    "Add Another Test",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}