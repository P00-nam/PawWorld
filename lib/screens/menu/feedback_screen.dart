import 'package:flutter/material.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Feedback or suggestion',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your feedback or suggestion';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                _submitFeedback(context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                backgroundColor: MaterialStateProperty.all(AppColor.primary),
              ),
              child: const Text('Submit'),
            ),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const Text('appdevelopers@example.com'),
            onTap: () {
              launchUrl('mailto:appdevelopers@example.com' as Uri);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone'),
            subtitle: const Text('123-456-7890'),
            onTap: () {
              launchUrl('tel:1234567890' as Uri);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _submitFeedback(BuildContext context) {
    if (_feedbackController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your feedback or suggestion'),
        ),
      );
      return;
    }

    // Send the feedback to the app developers
    // You can use an email package or an API to send the feedback
    // For example, you can use the `url_launcher` package to launch the user's email app
    String feedback = _feedbackController.text;
    launchUrl(
        'mailto:appdevelopers@example.com?subject=App feedback&body=$feedback'
            as Uri);

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you for your feedback'),
      ),
    );

    // Clear the feedback field
    _feedbackController.clear();
  }
}
