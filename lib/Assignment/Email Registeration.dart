import 'package:firebase_assignment/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'Google Sign in.dart';
import 'Phone no Authentication.dart';
import 'Signup.dart';

class EmailReg extends StatefulWidget {
  const EmailReg({Key? key}) : super(key: key);

  @override
  State<EmailReg> createState() => _EmailRegState();
}

class _EmailRegState extends State<EmailReg> {
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
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Enter password',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: Colors.grey.shade50,
                            style: BorderStyle.none))),
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
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) {
                    print("Login sucessfully");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    bool loginSuccessful = false;
                    if (!loginSuccessful) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incorrect username or password'),
                        ),
                      );
                    }
                    print("Login error: ${error.toString()}");
                  });
                },
                child: Text(
                  "Signin",
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
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                  ),
                  SizedBox(
                    width: 5,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        primary:
                            Colors.transparent, // Make the button transparent
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                anotherway();
              },
              child: Text("Try another way!"),
            )
          ],
        ),
      ),
    );
  }

  void anotherway() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 20),
          height: 270,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Try Another Way',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Container(
                width: 270,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInAnonymously().then((value) {
                        print("signInAnonymously 1 ${value.user.toString()}");
                        print(
                            "signInAnonymously 2 ${value.additionalUserInfo.toString()}");
                        print(
                            "signInAnonymously 3 ${value.credential.toString()}");
                        print("Sucessful Anonymous login");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Anonymous Login error: ${error.toString()}");
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/anonymous.jpg",
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login Anonmously",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    await GoogleSignInService().signInWithGoogle();
                    print("Gmail Login sucessfully");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/googlelogo.jpg",
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login with Gmail",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneNoAuthentication()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/phone_icon.png",
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign In with Phone no",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
