import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FileHelper {
  static Future<String?> pickResumeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file.path;
    }
    return null;
  }
}
