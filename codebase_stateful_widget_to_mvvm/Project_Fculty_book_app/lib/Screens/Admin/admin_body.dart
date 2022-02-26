import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/Admin/IoTBooking.dart';
import 'package:school_booking_application/Screens/Admin/meetingBooking.dart';

class AdminBody extends StatefulWidget {
  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
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
                title: Text('IoT Lab',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('View IoT Lab booking list !',
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
                    child: const Text('View Record',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IoTBody()),
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
                subtitle: Text('View meeting room booking list !',
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
                    child: const Text('View Record',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MeetingBody()),
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
