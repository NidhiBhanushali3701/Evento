import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/obj/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  static String id = "NewEventScreen";
  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  FirebaseFirestore _fbfs = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Event event = Event();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var loggedInUser;

  dynamic getCurrentUser() async {
    try {
      var user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      } else {
        print(user);
      }
    } catch (e) {
      print(e);
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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add New Event"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          // ignore: missing_return
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent)),
                              labelText: 'Event Name',
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              hintText: 'Enter Event Name'),
                          //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                          onChanged: (value) {
                            event.setName(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          // ignore: missing_return
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent)),
                              labelText: 'Description',
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              hintText: 'Enter Event Description'),
                          //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                          onChanged: (value) {
                            event.setDescription(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          // ignore: missing_return
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent)),
                              labelText: 'Image URL',
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              hintText: 'Enter Event Image URL'),
                          //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                          onChanged: (value) {
                            event.setImg(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050));
                      },
                      child: Expanded(
                        child: Container(
                          child: Padding(
                              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DatePickerDialog(
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                                initialDate: selectedDate,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     showTimePicker(
                    //         context: context,
                    //         initialTime: TimeOfDay(hour: 00, minute: 00));
                    //   },
                    //   child: Expanded(
                    //     child: Container(
                    //       child: Padding(
                    //           //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    //           padding: EdgeInsets.symmetric(horizontal: 15),
                    //           child: TimePickerDialog()),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      child: Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          // ignore: missing_return
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent)),
                              labelText: 'Event Link',
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              hintText: 'Enter Event Link'),
                          //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                          onChanged: (value) {
                            event.setLink(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: MaterialButton(
                        child: Text("Create Event"),
                        onPressed: () async {
                          event.setDateTime(Timestamp.now());
                          event.setCreator(loggedInUser.email);
                          await _fbfs
                              .collection("events")
                              .add(event.toMap())
                              .then((value) =>
                                  print("Event Added Successfully!"));
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Event Added Successfully!"),
                          ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
