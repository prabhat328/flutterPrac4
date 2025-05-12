class User {
  String name;
  String email;
  String contact;
  String rollNo;
  Education hsc;
  Education ssc;
  List<SemesterMarks> semMarks;
  String resumeUrl;
  List<String> additionalCourses;

  User({
    required this.name,
    required this.email,
    required this.contact,
    required this.rollNo,
    required this.hsc,
    required this.ssc,
    required this.semMarks,
    required this.resumeUrl,
    required this.additionalCourses,
  });

  double calculateCGPA() {
    if (semMarks.isEmpty) return 0.0;
    double totalCgpa = semMarks.fold(0.0, (sum, sem) => sum + sem.cgpa);
    return totalCgpa / semMarks.length;
  }

  double calculateOverallPercentage() {
    return (calculateCGPA() * 9.5); // Approximate CGPA to percentage conversion
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'contact': contact,
      'rollNo': rollNo,
      'hsc': hsc.toJson(),
      'ssc': ssc.toJson(),
      'semMarks': semMarks.map((e) => e.toJson()).toList(),
      'resumeUrl': resumeUrl,
      'additionalCourses': additionalCourses,
    };
  }
}

class Education {
  String college;
  int passingYear;
  double totalMarks;
  double outOfMarks;

  Education({
    required this.college,
    required this.passingYear,
    required this.totalMarks,
    required this.outOfMarks,
  });

  double calculatePercentage() {
    return (totalMarks / outOfMarks) * 100;
  }

  Map<String, dynamic> toJson() {
    return {
      'college': college,
      'passingYear': passingYear,
      'totalMarks': totalMarks,
      'outOfMarks': outOfMarks,
      'percentage': calculatePercentage(),
    };
  }
}

class SemesterMarks {
  int semester;
  double cgpa;

  SemesterMarks({
    required this.semester,
    required this.cgpa,
  });

  Map<String, dynamic> toJson() {
    return {
      'semester': semester,
      'cgpa': cgpa,
    };
  }
}
