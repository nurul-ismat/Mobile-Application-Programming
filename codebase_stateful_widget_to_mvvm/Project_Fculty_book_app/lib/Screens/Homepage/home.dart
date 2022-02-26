import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Services/auth_provider.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'home_body.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Room"),
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
      body: Dashboard(),
      drawer: SideDrawer(),
    );
  }
}
