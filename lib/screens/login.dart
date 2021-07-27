import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  static String id = "LogIn";
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogInScreen> {
  var phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      phone = ("+91" + value);
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "SUBMIT",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
