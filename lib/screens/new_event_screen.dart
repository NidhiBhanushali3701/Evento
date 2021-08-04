import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/obj/event.dart';
import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  static String id = "NewEventScreen";
  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  FirebaseFirestore _fbfs = FirebaseFirestore.instance;
  Event event = Event();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              borderSide:
                                  BorderSide(color: Colors.deepPurpleAccent)),
                          labelText: 'Event Name',
                          labelStyle: TextStyle(color: Colors.deepPurpleAccent),
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
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.purple),
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
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: 'Image URL',
                          labelStyle: TextStyle(color: Colors.purple),
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
                Container(
                  child: Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      textAlign: TextAlign.center,
                      // ignore: missing_return
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: 'Event Date & Time',
                          labelStyle: TextStyle(color: Colors.purple),
                          hintText: 'Enter Event Date & Time'),
                      //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                      onChanged: (value) {
                        event.setDateTime(value);
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
                      await _fbfs
                          .collection("events")
                          .doc("new event1")
                          .set(event.toMap())
                          .then((value) => print("Event Added Successfully!"));
                      Navigator.pop(context);
                      SnackBar(
                        content: Text("Event Added Successfully!"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
