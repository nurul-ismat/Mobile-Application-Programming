import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_booking_application/Screens/Booking/booking.dart';
import 'package:school_booking_application/Screens/Homepage/home.dart';

class IoTLab extends StatefulWidget {
  @override
  _IoTLabState createState() => _IoTLabState();
}

class _IoTLabState extends State<IoTLab> {
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
        .collection('BookingIoT')
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
          content: Text("Lab Booked Successfully!"),
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
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 30.0, left: 0, right: 0),
                  child: Center(
                    child: Container(
                        width: 350,
                        height: 200,
                        child: Image.asset('Images/IoT_2.png')),
                  ),
                ),
              ],
            ),
          ),
          new Container(
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
                            'Available Facilities: \n\n- Plug socket  \n- Chair \n- Air conditioned \n- Table \n- Internet',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 40.0),
          //Dynamic-Room
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("IoT").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> iot = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    iot.add(
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
                          child: Text('Choose Lab :',
                              style: new TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 10.0),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 30.0, bottom: 0.0, left: 30.0, right: 20.0),
                          child: DropdownButton(
                            items: iot,
                            onChanged: (iotlabvalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected lab is $iotlabvalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedRoom = iotlabvalue;
                              });
                            },
                            value: selectedRoom,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Lab",
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
              stream:
                  FirebaseFirestore.instance.collection("IoTDate").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> iotDate = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    iotDate.add(
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
                                  fontSize: 17.0, fontWeight: FontWeight.bold)
                              //   fontFamily: 'Roboto',
                              //   color: new Color(0xFF26C6DA),
                              )),
                      SizedBox(width: 50.0),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
                          child: DropdownButton(
                            items: iotDate,
                            onChanged: (iotDatevalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected date is $iotDatevalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedBookingdate = iotDatevalue;
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
              stream:
                  FirebaseFirestore.instance.collection("IoTTime").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text("Loading.....");
                } else {
                  List<DropdownMenuItem> IoTTime = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data.docs[i];
                    IoTTime.add(
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
                                  fontSize: 17.0, fontWeight: FontWeight.bold)
                              //   fontFamily: 'Roboto',
                              //   color: new Color(0xFF26C6DA),
                              )),
                      new Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
                          child: DropdownButton(
                            items: IoTTime,
                            onChanged: (iotTimevalue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected date is $iotTimevalue',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedTimeSlot = iotTimevalue;
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
