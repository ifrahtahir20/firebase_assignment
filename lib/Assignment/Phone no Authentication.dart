import 'package:firebase_assignment/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNoAuthentication extends StatefulWidget {
  const PhoneNoAuthentication({Key? key}) : super(key: key);

  @override
  State<PhoneNoAuthentication> createState() => _PhoneNoAuthenticationState();
}

class _PhoneNoAuthenticationState extends State<PhoneNoAuthentication> {
  var phoneController = TextEditingController();
  var OTPController = TextEditingController();
  String verificationId = "";
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
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Enter phone (e.g +923201234567)",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
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
                onPressed: () async {
                  String phone = phoneController.text.toString();
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phone,
                      timeout: Duration(seconds: 60),
                      verificationCompleted: (PhoneAuthCredential credential) {
                        print("${credential.toString()}");
                        print("verification completed sucessfully");
                        print("sucessfully login using phone no");
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print(e.code);
                        print(e.message);
                        if (e.code == 'invalid-phone-number') {
                          print('The provided phone number is not valid.');
                        }
                        print("${e.toString()}");
                      },
                      codeSent: (verificationId, int? resendToken) {
                        print("Code sent to provided number");
                        print("verification id = $verificationId");
                        print("token= ${resendToken}");
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        print("Time out");
                      });
                },
                child: Text(
                  "Send Code",
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
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: OTPController,
                decoration: InputDecoration(
                    hintText: "Enter code recieved on your phone",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.grey.shade50))),
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
                onPressed: () async {
                  String OTP = OTPController.text.toString();
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: OTP);
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      print("Login with Phone no sucessfully");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    });
                  } catch (e) {
                    print("Login with phone no error: ${e.toString()}");
                  }
                },
                child: Text(
                  "Verify Phone no",
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
          ],
        ),
      ),
    );
  }
}
