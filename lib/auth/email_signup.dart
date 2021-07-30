import 'package:evento/auth/email_login.dart';
import 'package:evento/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignUp extends StatefulWidget {
  static String id = "EmailSignUp";
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  var email, name, password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Create Account,",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign Up to get started!",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    // ignore: missing_return
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'Enter valid Name'),
                    onChanged: (value) => name = value,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    // ignore: missing_return
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    onChanged: (value) => email = value,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    // ignore: missing_return

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'Enter secure password'),
                    onChanged: (value) => password = value,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: Text("Forgot Password?"),
                  onTap: () {
                    print("forgot pass");
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white10),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () async {
                      try {
                        var user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Color(0xFFf93a5a),
                          Color(0xFFfa7449)
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("I'm already a member."),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, EmailLogIn.id);
                        },
                        child: Text(
                          "Sign In!",
                          style: TextStyle(
                            color: Color(0xFFf93a5a),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
