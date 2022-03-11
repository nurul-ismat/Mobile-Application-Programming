import 'package:flutter/material.dart';
import 'package:school_booking_application/Services/auth_provider.dart';

import 'login.dart';
import 'register.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading == false
          ? SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      child: new Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 500,
                        height: 150,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('Images/Logo.png')),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 60.0, top: 15, bottom: 40),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email',
                        hintText: 'Enter Valid Email'),
                  ),
                ),

                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      AuthClass()
                          .resetPassword(
                        email: _email.text.trim(),
                      )
                          .then((value) {
                        if (value == "Email sent") {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(value)));
                        }
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 130,
                // ),
                // Text('New User? Create Account')
              ]),
            )
          : Center(child: CircularProgressIndicator()),
    );

    // return Scaffold(
    //   //   appBar: AppBar(
    //   //    title: Text("Reset"),
    //   //  ),

    //   body: isLoading == false
    //       ? Padding(
    //           padding: const EdgeInsets.only(top: 60.0),
    //           child: Column(
    //             children: [
    //               Padding(
    //                 //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    //                 padding: const EdgeInsets.only(top: 60.0),
    //                 child: Center(
    //                   child: Container(
    //                     child: new Text(
    //                       'Reset Password',
    //                       textAlign: TextAlign.center,
    //                       style: new TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 24.0,
    //                           color: Colors.blueGrey),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               TextFormField(
    //                 controller: _email,
    //                 decoration: InputDecoration(hintText: "Email"),
    //               ),
    //               const SizedBox(
    //                 height: 30,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 60.0),
    //                 child: Center(
    //                   child: Container(
    //                       width: 500,
    //                       height: 150,
    //                       /*decoration: BoxDecoration(
    //                                       color: Colors.red,
    //                                       borderRadius: BorderRadius.circular(50.0)),*/
    //                       child: Image.asset('Images/Logo.png')),
    //                 ),
    //               ),
    //               FlatButton(
    //                   color: Colors.blue,
    //                   onPressed: () {
    //                     setState(() {
    //                       isLoading = true;
    //                     });
    //                     AuthClass()
    //                         .resetPassword(
    //                       email: _email.text.trim(),
    //                     )
    //                         .then((value) {
    //                       if (value == "Email sent") {
    //                         setState(() {
    //                           isLoading = false;
    //                         });
    //                         Navigator.pushAndRemoveUntil(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => LoginPage()),
    //                             (route) => false);
    //                       } else {
    //                         setState(() {
    //                           isLoading = false;
    //                         });
    //                         ScaffoldMessenger.of(context)
    //                             .showSnackBar(SnackBar(content: Text(value)));
    //                       }
    //                     });
    //                   },
    //                   child: Text("Reset Password")),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => RegisterPage()));
    //                 },
    //                 child: Text("New User? Create Account "),
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => LoginPage()));
    //                 },
    //                 child: Text("Cancel"),
    //               ),
    //             ],
    //           ),
    //         )
    //       : Center(child: CircularProgressIndicator()),
    // );
  }
}
