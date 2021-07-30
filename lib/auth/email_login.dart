import 'package:evento/auth/email_signup.dart';
import 'package:evento/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailLogIn extends StatefulWidget {
  static String id = "EmailLogIn";
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var email, password;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width,
        size = MediaQuery.of(context).size;
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
                  "Welcome,",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign In to continue!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 40,
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
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
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
                        var user = await _auth.signInWithEmailAndPassword(
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
                            "Sign In",
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
                      Text("I'm a new user."),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, EmailSignUp.id);
                        },
                        child: Text(
                          "Sign Up!",
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
