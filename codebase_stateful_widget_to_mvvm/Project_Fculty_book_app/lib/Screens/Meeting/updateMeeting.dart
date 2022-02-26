import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/Meeting/updateMeeting_body.dart';
import 'package:school_booking_application/Services/auth_provider.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'package:school_booking_application/Screens/drawer.dart';

class UpdateMeeting extends StatefulWidget {
  @override
  _UpdateMeetingState createState() => _UpdateMeetingState();
}

class _UpdateMeetingState extends State<UpdateMeeting> {
  String user = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Meeting Room Booking"),
        actions: [
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
      body: UpdateMeetingBooking(),
      drawer: SideDrawer(),
    );
  }
}
