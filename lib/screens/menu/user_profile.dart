import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:paw_world/screens/menu/feedback_screen.dart';
import 'package:paw_world/screens/menu/help_screen.dart';
import 'package:paw_world/screens/menu/privacy_policy.dart';
import 'package:paw_world/screens/menu/setting_screen.dart';
import 'package:paw_world/screens/menu/terms_&_conditions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_signup/login.dart';
import 'about_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String _nickname = '';
  late String _imagePath = '';
  // final AuthService authService = AuthService(client: null);

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nickname = prefs.getString('nickname') ?? 'Guest';
      _imagePath = prefs.getString('imagePath') ?? '';
    });
  }

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', pickedFile.path);
    }
  }

  Future<void> _editNickname() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: _nickname);
        return AlertDialog(
          title: const Text('Edit Nickname'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _nickname = result;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('nickname', result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: _imagePath.isNotEmpty
                    ? FileImage(File(_imagePath))
                    : const AssetImage('asset/dog_image.png')
                        as ImageProvider<Object>,
              ),
              ElevatedButton(
                onPressed: _selectImage,
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                  backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                child: const Text('Change Avatar'),
              ),
              const SizedBox(height: 16),
              Text(
                'Nickname: $_nickname',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: _editNickname,
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                  backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                child: const Text('Edit Nickname'),
              ),
              ListTile(
                title: const Text('About'),
                leading: const Icon(Icons.info_outline),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()));
                },
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreeen()));
                },
              ),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Help'),
                leading: const Icon(Icons.help_outline),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpScreen()));
                },
              ),
              ListTile(
                title: const Text('Feedback'),
                leading: const Icon(Icons.feedback),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackScreen()));
                },
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                leading: const Icon(Icons.privacy_tip),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen()));
                },
              ),
              ListTile(
                title: const Text('Terms and Conditions'),
                leading: const Icon(Icons.description),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TermsAndConditionsScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
