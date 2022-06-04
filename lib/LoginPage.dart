// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'LoginWithEmail.dart';
import 'PageWellcome.dart';
import 'dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String? _email, _password;
  final auth = FirebaseAuth.instance;
  final username = TextEditingController();
  final password = TextEditingController();
  DummyData dummyData = DummyData();
  bool isLogin = false;
  int id = 0;

  setPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isLogin', isLogin);
    pref.setInt('id', id);
  }

  getPref() async {
    final pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('isLogin') ?? false;
    id = pref.getInt('id') ?? -1;
    if(isLogin){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => PageWellcome(id: id)
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context){
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
                SizedBox(height:50),
                Text(
                  'Firebase Login',
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
                      SizedBox(height: 30),
                      Text(
                        ' ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Silahkan login ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                            suffixIcon: Icon(Icons.person, size: 16),
                          )
                        )
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 250,
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                            suffixIcon: Icon(FontAwesomeIcons.eyeSlash, size: 16),
                          )
                        )
                      ),

                      // .......................Forgot Password Button.....................
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                          ],
                        ),
                        ),
                        SizedBox(height: 15),

                      // .......................Login Button.....................
                      GestureDetector(
                        onTap: () async {
                          if(isLogin == false){
                            setState(() {
                              for(var index = 0; index < dummyData.data.length; index++){
                              if(username.text == dummyData.data[index]["username"] && password.text == dummyData.data[index]["password"]){
                                id = index;
                                isLogin = true;
                                setPref();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PageWellcome(id: id)));
                              }
                            }
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 14, 14, 14),
                                Color.fromARGB(255, 0, 0, 0),
                              ],
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          )
                        )
                      ),

                      SizedBox(height: 20),

                      // .......................Login Google Button.....................
                      GestureDetector(
                        onTap: () async {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login With Google',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height:10),

                      // .......................Login Email Button.....................
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LogWithEmail()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login With Email',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          )
          )
        )
      );
  }
}
