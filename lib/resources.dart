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
                backgroundImage: NetworkImage("${loggedInUser.photoURL}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
