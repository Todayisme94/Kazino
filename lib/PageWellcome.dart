// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:email/LoginPage.dart';
import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageWellcome extends StatelessWidget {
  PageWellcome({Key? key, required this.id}) : super(key: key);

  DummyData dummyData = DummyData();
  var id = 0;

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
                        'INI LOGO',
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 70),
                              Text(
                                dummyData.data[id]["id"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 17),
                              Text(
                                dummyData.data[id]["nama"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                dummyData.data[id]["Nim"].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                ),
                              ),
                              SizedBox(height: 100),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(
                                          emailList: [],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color.fromARGB(255, 14, 14, 14),
                                              Color.fromARGB(255, 0, 0, 0),
                                            ],
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          'Masuk ke E-Mail',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ))),
                              SizedBox(height: 20),
                              GestureDetector(
                                  onTap: () {
                                    _logOut();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color.fromARGB(255, 14, 14, 14),
                                              Color.fromARGB(255, 0, 0, 0),
                                            ],
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          'Logout',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )))
                            ],
                          ))
                    ],
                  ),
                ))));
  }
}

void _logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('isLogin');
  prefs.remove('id');
}
