import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id = "UserScreen";
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Profile",),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            margin: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                CircleAvatar(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
