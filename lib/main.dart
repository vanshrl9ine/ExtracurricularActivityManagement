import 'package:flutter/material.dart';
import 'package:yashgautam/screens/Login.dart';
import 'package:yashgautam/screens/Signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => const LoginScreen(), // Set the LoginScreen as the initial route
        '/signup': (context) => const SignupPage(),// Add a route for the SignupScreen
      },
    );
  }
}
