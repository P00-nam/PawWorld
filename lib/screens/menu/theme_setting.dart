import 'package:flutter/material.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    // SwitchListTile(
    //   title: const Text('Dark Mode'),
    //   value: Theme.of(context).brightness == Brightness.dark,
    //   onChanged: (value) {
    //     if (value) {
    //       Provider.of<ThemeModel>(context, listen: false)
    //           .setThemeMode(ThemeMode.dark);
    //     } else {
    //       Provider.of<ThemeModel>(context, listen: false)
    //           .setThemeMode(ThemeMode.light);
    //     }
    //   },
    // );
  }
}
