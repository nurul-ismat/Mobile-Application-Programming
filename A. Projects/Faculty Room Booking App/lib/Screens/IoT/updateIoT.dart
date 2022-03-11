import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'package:school_booking_application/Screens/IoT/updateIoT_body.dart';
import 'package:school_booking_application/Screens/drawer.dart';
import 'package:school_booking_application/Services/auth_provider.dart';

class UpdateIoT extends StatefulWidget {
  @override
  _UpdateIoTState createState() => _UpdateIoTState();
}

class _UpdateIoTState extends State<UpdateIoT> {
  String user = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update IoT Lab Booking"),
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
      body: UpdateIoTBooking(),
      drawer: SideDrawer(),
    );
  }
}
