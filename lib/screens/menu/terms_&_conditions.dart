import 'package:flutter/material.dart';
import 'package:paw_world/screens/app_color.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms and Conditions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'User Accounts: To create an account, you must provide your name and email address. You are responsible for maintaining the confidentiality of your account information.\n\nIntellectual Property: All content on this app, including text, graphics, logos, and images, is owned by [App Name]. You may not use any content from this app without our written consent.\n\nUser Conduct: You may not use this app to harass, intimidate, or bully other users. You may not post any content that is defamatory, obscene, or illegal.\n\nDisclaimer of Liability: This app is provided "as is" and we make no warranties, express or implied, regarding its use or performance. We are not liable for any damages or losses that may occur as a result of using this app.\n\nLimitation of Liability: Our liability for any damages or losses that may occur as a result of using this app is limited to the amount you paid for the app.\n\nTermination: We may terminate your account or access to this app at any time, for any reason.\n\nGoverning Law: These terms and conditions are governed by the laws of the United States.\n\nChanges to the Terms and Conditions: We may update these terms and conditions at any time. We will notify you of any changes by posting the new terms and conditions on this app.\n\nContact Information: If you have any questions or concerns about this app or these terms and conditions, please contact us at [Contact Information].',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'I agree to the terms and conditions',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isChecked ? _submit : null,
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                backgroundColor: MaterialStateProperty.all(AppColor.primary),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    // Handle submit action here
  }
}
