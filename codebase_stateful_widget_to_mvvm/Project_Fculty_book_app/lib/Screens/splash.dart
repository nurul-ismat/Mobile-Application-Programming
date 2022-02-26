import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_booking_application/Screens/AuthScreen/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 5), () {
    //   if (auth.currentUser == null) {
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => LoginPage()),
    //         (route) => false);
    //   } else {
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomePage()),
    //         (route) => false);
    //   }
    // });
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new LoginPage(),
        title: new Text(
          'Welcome to \n School of Computing Booking \n Management Application',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.blueGrey),
        ),
        image: new Image.asset('Images/Logo.png',
            height: 400, width: 350, scale: 1.0),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 80.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.blue);
    // return Scaffold(
    //   body: Center(
    //     child: FlutterLogo(
    //       size: 80,
    //     ),
    //   ),
    // );
  }
}
