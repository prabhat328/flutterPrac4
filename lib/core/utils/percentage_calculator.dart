class PercentageCalculator {
  static double calculatePercentage(double totalMarks, double outOfMarks) {
    if (outOfMarks == 0) return 0.0;
    return (totalMarks / outOfMarks) * 100;
  }

  static double convertCGPAToPercentage(double cgpa) {
    return cgpa * 9.5; // Approximate conversion
  }

  static double calculateOverallCGPA(List<double> semesterCgpas) {
    if (semesterCgpas.isEmpty) return 0.0;
    double totalCgpa = semesterCgpas.reduce((a, b) => a + b);
    return totalCgpa / semesterCgpas.length;
  }
}
