import 'package:flutter/material.dart';

class PhoneLogIn extends StatefulWidget {
  static String id = "PhoneLogIn";
  @override
  _PhoneLogInState createState() => _PhoneLogInState();
}

class _PhoneLogInState extends State<PhoneLogIn> {
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
