import 'package:firebase_assignment/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Enter Email Id',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ])),
              child: ElevatedButton(
                onPressed: () {
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) {
                    print("Account created sucessfully");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email address is already in use!!'),
                      ),
                    );
                    print("Account creation error: ${error.toString()}");
                  });
                },
                child: Text(
                  "Create account",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Colors.transparent, // Make the button transparent
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50), // Optional: Adjust padding as needed
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ])),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back to Previous page",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  primary: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
