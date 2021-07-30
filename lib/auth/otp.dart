import 'package:evento/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  var credential;
  var verificationID;
  static String id = "OTP";
  OTPScreen({this.credential, this.verificationID});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otp;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();
  Future<dynamic> signUpWithPhone(phoneAuthCredential) async {
    try {
      var user = await _auth.signInWithCredential(phoneAuthCredential);
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
        _scaffoldStateKey.currentState.showSnackBar(
          SnackBar(
            content: Text("Phone Verified"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      PhoneAuthCredential phoneAuthCredential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationID,
                              smsCode: otp);
                      signUpWithPhone(phoneAuthCredential);
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
