class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Enter a valid name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Contact number cannot be empty";
    }
    if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  static String? validateRollNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Roll number cannot be empty";
    }
    return null;
  }

  static String? validateMarks(String? value) {
    if (value == null || value.isEmpty) {
      return "Marks cannot be empty";
    }
    try {
      double marks = double.parse(value);
      if (marks < 0) {
        return "Marks cannot be negative";
      }
    } catch (e) {
      return "Enter a valid number";
    }
    return null;
  }
}
