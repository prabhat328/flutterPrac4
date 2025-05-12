import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onItemSelected;

  const CustomDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Company Portal',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.business,
            text: 'Company Details',
            onTap: () => onItemSelected('Company Details'),
          ),
          _buildDrawerItem(
            icon: Icons.app_registration,
            text: 'Registration',
            onTap: () => onItemSelected('Registration'),
          ),
          _buildDrawerItem(
            icon: Icons.file_present,
            text: 'View Resume',
            onTap: () => onItemSelected('View Resume'),
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () => onItemSelected('Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
