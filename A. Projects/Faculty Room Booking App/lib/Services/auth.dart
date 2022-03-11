import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/UserProfile/profile_body.dart';
import 'package:school_booking_application/Screens/Booking/booking_record.dart';

class Management {
  getUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(firebaseUser.uid)
        .set({
          'fullname': user.fullname,
          'username': user.username,
          'contact': user.contact
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileBody())))
        .catchError((e) {
          print(e);
        });
  }

  getIoTBooking(bookingIoT, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('BookingIoT')
        .doc(firebaseUser.uid)
        .set({
          'selectedBookingdate': bookingIoT.selectedBookingdate,
          'selectedRoom': bookingIoT.selectedRoom,
          'selectedTimeSlot': bookingIoT.selectedTimeSlot
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => BookingRecord())))
        .catchError((e) {
          print(e);
        });
  }

  getMeetingBooking(bookingMeeting, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('BookingMeeting')
        .doc(firebaseUser.uid)
        .set({
          'selectedBookingdate': bookingMeeting.selectedBookingdate,
          'selectedRoom': bookingMeeting.selectedRoom,
          'selectedTimeSlot': bookingMeeting.selectedTimeSlot
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => BookingRecord())))
        .catchError((e) {
          print(e);
        });
  }
}
