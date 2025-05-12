import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewResumeScreen extends StatelessWidget {
  final String resumePath;

  const ViewResumeScreen({super.key, required this.resumePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Resume")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Uploaded Resume",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (resumePath.isNotEmpty)
              Expanded(
                child: PDFView(
                  filePath: resumePath,
                ),
              )
            else
              const Text("No resume uploaded."),
          ],
        ),
      ),
    );
  }
}
