import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id  = "UserScreen";
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(),
      ),
    );
  }
}
