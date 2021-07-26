import 'package:evento/obj/event.dart';
import 'package:evento/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:evento/resources.dart';
import 'package:evento/obj/event.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              TopBar(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Text(events[index].name),
                          );
                        },
                        itemCount: events.length,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_outlined),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.deepPurpleAccent,
        selectedIconTheme:
            IconThemeData(color: Colors.deepPurpleAccent, size: 30),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_sharp,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UserScreen.id);
              },
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
