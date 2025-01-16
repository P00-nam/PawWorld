import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Paw World',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our pet adoption app makes it easy to find your new furry friend. With a simple and user-friendly interface, you can browse through available pets, learn about their personality and needs, and connect with shelters or pet owners looking for a good home. Unique features include a match-making algorithm that suggests pets based on your preferences and a virtual meet-and-greet option that lets you interact with pets before adopting them. We are a team of passionate animal lovers dedicated to making the world a better place for pets and their humans. Try our app today and find your perfect match!',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
