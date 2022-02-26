import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_booking_application/Screens/Homepage/home.dart';
import 'package:school_booking_application/Screens/Booking/booking.dart';

class MeetingRoom extends StatefulWidget {
  @override
  _MeetingRoomState createState() => _MeetingRoomState();
}

class _MeetingRoomState extends State<MeetingRoom> {
  var selectedRoom, selectedBookingdate, selectedTimeSlot;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  getSelectedRoom(selectedRoom) {
    this.selectedRoom = selectedRoom;
  }

  getSelectedBookingdate(selectedBookingdate) {
    this.selectedBookingdate = selectedBookingdate;
  }

  getSelectedTimeSlot(selectedTimeSlot) {
    this.selectedTimeSlot = selectedTimeSlot;
  }

  createdata() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    DocumentReference bk = FirebaseFirestore.instance
        .collection('BookingMeeting')
        .doc(firebaseUser.uid);
    Map<String, dynamic> booking = {
      "selectedRoom": selectedRoom,
      "selectedBookingdate": selectedBookingdate,
      "selectedTimeSlot": selectedTimeSlot,
    };
    bk.set(booking).whenComplete(() {
      // print("Creating Room Booking Successfully");
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Message"),
          content: Text("Room Booked Successfully!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booking()),
                );
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKeyValue,
      autovalidate: true,
      child: new ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: <Widget>[
          new Container(
            child: Column(
              //countDocuments(),
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Container(
                        width: 400,
                        height: 200,
                        child: Image.asset('Images/Meeting_2.png')),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: new Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blueGrey,
                //height: 40,
                elevation: 10,
                child: Column(
                  //countDocuments(),
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: new Center(
                          child: new Text(
                              'Available Facilities: \n\n- Plug socket  \n- Chair \n- Airconditioned \n- Table',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Dynamic-Room
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Meeting").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> meeting = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    meeting.add(
                      DropdownMenuItem(
                        child: Text(
                          snap.id,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: "${snap.id}",
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Container(
                          padding: EdgeInsets.only(
                              top: 30.0, bottom: 0.0, left: 30.0, right: 20.0),
                          child: Text('Choose Room :',
                              style: new TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 10.0),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 30.0, bottom: 0.0, left: 30.0, right: 20.0),
                          child: DropdownButton(
                            items: meeting,
                            onChanged: (meetingroomvalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected room is $meetingroomvalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedRoom = meetingroomvalue;
                              });
                            },
                            value: selectedRoom,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Room",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ],
                  );
                }
                return Text("Done");
              }),
          //Dynamic Date
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("MeetingDate")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> meetingDate = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    meetingDate.add(
                      DropdownMenuItem(
                        child: Text(
                          snap.id,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: "${snap.id}",
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 30.0, right: 10.0),
                          child: Text('Choose Date :',
                              style: new TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 50.0),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
                          child: DropdownButton(
                            items: meetingDate,
                            onChanged: (meetingDatevalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected date is $meetingDatevalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedBookingdate = meetingDatevalue;
                              });
                            },
                            value: selectedBookingdate,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Date",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ],
                  );
                }
                return Text("Done");
              }),

          //Dynamic Time
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("MeetingTime")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> MeetingTime = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    MeetingTime.add(
                      DropdownMenuItem(
                        child: Text(
                          snap.id,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: "${snap.id}",
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 30.0, right: 10.0),
                          child: Text('Choose Time :',
                              style: new TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
                          child: DropdownButton(
                            items: MeetingTime,
                            onChanged: (meetingTimevalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected date is $meetingTimevalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedTimeSlot = meetingTimevalue;
                              });
                            },
                            value: selectedTimeSlot,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Time Slot",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ],
                  );
                }
                return Text("Done");
              }),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(width: 30),
              new Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    createdata();
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
