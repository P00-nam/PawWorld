import 'package:flutter/material.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        centerTitle: true,
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('How do I change my profile picture?'),
            subtitle: Text(
                'Go to your Profile screen and click on the "Change Avatar" button. You can select a picture from your device\'s gallery.'),
          ),
          Divider(),
          ListTile(
            title: Text('How do I edit my nickname?'),
            subtitle: Text(
                'Go to your Profile screen and click on the "Edit Nickname" button. You can then enter your desired nickname and click "Save".'),
          ),
          Divider(),
          ListTile(
            title: Text('How do I log out of my account?'),
            subtitle: Text(
                'Go to your Profile screen and click on the "Logout" button. You will be logged out of your account.'),
          ),
          Divider(),
          ListTile(
            title:
                Text('How do I report a bug or give feedback about the app?'),
            subtitle: Text(
                'Go to the Feedback section in the Profile screen and click on the "Feedback" option. You can then enter your feedback and submit it.'),
          ),
          Divider(),
          ListTile(
            title: Text('How do I contact customer support?'),
            subtitle: Text(
                'Go to the Contact Us section in the Profile screen and click on the "Customer Support" option. You can then enter your query and contact details and submit it.'),
          ),
        ],
      ),
    );
  }
}
