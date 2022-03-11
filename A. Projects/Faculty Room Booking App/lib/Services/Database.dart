import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_booking_application/Model/IoTBooking.dart';
import 'package:school_booking_application/Model/MeetingBooking.dart';
import 'package:school_booking_application/Model/Users.dart';
import 'package:school_booking_application/Model/Profile.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  List<UserData> users = [];
  //final CollectionReference user = Firestore.instance.collection("User");
  final CollectionReference userProfile =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference iotList =
      FirebaseFirestore.instance.collection('IoT');

  final CollectionReference iotHistory =
      FirebaseFirestore.instance.collection('BookingIoT');

  final CollectionReference meetingHistory =
      FirebaseFirestore.instance.collection('BookingMeeting');

  Future updateUserData(
      String fullname, String username, String contact) async {
    return await userProfile.doc(uid).set({
      'fullname': fullname,
      'username': username,
      'contact': contact,
    });
  }

  List<Profile> _profileListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Profile(
          username: doc.data()['username'] ?? '',
          fullname: doc.data()['fullname'] ?? '',
          contact: doc.data()['contact'] ?? '');
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        fullname: snapshot.data()['fullname'],
        username: snapshot.data()['username'],
        contact: snapshot.data()['contact']);
  }

  Stream<List<Profile>> get profile {
    return userProfile.snapshots().map(_profileListFromSnapshot);
  }

  // get iot booking list
  List<IoTBooking> _iotListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return IoTBooking(
          selectedRoom: doc.data()['selectedRoom'] ?? '',
          selectedBookingdate: doc.data()['selectedBookingdate'] ?? '',
          selectedTimeSlot: doc.data()['selectedTimeSlot'] ?? '');
    }).toList();
  }

  Stream<List<IoTBooking>> get iot {
    return iotHistory.snapshots().map(_iotListFromSnapshot);
  }

  //get meeting booking list
  List<MeetingBooking> _meetingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MeetingBooking(
          selectedRoom: doc.data()['selectedRoom'] ?? '',
          selectedBookingdate: doc.data()['selectedBookingdate'] ?? '',
          selectedTimeSlot: doc.data()['selectedTimeSlot'] ?? '');
    }).toList();
  }

  Stream<List<MeetingBooking>> get meeting {
    return meetingHistory.snapshots().map(_meetingListFromSnapshot);
  }

  Future<DocumentSnapshot> getUserData() async {
    final DocumentSnapshot doc = await userProfile.doc(uid).get();
    return doc;
  }

  Future<String> getIoTCount() async {
    var length = 0;
    await FirebaseFirestore.instance
        .collection('IoT')
        .get()
        .then((myDocuments) {
      print("${myDocuments.docs.length}");
      length = myDocuments.docs.length;
    });
    return Future.value(length.toString());
  }
}
