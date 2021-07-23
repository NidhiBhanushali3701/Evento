import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  static String id = "EventScreen";
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image(
              width: 30,
              height: 30,
              image: NetworkImage(
                "https://images.unsplash.com/photo-1603912743224-7f7643c3e25b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
              ),
            ),
            SizedBox(),
            Text("Event Head"),
            SizedBox(),
            Container(
              child: Text("Event Info"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.deepPurpleAccent,
        selectedIconTheme:
            IconThemeData(color: Colors.deepPurpleAccent, size: 36),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home_sharp,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: "Profile",
          ),
        ],
        iconSize: 27,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
