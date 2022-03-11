import 'package:flutter/material.dart';
import 'package:school_booking_application/Model/MeetingBooking.dart';

class MeetingTile extends StatelessWidget {
  final MeetingBooking meeting;
  MeetingTile({this.meeting});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blueGrey[200],
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
          child: Icon(Icons.meeting_room_sharp, size: 70),
        ),
        title: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, bottom: 0, top: 10),
          child: Text('Room No: ${meeting.selectedRoom}',
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              )),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, bottom: 10, top: 0),
          child: Text(
              '\nDate: ${meeting.selectedBookingdate} \nTime: ${meeting.selectedTimeSlot}',
              style: TextStyle(color: Colors.black54, fontSize: 16)),
        ),
      ),
    );
  }
}
