import 'package:flutter/material.dart';
import 'package:yashgautam/screens/Login.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const SignupPage(),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordMatching = true;
  final _formKey = GlobalKey<FormState>();

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
                  Color(0xFF182C41).withOpacity(0.85),
                ],
                stops: [0.68, 1.0],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(5, 10, 20, 30),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(7.0),


                        ),
                        child: TextFormField(
                          controller: emailController,
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
                            fontFamily: 'OpenSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
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
                            fontFamily: 'OpenSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(7.0),


                        ),
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
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Color(0xFF000208),
                            filled: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 60,
                        width: 150,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF182C41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
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
                      Navigator.pushNamed(context, '/');

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
