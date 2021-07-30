import 'package:evento/auth/email_signup.dart';
import 'package:evento/screens/event_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/email_login.dart';
import 'auth/otp.dart';
import 'auth/phone_login.dart';
import 'auth/phone_signup.dart';
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
      initialRoute: EmailSignUp.id,
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
        PhoneLogIn.id: (context) {
          return PhoneLogIn();
        },
        PhoneSignUp.id: (context) {
          return PhoneSignUp();
        },
        EmailLogIn.id: (context) {
          return EmailLogIn();
        },
        EmailSignUp.id: (context) {
          return EmailSignUp();
        },
        OTPScreen.id: (context) {
          return OTPScreen();
        },
      },
    );
  }
}
