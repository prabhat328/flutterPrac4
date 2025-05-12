import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class RegistrationService extends ChangeNotifier {
  final List<User> _users = [];

  List<User> get users => _users;

  void registerUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  User? getUserByEmail(String email) {
    return _users.firstWhere((user) => user.email == email,
        orElse: () => User(
              name: '',
              email: '',
              contact: '',
              rollNo: '',
              hsc: Education(
                  college: '', passingYear: 0, totalMarks: 0, outOfMarks: 0),
              ssc: Education(
                  college: '', passingYear: 0, totalMarks: 0, outOfMarks: 0),
              semMarks: [],
              resumeUrl: '',
              additionalCourses: [],
            ));
  }
}
