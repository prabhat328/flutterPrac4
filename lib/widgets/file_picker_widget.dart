import 'package:flutter/material.dart';
import '../core/utils/file_helper.dart';

class FilePickerWidget extends StatefulWidget {
  final Function(String) onFileSelected;

  const FilePickerWidget({super.key, required this.onFileSelected});

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  String? fileName;

  void _pickFile() async {
    String? filePath = await FileHelper.pickResumeFile();
    if (filePath != null) {
      setState(() {
        fileName = filePath.split('/').last;
      });
      widget.onFileSelected(filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fileName ?? "No file selected",
            style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: _pickFile,
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload Resume"),
        ),
      ],
    );
  }
}
