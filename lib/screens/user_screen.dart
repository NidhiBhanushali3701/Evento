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
        title: Text(
          "Profile",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            margin: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(),
                ),
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
