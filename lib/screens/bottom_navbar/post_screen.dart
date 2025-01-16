import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_world/screens/app_color.dart';

import '../../network/api_const.dart';

enum Gender {
  male,
  female,
}

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Gender? _gender;
  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  File? _imageFile;

  final picker = ImagePicker();

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  void _handlePostButtonPressed() async {
    if (_nameController.text.isEmpty ||
        _gender == null ||
        _colorController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _categoryController.text.isEmpty ||
        _imageFile == null) {
      // If any required field is empty, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all the required fields.'),
        ),
      );
      return;
    }

    final name = _nameController.text;
    final gender = _gender.toString().split('.').last;
    final color = _colorController.text;
    final description = _descriptionController.text;
    final category = _categoryController.text;
    try {
      final bytes = await _imageFile!.readAsBytes();

      final uri = Uri.parse("${ApiConst.baseUrl}postPet");
      final request = http.MultipartRequest('POST', uri);
      request.fields['name'] = name;
      request.fields['gender'] = gender;
      request.fields['color'] = color;
      request.fields['description'] = description;
      request.fields['category'] = category;
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: _imageFile!.path.split('/').last,
      ));
      final response = await request.send();

      print(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pet added successfully.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pet addition failed.'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              Row(
                children: [
                  Radio<Gender>(
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Male'),
                  const SizedBox(width: 24),
                  Radio<Gender>(
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
              TextField(
                controller: _colorController,
                decoration: const InputDecoration(
                  labelText: 'Color',
                ),
              ),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter Category',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                ),
              ),
              const SizedBox(height: 16.0),
              _imageFile != null ? Image.file(_imageFile!) : Container(),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _getImage(ImageSource.gallery),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary),
                    ),
                    child: const Text('Choose from gallery'),
                  ),
                  ElevatedButton(
                    onPressed: () => _getImage(ImageSource.camera),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary),
                    ),
                    child: const Text('Take a picture'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _handlePostButtonPressed,
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                  backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
