import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class PhoneSignUp extends StatefulWidget {
  static String id = "PhoneSignUp";
  @override
  _PhoneSignUpState createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var phone;
  String verificationID, verificationComplete;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                    ),
                    onChanged: (value) {
                      phone = ("+91" + value);
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        var user = await _auth.verifyPhoneNumber(
                            phoneNumber: phone,
                            verificationCompleted: (phoneAuthCredential) async {
                              print(phoneAuthCredential);
                            },
                            verificationFailed: (verificationFailed) async {
                              print(
                                  "Verification Failed... $verificationFailed");
                              //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(verificationFailed.message)));
                            },
                            codeSent: (verificationID, resendingToken) async {
                              setState(() {
                                this.verificationID = verificationID;
                              });
                            },
                            codeAutoRetrievalTimeout: (verificationID) async {
                              print("$verificationID");
                            });
                        Navigator.pushReplacementNamed(context, OTPScreen.id);
                      } catch (e) {
                        print(e);
                      }
                    },
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
