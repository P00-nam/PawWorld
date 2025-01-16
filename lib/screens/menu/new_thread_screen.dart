import 'package:flutter/material.dart';

import '../app_color.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({Key? key}) : super(key: key);

  @override
  _NewThreadScreenState createState() => _NewThreadScreenState();
}

class _NewThreadScreenState extends State<NewThreadScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _postContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Thread'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Thread Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title for your thread';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Post Content',
                ),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some content for your post';
                  }
                  return null;
                },
                onSaved: (value) {
                  _postContent = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the thread to your database
                    // Navigate back to the Community Forums screen
                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
