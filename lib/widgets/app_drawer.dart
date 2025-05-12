import 'package:flutter/material.dart';
import '../services/student_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<bool>(
        future: StudentService.isRegistered(),
        builder: (context, snapshot) {
          final isRegistered = snapshot.data ?? false;

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.school,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'TPO Portal',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      isRegistered ? 'Welcome back!' : 'Get started',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.app_registration),
                title: const Text('Registration'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/registration');
                },
              ),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Companies'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/companies');
                },
              ),
              if (isRegistered) ...[
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('My Resume'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/resume');
                  },
                ),
              ],
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to settings
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Support'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to help
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
