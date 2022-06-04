// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Home.dart';

class LogWithEmail extends StatefulWidget {

  @override
  _LogWithEmail createState() => _LogWithEmail();
}

class _LogWithEmail extends State<LogWithEmail> {

  String? _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 26, 26, 26),
                      Color.fromARGB(255, 143, 143, 143),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Login With Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(height: 35),
                      Container(
                          height: 450,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              Text(
                                ' ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 250,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    suffixIcon: Icon(Icons.mail, size: 16),
                                  ),
                                  onChanged: (value) {
                                      setState(() {
                                        _email = value.trim();
                                      });
                                    },
                                )
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 250,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    suffixIcon: Icon(FontAwesomeIcons.eyeSlash, size: 16),
                                  ),
                                  onChanged: (value) {
                                      setState(() {
                                        _password = value.trim();
                                      });
                                    },
                                )
                              ),

                              SizedBox(height: 20),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RaisedButton(
                                    color: Colors.blueGrey,
                                    child: Text('Daftar', style: TextStyle(color: Colors.black),),
                                    onPressed: () {
                                      auth.createUserWithEmailAndPassword(email: _email!, password: _password!).then((_){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(emailList: [],)));
                                    });
                                    }
                                  ),
                                  RaisedButton(
                                    color: Colors.blueGrey,
                                    child: Text('Masuk', style: TextStyle(color: Colors.black),),
                                    onPressed: () {
                                      auth.signInWithEmailAndPassword(email: _email!, password: _password!).then((_){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(emailList: [],)));
                                    });
                                    }
                                  )
                                ],
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ))));
  }
}
