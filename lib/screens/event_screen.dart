import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/obj/event.dart';
import 'package:evento/screens/home_screen.dart';
import 'package:evento/screens/user_screen.dart';
import 'package:flutter/material.dart';
import "package:share/share.dart";

class EventScreen extends StatefulWidget {
  static String id = "EventScreen";
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int selectedIndex = 0;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Event event = Event();

  void shareEvent() {
    Share.share("I am attending Evento Event \${event.name}");
  }

  Future incrementEventAttender() async {
    var evt =
        await _firebaseFirestore.collection("events").doc("myevent").get();
    var a = evt['noOfUsers'];
  }

  @override
  Widget build(BuildContext context) {
    double screenHt = MediaQuery.of(context).size.height,
        screenWd = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  height: screenHt * 0.35,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1603912743224-7f7643c3e25b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHt * 0.01,
              ),
              ScrollingContainer(),
              SizedBox(
                height: screenHt * 0.01,
              ),
              Container(
                child: MaterialButton(
                  child: Text("Attend!"),
                  onPressed: () async {
                    await incrementEventAttender();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          print("ht $screenHt , wd $screenWd");
          shareEvent();
        },
        child: Icon(
          Icons.ios_share,
        ),
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              },
              icon: Icon(
                Icons.home_sharp,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, UserScreen.id);
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

class ScrollingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHt = MediaQuery.of(context).size.height,
        screenWd = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Event Head",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHt * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: Container(
                  child: Text(
                    "Event Info : Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum alias officiis assumenda officia quibusdam deleniti eos cupiditate dolore doloribus!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
