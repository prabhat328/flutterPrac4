import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../services/student_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TPO Portal'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<bool>(
        future: StudentService.isRegistered(),
        builder: (context, snapshot) {
          final isRegistered = snapshot.data ?? false;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Training & Placement Office',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your gateway to career opportunities',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          if (!isRegistered)
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registration');
                              },
                              child: const Text('Register Now'),
                            ),
                          if (isRegistered)
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: const Text('View Profile'),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Upcoming Events',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildEventCard(
                    context,
                    'Campus Recruitment Drive',
                    'May 15, 2023',
                    'Major tech companies will be visiting for recruitment.',
                    Icons.event,
                  ),
                  const SizedBox(height: 12),
                  _buildEventCard(
                    context,
                    'Resume Building Workshop',
                    'May 10, 2023',
                    'Learn how to create an impressive resume.',
                    Icons.description,
                  ),
                  const SizedBox(height: 12),
                  _buildEventCard(
                    context,
                    'Mock Interview Session',
                    'May 12, 2023',
                    'Practice your interview skills with industry experts.',
                    Icons.people,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Quick Links',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildQuickLink(
                        context,
                        'Companies',
                        Icons.business,
                        () => Navigator.pushNamed(context, '/companies'),
                      ),
                      _buildQuickLink(
                        context,
                        'Registration',
                        Icons.app_registration,
                        () => Navigator.pushNamed(context, '/registration'),
                      ),
                      if (isRegistered)
                        _buildQuickLink(
                          context,
                          'Profile',
                          Icons.person,
                          () => Navigator.pushNamed(context, '/profile'),
                        ),
                      if (isRegistered)
                        _buildQuickLink(
                          context,
                          'Resume',
                          Icons.description,
                          () => Navigator.pushNamed(context, '/resume'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventCard(
    BuildContext context,
    String title,
    String date,
    String description,
    IconData icon,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(description),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildQuickLink(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
