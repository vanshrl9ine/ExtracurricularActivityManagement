import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordMatching = true;
  final _formKey = GlobalKey<FormState(); // Key for form validation

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF000208).withOpacity(1),
                  Color(0xFFEEEFEF).withOpacity(1),
                ],
                stops: [0.65, 1.0],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey, // Use the form key for validation
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // You can add more email validation here if needed.
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more password validation here if needed.
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'Confirm Password',
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Forgot password screen
                        },
                        child: const Text(
                          'Forgot Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.black, fontFamily: 'Calibri'),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, proceed with sign-up
                              print(emailController.text);
                              print(passwordController.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.12,
              color: Color(0xFF182C41),
              child: Row(
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigate to the login screen
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
