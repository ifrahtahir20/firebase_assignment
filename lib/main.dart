import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_assignment/Assignment/Email%20Registeration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyBxHU2HqdTkyfuw55RzqHbzltuyQGKH2W0", // paste your api key here
      appId:
          "1:892126757746:android:98266a1d3687b3749d13eb", //paste your app id here
      messagingSenderId: "892126757746", //paste your messagingSenderId here
      projectId: "practiceproject-4896a", //paste your project id here
    ),
  );
  runApp(MyApp());
  print("object");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        centered: true,
        splash: Image.asset(
          'assets/images/splash_screen.png',
        ),
        nextScreen: EmailReg(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
    );
  }
}
