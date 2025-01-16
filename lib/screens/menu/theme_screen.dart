import 'package:flutter/material.dart';
import 'package:paw_world/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: Theme.of(context).brightness == Brightness.dark,
        onChanged: (value) {
          if (value) {
            Provider.of<ThemeProvider>(context, listen: false)
                .setThemeMode(ThemeMode.dark);
          } else {
            Provider.of<ThemeProvider>(context, listen: false)
                .setThemeMode(ThemeMode.light);
          }
        },
      ),
    );
  }
}
