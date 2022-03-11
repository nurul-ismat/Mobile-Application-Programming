import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:school_booking_application/Screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:school_booking_application/Services/auth_provider.dart';
import 'package:school_booking_application/Model/Users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Users>>(
//      // value: AuthClass().user,
//       initialData: <Users>[],
//       child: MaterialApp(
//         home: Home(),
//       ),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthClass().user,
      initialData: Users(),
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Colors.teal),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Splash();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
