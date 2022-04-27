// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'MiniData.dart';

class IsiMail extends StatelessWidget {
  const IsiMail({Key? key, required this.emailList, required this.index}) : super(key: key);

  final List<MiniData> emailList;
  final int index;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 23,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.archive_outlined),
              iconSize: 23,
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 23,
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.email),
              iconSize: 23,
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert_rounded),
              iconSize: 23,
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        width: 40,
                        child: Text(
                            emailList[index].subjek!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                )
              ])),
          SizedBox(height: 15),

          //.................... Header Mail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Icon(
                      Icons.account_circle
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "fauzan@gmail.com",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Text(
                              emailList[index].tanggal!.toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Kepada " + emailList[index].kepada!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(Icons.expand_more),
                          ],
                        ),
                      ])),
              IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ]),
          ),
          //.................... Mail
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Expanded(
              child: Text(
                emailList[index].isi!,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.06),
                  primary: Colors.black54,
                ),
                onPressed: () {},
                icon: Icon(Icons.reply),
                label: Text('balas'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.06),
                  primary: Colors.black54,
                ),
                onPressed: () {},
                icon: Icon(Icons.reply_all),
                label: Text('Balas semua'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.06),
                  primary: Colors.black54,
                ),
                onPressed: () {},
                icon: Transform(
                  transform: Matrix4.rotationY(pi),
                  alignment: Alignment.center,
                  child: Icon(Icons.reply),
                ),
                label: Text('Teruskan'),
              )
            ],
          )
        ])
        ));
  }
}