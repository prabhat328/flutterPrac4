class Company {
  String name;
  String location;
  String salaryRange;
  String shortProfile;

  Company({
    required this.name,
    required this.location,
    required this.salaryRange,
    required this.shortProfile,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'salaryRange': salaryRange,
      'shortProfile': shortProfile,
    };
  }
}
