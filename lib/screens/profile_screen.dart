import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final String contact;
  final String rollNo;
  final double sscPercentage;
  final double hscPercentage;
  final double cgpaPercentage;
  final String resumePath;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.contact,
    required this.rollNo,
    required this.sscPercentage,
    required this.hscPercentage,
    required this.cgpaPercentage,
    required this.resumePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Profile Details",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow("Name", name),
          _buildDetailRow("Email", email),
          _buildDetailRow("Contact", contact),
          _buildDetailRow("Roll No", rollNo),
          const SizedBox(height: 16),
          const Text("SSC Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildDetailRow("SSC Percentage", "$sscPercentage%"),
          const SizedBox(height: 16),
          const Text("HSC Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildDetailRow("HSC Percentage", "$hscPercentage%"),
          const SizedBox(height: 16),
          const Text("College CGPA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildDetailRow("CGPA Percentage", "$cgpaPercentage%"),
          const SizedBox(height: 16),
          const Text("Uploaded Resume",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildDetailRow("Resume",
              resumePath.isNotEmpty ? resumePath : "No resume uploaded."),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
