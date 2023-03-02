import 'package:flutter/material.dart';
import 'package:paw_world/login_signup/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.brown,
          ),
          scaffoldBackgroundColor: Colors.brown.shade100),
      home: const LoginPage(),
    );
  }
}
