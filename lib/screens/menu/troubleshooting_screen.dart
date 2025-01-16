import 'package:flutter/material.dart';

import '../app_color.dart';

class TroubleshootingScreen extends StatelessWidget {
  const TroubleshootingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troubleshooting'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Troubleshooting Guide',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Problem: I am unable to view the pets available for adoption.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Solution: Make sure you have an active internet connection. If the problem persists, try logging out and logging back in. If the problem still persists, please contact our support team.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Problem: I am unable to submit an adoption request.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Solution: Make sure you have filled out all the required fields in the adoption form. If the problem persists, try clearing the cache and data of the app. If the problem still persists, please contact our support team.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Problem: The app crashes when I try to view the pet details.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Solution: Make sure you have the latest version of the app installed. If the problem still persists, try restarting the app. If the problem still persists, please contact our support team.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'If none of the above solutions work, please contact our support team for further assistance.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Contact support team
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                  backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                child: const Text('Contact Support Team'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
