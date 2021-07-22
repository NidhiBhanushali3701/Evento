import 'package:flutter/material.dart';

void main() {
  runApp(StartScreen());
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Evento",
            ),
          ),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}
