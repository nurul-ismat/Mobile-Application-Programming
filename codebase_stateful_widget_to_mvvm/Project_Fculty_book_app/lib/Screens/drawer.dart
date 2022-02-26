import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_booking_application/Screens/Booking/booking.dart';
import 'package:school_booking_application/Screens/Homepage/home.dart';
import 'package:school_booking_application/Screens/UserProfile/profile.dart';
// import 'UserProfile/profile.dart';

//import '../Login/login_screen.dart';

class SideDrawer extends StatelessWidget {
  // final User user = await FirebaseAuth.instance.currentUser.email == null;
  // final userid = user.uid;

  String email = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'School of Computing \n System',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text('Hello $email'),
              onTap: () {
                // var firebaseUser = FirebaseAuth.instance.currentUser;
                // FirebaseFirestore.instance

                //     .collection("Users")
                //     .doc(firebaseUser.uid)
                //     .get()
                //     .then((value) {
                //   print(value.data().length);
                // });
              },
            ),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Dashboard'),
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      ),
                    }),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.article_outlined),
              title: Text('Booking Record'),
              onTap: () => {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => BookingHistory()),
                  MaterialPageRoute(builder: (context) => Booking()),
                ),
              },
            ),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.assignment_ind_outlined),
                title: Text('View Profile'),
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      ),
                    }),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 60.0, right: 60.0, top: 300, bottom: 40),
          //   child: Expanded(
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: FloatingActionButton(
          //         onPressed: () => {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => LoginPage()),
          //           ),
          //         },
          //         child: const Icon(Icons.logout),
          //         backgroundColor: Colors.red,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
