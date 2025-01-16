import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  static const routeName = '/privacy_policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for Paw World',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'At Paw World, we take your privacy seriously. This Privacy Policy describes how we collect, use, and share information about you when you use our pet adoption app.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'We may collect information about you when you use our app, including:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                      '• Personal information: such as your name, email address, phone number, and location.'),
                  Text(
                      '• Pet information: such as your pet preferences, search history, and adoption inquiries.'),
                  Text(
                      '• Device information: such as your IP address, device type, and operating system.'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'How We Use Your Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'We may use the information we collect to:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('• Provide and improve our app and services.'),
                  Text(
                      '• Communicate with you about your pet adoption inquiries and updates.'),
                  Text(
                      '• Personalize your app experience by suggesting pets and related content.'),
                  Text(
                      '• Analyze app usage and trends to improve our offerings.'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Information Sharing',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'We may share your information with third-party service providers who assist us with our app and services. We do not sell your information to third parties.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Data Security',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'We implement reasonable measures to protect your information from unauthorized access, disclosure, or destruction.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Your Choices',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'You may opt-out of receiving app-related communications by adjusting your app settings. You may also request to delete your account and related data by contacting us.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Changes to This Policy',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'We may update this Privacy Policy from time to time. We encourage you to review this policy periodically for any changes.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'If you have any questions or concerns about this Privacy Policy or our app, please contact us at [Contact Information].',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
//
          ],
        ),
      ),
    );
  }
}
