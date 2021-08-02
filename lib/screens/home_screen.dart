import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/obj/event.dart';
import 'package:evento/resources.dart';
import 'package:evento/screens/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List events = [];
  var loggedInUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future getCurrentUser() async {
    var user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
              StreamBuilder<QuerySnapshot>(
                  stream: _firebase.collection("events").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      for (var event in snapshot.data.docs.reversed) {
                        var e = Event();
                        e.setName(event.get('name'));
                        e.setDateTime(event.get('dateTime'));
                        e.setDescription(event.get("description"));
                        e.setImg(event.get("img"));
                        e.setNoOfUsers(event.get("noOfUsers"));
                        events.add(e);
                      }
                      return Row(
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
                      );
                    }
                  })
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
