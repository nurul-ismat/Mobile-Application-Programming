import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_booking_application/Model/IoTBooking.dart';
import 'package:school_booking_application/Screens/Admin/IoTBookingList.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'package:school_booking_application/Services/Database.dart';
import 'package:school_booking_application/Services/auth_provider.dart';

class IoTBody extends StatefulWidget {
  @override
  _IoTBodyState createState() => _IoTBodyState();
}

class _IoTBodyState extends State<IoTBody> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<IoTBooking>>.value(
        value: DatabaseService().iot,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('IoT Lab Booking'),
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
          body: IoTList(),
        ));
  }
}
