import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_booking_application/Model/MeetingBooking.dart';
import 'package:school_booking_application/Screens/Admin/meetingBookingTile.dart';

class MeetingList extends StatefulWidget {
  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  @override
  Widget build(BuildContext context) {
    final meetings = Provider.of<List<MeetingBooking>>(context);
    if (meetings == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          return MeetingTile(meeting: meetings[index]);
        },
      );
    }
  }
}
