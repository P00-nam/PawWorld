import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  bool agree = false;

  void _perform() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
      ),
      body: Column(children: [
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
            ),
            const Text(
              'I have read and accept terms and conditions',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        ElevatedButton(
            onPressed: agree ? _perform : null, child: const Text('Continue'))
      ]),
    );
  }
}
