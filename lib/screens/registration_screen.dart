import 'package:flutter/material.dart';
import 'package:flutter_prac4/screens/profile_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/file_picker_widget.dart';
import '../core/utils/validation.dart';
import '../core/utils/percentage_calculator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();

  // SSC & HSC Details
  final TextEditingController _sscTotalController = TextEditingController();
  final TextEditingController _sscOutOfController = TextEditingController();
  final TextEditingController _hscTotalController = TextEditingController();
  final TextEditingController _hscOutOfController = TextEditingController();

  // CGPA & Sem Percentage
  final TextEditingController _cgpaController = TextEditingController();
  double _percentage = 0.0;

  String? _resumePath;

  void _calculatePercentage() {
    double sscTotal = double.tryParse(_sscTotalController.text) ?? 0;
    double sscOutOf = double.tryParse(_sscOutOfController.text) ?? 0;
    double hscTotal = double.tryParse(_hscTotalController.text) ?? 0;
    double hscOutOf = double.tryParse(_hscOutOfController.text) ?? 0;

    double sscPercentage =
        PercentageCalculator.calculatePercentage(sscTotal, sscOutOf);
    double hscPercentage =
        PercentageCalculator.calculatePercentage(hscTotal, hscOutOf);
    double cgpa = double.tryParse(_cgpaController.text) ?? 0;
    double cgpaPercentage = PercentageCalculator.convertCGPAToPercentage(cgpa);

    setState(() {
      _percentage = (sscPercentage + hscPercentage + cgpaPercentage) / 3;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Calculate percentages
      _calculatePercentage();

      // Navigate to Profile screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            name: _nameController.text,
            email: _emailController.text,
            contact: _contactController.text,
            rollNo: _rollNoController.text,
            sscPercentage: _percentage, // Use the calculated percentage
            hscPercentage: _percentage, // Use the same logic for HSC
            cgpaPercentage: _percentage, // Use CGPA-based percentage
            resumePath: _resumePath ?? "", // Pass resume path
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Personal Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CustomTextField(
                controller: _nameController,
                label: "Name",
                validator: Validation.validateName),
            CustomTextField(
                controller: _emailController,
                label: "Email",
                validator: Validation.validateEmail),
            CustomTextField(
                controller: _contactController,
                label: "Contact",
                validator: Validation.validatePhoneNumber),
            CustomTextField(
                controller: _rollNoController,
                label: "Roll No",
                validator: Validation.validateRollNumber),
            const SizedBox(height: 16),
            const Text("SSC Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CustomTextField(
                controller: _sscTotalController,
                label: "Total Marks",
                keyboardType: TextInputType.number,
                validator: Validation.validateMarks),
            CustomTextField(
                controller: _sscOutOfController,
                label: "Out Of",
                keyboardType: TextInputType.number,
                validator: Validation.validateMarks),
            const SizedBox(height: 16),
            const Text("HSC Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CustomTextField(
                controller: _hscTotalController,
                label: "Total Marks",
                keyboardType: TextInputType.number,
                validator: Validation.validateMarks),
            CustomTextField(
                controller: _hscOutOfController,
                label: "Out Of",
                keyboardType: TextInputType.number,
                validator: Validation.validateMarks),
            const SizedBox(height: 16),
            const Text("College CGPA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CustomTextField(
                controller: _cgpaController,
                label: "CGPA",
                keyboardType: TextInputType.number,
                validator: Validation.validateMarks),
            const SizedBox(height: 16),
            FilePickerWidget(
              onFileSelected: (path) {
                setState(() {
                  _resumePath = path;
                });
              },
            ),
            if (_resumePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Uploaded Resume: ${_resumePath!.split('/').last}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            const SizedBox(height: 16),
            Text(
                "Calculated Overall Percentage: ${_percentage.toStringAsFixed(2)}%"),
            const SizedBox(height: 16),
            CustomButton(
                text: "Calculate Percentage", onPressed: _calculatePercentage),
            const SizedBox(height: 10),
            CustomButton(
                text: "Submit", onPressed: _submitForm, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
