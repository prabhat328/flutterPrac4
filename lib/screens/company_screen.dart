import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Company Details",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow("Company Name", "Tech Innovators Pvt Ltd"),
          _buildDetailRow("Location", "Bangalore, India"),
          _buildDetailRow("Salary Range", "₹4,00,000 - ₹8,00,000 per annum"),
          _buildDetailRow("Profile",
              "We specialize in AI-powered solutions and cloud computing."),
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
