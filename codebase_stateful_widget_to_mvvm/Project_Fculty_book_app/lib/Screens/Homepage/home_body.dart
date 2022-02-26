import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/Meeting/meeting.dart';
import 'package:school_booking_application/Screens/IoT/IoT.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

countDocuments() async {
  QuerySnapshot _myDoc =
      await FirebaseFirestore.instance.collection('IoT').get();
  List<DocumentSnapshot> _myDocCount = _myDoc.docs;
  int length = (_myDocCount.length);
  print(length);
  return length;
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: Center(
            child: Container(
                width: 500, height: 150, child: Image.asset('Images/Logo.png')),
          ),
        ),
      ),
      new Container(
        width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.blueGrey[200],
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.meeting_room, size: 60),
                title: Text('Iot Lab',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('Book your IoT Lab now!',
                    style: TextStyle(color: Colors.black45, fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    child: const Text('Book Lab',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IoT()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        //Use of SizedBox
        height: 25,
      ),
      new Container(
        width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.blueGrey[200],
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.meeting_room_sharp, size: 60),
                title: Text('Meeting Room',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('Book your meeting room now!',
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    child: const Text('Book Room',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Meeting()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
