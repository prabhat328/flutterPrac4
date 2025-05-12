import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/company_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/resume_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPO App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/companies': (context) => const CompanyScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/resume': (context) => const ResumeScreen(),
      },
    );
  }
}
