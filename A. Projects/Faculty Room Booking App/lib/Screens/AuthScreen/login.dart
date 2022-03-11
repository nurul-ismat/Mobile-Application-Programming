import 'package:flutter/material.dart';
import 'package:school_booking_application/Services/auth_provider.dart';
import 'package:school_booking_application/Screens/AuthScreen/register.dart';
import 'package:school_booking_application/Screens/AuthScreen/reset.dart';
import 'package:school_booking_application/Screens/Admin/admin.dart';
import '../Homepage/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading == false
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(
                          child: Container(
                            child: new Text(
                              'School of Computing Booking \n Application',
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
                              child: Image.asset('Images/Logo.png')),
                        ),
                      ),
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60.0, top: 50, bottom: 0),
                        child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'email is empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter Email'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60.0, top: 15, bottom: 40),
                        //padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'password is empty';
                            }
                            return null;
                          },
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
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
                                .signIN(
                                    email: _email.text.trim(),
                                    password: _password.text.trim())
                                .then((value) {
                              if (value == "Welcome") {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              } else if (value == "Admin") {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminPage()),
                                    (route) => false);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              }
                            });
                          },
                          child: Text(
                            'Login',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPage()),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 17),
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
                                'Register Account',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
