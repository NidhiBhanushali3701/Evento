import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id = "UserScreen";
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var loggedInUser;
  var User;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getUserInfo() async {
    getCurrentUser();
    var userInfo = await _firestore.collection("users").get();
    for (var u in userInfo.docs) {
      if (u.data()['email'] == loggedInUser.email) {
        print(u.data()["email"]);
        User = u.data();
        break;
      }
    }
  }

  Future getCurrentUser() async {
    try {
      var user = await _auth.currentUser;
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
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      loggedInUser = arguments["loggedInUser"];
      getUserInfo();
    }
    double screenHt = MediaQuery.of(context).size.height,
        screenWd = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.deepPurpleAccent, letterSpacing: 1.5),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepPurpleAccent,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            margin: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    height: screenHt * 0.030,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1900&q=80"),
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
                    title: Text("${User['name']}"),
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
                    leading: Icon(Icons.phone),
                    title: Text("${User['phone']}"),
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
