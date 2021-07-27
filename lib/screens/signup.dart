import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "SignUp";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
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
                            print("Verification Failed... $verificationFailed");
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(verificationFailed.message)));
                          },
                          codeSent: (verificationID, resendingToken) async {
                            setState(() {
                              this.verificationID = verificationID;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationID) async {
                            print("$verificationID");
                          });
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
    );
  }
}
