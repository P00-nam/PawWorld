// Importing the necessary packages
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  // Defining a variable to hold the notification status
  bool _notificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text('Turn on notifications'),
            value: _notificationOn,
            onChanged: (bool value) {
              setState(() {
                _notificationOn = value;
              });
            },
          ),
          const SizedBox(height: 16),
          const Text('Notification frequency'),
          const RadioListTile(
            title: Text('Hourly'),
            value: 0,
            groupValue: null,
            onChanged: null,
          ),
          const RadioListTile(
            title: Text('Daily'),
            value: 1,
            groupValue: null,
            onChanged: null,
          ),
          const RadioListTile(
            title: Text('Weekly'),
            value: 2,
            groupValue: null,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
