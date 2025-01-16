import 'package:flutter/material.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:provider/provider.dart';

import '../../provider/adoption_form_provider.dart';

class AdoptFormScreen extends StatefulWidget {
  const AdoptFormScreen({Key? key}) : super(key: key);

  @override
  State<AdoptFormScreen> createState() => _AdoptFormScreenState();
}

class _AdoptFormScreenState extends State<AdoptFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _hasOwnedPetBefore = false;
  bool _hasFencedYard = false;
  bool _isReadyToAdopt = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Form'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please fill in the following information:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length != 10) {
                      return 'Phone number should have exactly 10 digits';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text('Have you owned a pet before?'),
                  value: _hasOwnedPetBefore,
                  onChanged: (value) {
                    setState(() {
                      _hasOwnedPetBefore = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text('Do you have a fenced yard?'),
                  value: _hasFencedYard,
                  onChanged: (value) {
                    setState(() {
                      _hasFencedYard = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text('Are you ready to adopt a pet?'),
                  value: _isReadyToAdopt,
                  onChanged: (value) {
                    setState(() {
                      _isReadyToAdopt = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AdoptionFromProvider>().form(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              hasOwnedPetBefore: _hasOwnedPetBefore,
                              hasFencedYard: _hasFencedYard,
                              isReadyToAdopt: _isReadyToAdopt,
                            );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
