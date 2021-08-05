import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id = "UserScreen";
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var loggedInUser;
  var userInfo;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getUserInfo() async {
    userInfo = await _firestore
        .collection("users")
        .where('email', isEqualTo: loggedInUser.email)
        .get();
  }

  void getCurrentUser() async {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    double screenHt = MediaQuery.of(context).size.height,
        screenWd = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            margin: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: screenHt * 0.030,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage("${loggedInUser.photoURL}"),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: screenHt * 0.030,
                  ),
                ),
                Container(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("${loggedInUser.displayName}"),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  child: Divider(
                    height: screenHt * 0.030,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text("${loggedInUser.email}"),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
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
