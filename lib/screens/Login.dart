import 'package:flutter/material.dart';
import 'package:yashgautam/screens/Signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF000208),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF000208).withOpacity(1),
                  Color(0xFF182C41).withOpacity(0.85),
                ],
                stops: [0.68, 1.0],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(6),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(2, 10, 10, 30),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'OpenSansRegular'
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(7.0),

                          ),
                          child: TextFormField(
                            cursorColor: Colors.white,

                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Color(0xFF000208),
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSansRegular'
                            ),
                          ),
                        ),
                        SizedBox(height: 13),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Color(0xFF000208),
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSansRegular'
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 2, 2, 10),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Forgot password screen
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white, fontFamily: 'calibri'),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 125,
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF182C41), // Set the button's background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontFamily: 'Calibri', fontSize: 20),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(nameController.text);
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
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      // Sign-up screen
                      Navigator.pushNamed(context, '/signup');

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
