//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_booking_application/Model/IoTBooking.dart';
import 'package:school_booking_application/Screens/Admin/IoTBookingTile.dart';

class IoTList extends StatefulWidget {
  @override
  _IoTListState createState() => _IoTListState();
}

class _IoTListState extends State<IoTList> {
  @override
  Widget build(BuildContext context) {
    final iots = Provider.of<List<IoTBooking>>(context);
    if (iots == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: iots.length,
        itemBuilder: (context, index) {
          return IoTTile(iot: iots[index]);
        },
      );
    }
  }
}
