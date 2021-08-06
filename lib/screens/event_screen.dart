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
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  Event event = Event();

  void shareEvent() {
    Share.share(
        "I am attending Evento Event ${event.name}! You can also join it Link ${event.link} at ${event.dateTime}. Download the app now @Evento");
  }

  Future incrementEventAttender() async {
    var evt = await _firebase.collection("events").get();
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
                onPress: () {
                  shareEvent();
                },
              ),
              SizedBox(
                height: screenHt * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Colors.deepPurple,
                        Colors.deepPurpleAccent
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Attend event",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    event.setNoOfUsers(event.noOfUsers + 1);
                    Navigator.pop(context, event);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You can attend Event!"),
                    ));
                  },
                ),
              ),
              SizedBox(
                height: screenHt * 0.0775,
              ),
            ],
          ),
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
  Function onPress;
  ScrollingContainer({this.event, this.onPress});
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "${event.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25.5,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWd * 0.25,
                  ),
                  IconButton(
                    onPressed: onPress,
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
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
