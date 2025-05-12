import '../core/models/user_model.dart';

final List<User> sampleUsers = [
  User(
    name: "Prabhat Kumar",
    email: "prabhat@example.com",
    contact: "9876543210",
    rollNo: "MCA2025001",
    hsc: Education(
        college: "ABC College",
        passingYear: 2020,
        totalMarks: 450,
        outOfMarks: 500),
    ssc: Education(
        college: "XYZ High School",
        passingYear: 2018,
        totalMarks: 400,
        outOfMarks: 500),
    semMarks: [
      SemesterMarks(semester: 1, cgpa: 8.2),
      SemesterMarks(semester: 2, cgpa: 8.5),
      SemesterMarks(semester: 3, cgpa: 8.8),
      SemesterMarks(semester: 4, cgpa: 9.0),
      SemesterMarks(semester: 5, cgpa: 9.2),
    ],
    resumeUrl: "https://example.com/resume_prabhat.pdf",
    additionalCourses: ["Flutter Development", "AWS Certification"],
  ),
  User(
    name: "Ananya Sharma",
    email: "ananya@example.com",
    contact: "8765432109",
    rollNo: "MCA2025002",
    hsc: Education(
        college: "DEF College",
        passingYear: 2020,
        totalMarks: 470,
        outOfMarks: 500),
    ssc: Education(
        college: "LMN High School",
        passingYear: 2018,
        totalMarks: 420,
        outOfMarks: 500),
    semMarks: [
      SemesterMarks(semester: 1, cgpa: 8.0),
      SemesterMarks(semester: 2, cgpa: 8.3),
      SemesterMarks(semester: 3, cgpa: 8.7),
      SemesterMarks(semester: 4, cgpa: 8.9),
      SemesterMarks(semester: 5, cgpa: 9.1),
    ],
    resumeUrl: "https://example.com/resume_ananya.pdf",
    additionalCourses: ["Machine Learning", "Data Science"],
  ),
];
