import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // Set this property to false
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack( // Use a Stack to position the bottom navigation bar behind the keyboard
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
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontFamily: 'Calibri'),
                          ),
                          onPressed: () {
                            print(nameController.text);
                            print(passwordController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned( // Position the bottom navigation bar at the bottom
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
