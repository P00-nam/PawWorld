import 'package:flutter/material.dart';
import 'package:paw_world/screens/menu/notification_settings_screen.dart';
import 'package:paw_world/screens/menu/theme_setting.dart';

class SettingScreeen extends StatefulWidget {
  const SettingScreeen({super.key});

  @override
  State<SettingScreeen> createState() => _SettingScreeenState();
}

class _SettingScreeenState extends State<SettingScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notification Setting'),
            leading: const Icon(Icons.notifications),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationSettings()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('BackUp Setting'),
            leading: const Icon(Icons.backup),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const BackUpSettings()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Theme Setting'),
            leading: const Icon(Icons.light_mode),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThemeSettings()));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
