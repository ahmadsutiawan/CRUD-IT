import 'package:flutter/material.dart';

class GenListTile extends StatelessWidget {
  const GenListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: TextStyle(color: Colors.white70),
      ),
      onTap: onTap,
    );
  }
}
