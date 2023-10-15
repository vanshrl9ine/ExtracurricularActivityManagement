import 'package:flutter/material.dart';
import 'package:yashgautam/screens/Login.dart';
import 'package:yashgautam/screens/SignUp.dart'; // Import the Signup screen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const LoginScreen(), // Set the LoginScreen as the initial route
        '/signup': (context) => const SignupScreen(), // Add a route for the SignupScreen
      },
    );
  }
}
