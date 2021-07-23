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
      },
    );
  }
}
