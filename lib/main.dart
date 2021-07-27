import 'package:evento/screens/event_screen.dart';
import 'package:evento/screens/login.dart';
import 'package:evento/screens/otp.dart';
import 'package:evento/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StartScreen());
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpScreen.id,
      routes: {
        HomeScreen.id: (context) {
          return HomeScreen();
        },
        UserScreen.id: (context) {
          return UserScreen();
        },
        EventScreen.id: (context) {
          return EventScreen();
        },
        LogInScreen.id: (context) {
          return LogInScreen();
        },
        SignUpScreen.id: (context) {
          return SignUpScreen();
        },
        OTPScreen.id: (context) {
          return OTPScreen();
        },
      },
    );
  }
}
