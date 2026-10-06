import 'package:flutter/material.dart';

class SiteDetailsPage extends StatefulWidget {
  const SiteDetailsPage({super.key});

  @override
  State<SiteDetailsPage> createState() => _SiteDetailsPageState();
}

class _SiteDetailsPageState extends State<SiteDetailsPage> {
  final TextEditingController clientController =
      TextEditingController();

  final TextEditingController projectController =
      TextEditingController();

  final TextEditingController addressController =
      TextEditingController();

  final TextEditingController workOrderController =
      TextEditingController();

  final TextEditingController sampleDateController =
      TextEditingController();

  final TextEditingController testDateController =
      TextEditingController();

  final TextEditingController engineerController =
      TextEditingController();

  final TextEditingController contactController =
      TextEditingController();

  final TextEditingController remarksController =
      TextEditingController();

  @override
  void dispose() {
    clientController.dispose();
    projectController.dispose();
    addressController.dispose();
    workOrderController.dispose();
    sampleDateController.dispose();
    testDateController.dispose();
    engineerController.dispose();
    contactController.dispose();
    remarksController.dispose();

    super.dispose();
  }

  Future<void> selectTestDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        testDateController.text =
            "${selectedDate.day.toString().padLeft(2, '0')}/"
            "${selectedDate.month.toString().padLeft(2, '0')}/"
            "${selectedDate.year}";
      });
    }
  }

  InputDecoration fieldDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFFA7ADB7),
        fontSize: 12,
      ),
      filled: true,
      fillColor: const Color(0xFFF0F0F0),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),

      suffixIcon: suffixIcon,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xFFAAB2BD),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xFF28C653),
          width: 1.5,
        ),
      ),
    );
  }

  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        bottom: 6,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF303642),
        ),
      ),
    );
  }

  Widget textField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldLabel(label),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4B5563),
          ),
          decoration: fieldDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  Widget dateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldLabel("Test Date"),

        TextField(
          controller: testDateController,
          readOnly: true,
          onTap: selectTestDate,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4B5563),
          ),
          decoration: fieldDecoration(
            hintText: "mm/dd/yyyy",
            suffixIcon: const Icon(
              Icons.calendar_month_outlined,
              size: 19,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
      ],
    );
  }

  Widget twoColumnFields() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: textField(
            label: "Work Order /Reference No.",
            hint: "WO-2026-118",
            controller: workOrderController,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: textField(
            label: "Sample Received Date",
            hint: "24 Jul 2026",
            controller: sampleDateController,
          ),
        ),
      ],
    );
  }

  void saveSiteDetails() {
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Site details saved successfully"),
        backgroundColor: Color(0xFF28C653),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF292929),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Site Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 21,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            18,
            17,
            18,
            25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Client / Company Name
              textField(
                label: "Client / Company Name",
                hint: "ABC Construction Pvt. Ltd.",
                controller: clientController,
              ),

              const SizedBox(height: 8),

              // Project / Site Name
              textField(
                label: "Project / Site Name",
                hint: "Residential Building",
                controller: projectController,
              ),

              const SizedBox(height: 8),

              // Site Address
              textField(
                label: "Site Address / Location",
                hint: "Mavdi , Rajkot Gujarat",
                controller: addressController,
              ),

              const SizedBox(height: 8),

              // Work Order + Sample Received Date
              twoColumnFields(),

              const SizedBox(height: 8),

              // Test Date
              dateField(),

              const SizedBox(height: 8),

              // Engineer
              textField(
                label: "Engineer",
                hint: "Om Patel",
                controller: engineerController,
              ),

              const SizedBox(height: 8),

              // Site Contact Person
              textField(
                label: "Site Contact Person",
                hint: "Mr. Rajesh",
                controller: contactController,
              ),

              const SizedBox(height: 8),

              // Remarks
              textField(
                label: "Remarks",
                hint: "Sample Collected from site.",
                controller: remarksController,
                maxLines: 4,
              ),

              const SizedBox(height: 36),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: saveSiteDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF28C653),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    "Save Site Details",
                    style: TextStyle(
                      fontSize: 13,
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