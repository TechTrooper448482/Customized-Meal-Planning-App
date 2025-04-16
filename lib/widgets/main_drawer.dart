import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.restaurant_menu_rounded,
                    size: 50, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 18),
                const Text(
                  'Let\'s Cook!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood_rounded,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              onSelectScreen('settings');
            },
          ),
        ],
      ),
    );
  }
}
