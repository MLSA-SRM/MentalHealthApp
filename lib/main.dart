import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/onboarding.dart';
import 'package:mental_health_app/test.dart';
import 'Showup.dart';
import 'quiz.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 1000;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Center(
              child: Column(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            ShowUp(
              child: AvatarGlow(
                //curve: Curves.easeOut,
                endRadius: 110,
                duration: Duration(seconds: 2),
                glowColor: Colors.blueAccent,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
                child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Image(image: AssetImage('assets/mentalhealth3.png')),
                      radius: 80.0,
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/50,
            ),
            ShowUp(
              child: Text(
                "Awareness",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              delay: delayedAmount - 500,
            ),
            SizedBox(
              height: 40,
            ),
            ShowUp(
              child: Text(
                "Invest in your mental health\n",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              delay: delayedAmount,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            ShowUp(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "\"Great Mental Health is not a destination.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Text(
                      "It's about how you drive not where you're going.\"\n",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Text(
                      "                                                              -Andrea Balt",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
              delay: delayedAmount,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/5,
            ),
            ShowUp(
              child: Container(
                height: 50,
                width: 150,
                child: RaisedButton(
                  elevation: 10,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              delay: 1100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/50,
            ),
            ShowUp(
              child: Text("Instructions: Swipe Up after every question\n",
                  style: TextStyle(color: Colors.grey)),
            )
          ])),
        ]),
      ),
    );
  }
}
