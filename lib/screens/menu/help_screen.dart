import 'package:flutter/material.dart';
import 'package:paw_world/screens/menu/community_forums_screen.dart';
import 'package:paw_world/screens/menu/contact_screen.dart';
import 'package:paw_world/screens/menu/faqs_screen.dart';
import 'package:paw_world/screens/menu/glossary.dart';
import 'package:paw_world/screens/menu/troubleshooting_screen.dart';
import 'package:paw_world/screens/menu/user_manual_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Frequently Asked Questions (FAQs)'),
            leading: const Icon(Icons.help_outline),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FAQsScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Contact Information'),
            leading: const Icon(Icons.contact_phone),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Troubleshooting'),
            leading: const Icon(Icons.bug_report),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TroubleshootingScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Glossary'),
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GlossaryScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('User Manual'),
            leading: const Icon(Icons.menu_book),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserManualScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Community Forums'),
            leading: const Icon(Icons.forum),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommunityForumsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
