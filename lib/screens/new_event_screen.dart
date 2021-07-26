import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            child: Column(
              children: [
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    textAlign: TextAlign.center,
                    // ignore: missing_return
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                        labelText: 'Event Name',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                        hintText: 'Enter Event Name'),
                    //onSaved: (newValue) => _nameController.text = newValue,//commented on 6.11pm 17-3-21
                    onChanged: (value) {

                    },
                  ),
                ),
                SizedBox(),
                Padding(
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

                    },
                  ),
                ),
                SizedBox(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
