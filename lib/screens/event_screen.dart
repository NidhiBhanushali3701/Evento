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
    Share.share(
        "I am attending Evento Event ${event.name}! You can also join it Link ${event.link} at ${event.dateTime}");
  }

  Future incrementEventAttender() async {
    var evt = await _firebaseFirestore.collection("events").get();
    //var a = evt['noOfUsers'];
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      event = arguments["This Event"];
    }
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
                      "${event.img}",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHt * 0.01,
              ),
              ScrollingContainer(
                event: event,
              ),
              SizedBox(
                height: screenHt * 0.01,
              ),
              Container(
                child: MaterialButton(
                  child: Text("Attend!"),
                  onPressed: () async {
                    //await incrementEventAttender();
                    event.setNoOfUsers(event.noOfUsers + 1);
                    Navigator.pop(context, event);
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
  final Event event;
  ScrollingContainer({this.event});
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
                    "${event.name}",
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
                    "${event.description}",
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
