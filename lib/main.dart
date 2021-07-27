import 'package:evento/screens/event_screen.dart';
import 'package:evento/screens/login.dart';
import 'package:evento/screens/otp.dart';
import 'package:evento/screens/signup.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(StartScreen());
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
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
