import 'package:flutter/material.dart';
import 'package:school_booking_application/Services/auth_provider.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //final _key = GlobalKey<FormState>();
  bool _isProcessiong = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _contact = TextEditingController();

  bool _isObscure = true;

  bool isLoading = false;
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
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Center(
                            child: Container(
                              child: new Text(
                                'Account Registration',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27.0,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 0.0),
                          child: Center(
                            child: Container(
                                width: 500,
                                height: 150,
                                /*decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.0)),*/
                                child: Image.asset('Images/Profile.png')),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60.0, right: 60.0, top: 10, bottom: 0),
                          child: TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Enter valid email'),
                            enabled: true,
                            //validator: (value) => Validator.validateField(value: value)
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email can\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60.0, right: 60.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: _fullname,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Full Name',
                                hintText: 'Enter valid full name'),
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'full name can\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: const EdgeInsets.only(
                              left: 60.0, right: 60.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: _username,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                                hintText: 'Enter valid Username'),
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'username can\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60.0, right: 60.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Your Password',
                              enabled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password can\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60.0, right: 60.0, top: 15, bottom: 20),
                          child: TextFormField(
                            controller: _contact,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contact Number',
                                hintText: 'Enter valid contact number'),
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'contact number can\'t be empty';
                              }
                              return null;
                            },
                          ),
                        ),

                        _isProcessiong
                            ? Padding(
                                padding: EdgeInsets.zero,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                              )
                            : Container(
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
                                        .createAccount(
                                            _email.text.trim(),
                                            _password.text.trim(),
                                            _fullname.text.trim(),
                                            _username.text.trim(),
                                            _contact.text.trim())
                                        .then((value) {
                                      if (value == null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                SnackBar(content: Text(value)));
                                      }
                                    });
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),

                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 17),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   height: 130,
                        // ),,
                        // ),
                        // Text('New User? Create Account')
                      ]),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
