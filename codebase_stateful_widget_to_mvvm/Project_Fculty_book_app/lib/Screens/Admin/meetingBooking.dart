import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_booking_application/Model/MeetingBooking.dart';
import 'package:school_booking_application/Screens/Admin/meetingBookingList.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'package:school_booking_application/Services/Database.dart';
import 'package:school_booking_application/Services/auth_provider.dart';

class MeetingBody extends StatefulWidget {
  @override
  _MeetingBodyState createState() => _MeetingBodyState();
}

class _MeetingBodyState extends State<MeetingBody> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MeetingBooking>>.value(
        value: DatabaseService().meeting,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Meeting Room Booking'),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    //sign Out User
                    AuthClass().signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  })
            ],
          ),
          body: MeetingList(),
        ));
  }
}
