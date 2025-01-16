import 'package:flutter/material.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glossary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildGlossaryTerm('API',
              'An API, or application programming interface, is a set of protocols and tools for building software applications. APIs allow different software applications to communicate with each other.'),
          _buildGlossaryTerm('Push Notification',
              'A push notification is a message that is sent from a server to an app on a mobile device. Push notifications can be used to alert users to new content or events, even when the app is not currently open.'),
          // _buildGlossaryTerm('Term 3', 'Definition 3'),
        ],
      ),
    );
  }

  Widget _buildGlossaryTerm(String term, String definition) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            term,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            definition,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
