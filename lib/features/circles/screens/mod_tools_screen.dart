import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ModToolsScreen extends StatelessWidget {
  final String name;
  const ModToolsScreen({super.key, required this.name});

  void navigateToModTools(BuildContext context) {
    Routemaster.of(context).push('/edit-circle/$name');
  }

  void navigateToAddMode(BuildContext context) {
    Routemaster.of(context).push('/add-mods/$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.add_moderator),
            title: const Text('Add Aministrator'),
            onTap: () => navigateToAddMode(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Circle'),
            onTap: () => navigateToModTools(context),
          ),
        ],
      ),
    );
  }
}
