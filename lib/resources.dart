import 'package:flutter/material.dart';

Widget TopBar({var loggedInUser, Function onTap}) {
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
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: onTap,
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
