import 'package:evento/screens/user_screen.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  var loggedInUser;
  TopBar({this.loggedInUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Evento",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UserScreen.id);
              },
              child: CircleAvatar(
                radius: 27,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1900&q=80"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
