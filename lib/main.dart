import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/onboarding.dart';
import 'package:mental_health_app/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
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
  SharedPreferences prefs;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  bool onCallback = false;
  String url;

  checkDeviceId() async{
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('deviceToken')?.isEmpty ?? true) {
      String deviceToken = await firebaseMessaging.getToken();
      await FirebaseDatabase.instance.reference().child("fcm-token").child(deviceToken).set({"token": deviceToken});
      prefs.setString('deviceToken', deviceToken);
    }
  }


  @override
  void initState() {
    super.initState();
    checkId();
    checkDeviceId();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        print(message['notification']['body'] + "message");
        url = message['notification']['body'];
        onCallback = true;
        setState(() {

        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        print(message['notification']['body'] + "launch");
        url = message['notification']['body'];
        onCallback = true;
        setState(() {

        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        print(message['notification']['body'] + "resume");
        url = message['notification']['body'];
        onCallback = true;
        setState(() {

        });
      },
    );
  }

  void checkId() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('key')?.isEmpty ?? true) {
      print("key does not exist, making a new one");
      var orderRef =
          FirebaseDatabase.instance.reference().child("Responses").push();
      prefs.setString('key', '${orderRef.key}');
      print('${orderRef.key}');
      orderRef.set({'akey': 'avalue okay ! '});
    } else {
      print('key is already set');
      print(prefs.getString('key'));
    }

    // FirebaseDatabase.instance
    //     .reference()
    //     .child("somePath")
    //     .set({'chala kya?': "haan"});
    // print('done');

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
//     FirebaseDatabase.instance.reference().child('recent').child('id')
// .set({
// 'title': 'Realtime db rocks',
// 'created_at': 'a goodtime'
// });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: (!onCallback) ?SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
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
                            child:
                                Image(image: AssetImage('assets/mainlogo.png')),
                            radius: 80.0,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ShowUp(
                    child: Text(
                      "Here For You",
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
                      "\'And the thoughts in Your Head\'\n",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    delay: delayedAmount,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    delay: delayedAmount,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  ShowUp(
                    child: Container(
                      height: 50,
                      width: 150,
                      child: RaisedButton(
                        elevation: 10,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Onboarding()));
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
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  ShowUp(
                    child: Text("Instructions: Swipe Up after every question\n",
                        style: TextStyle(color: Colors.grey)),
                  )
                ]),
              ]),
        )
        : WebviewScaffold(
          initialChild: Center(child: CircularProgressIndicator()),
          url: url,
        ),
      ),
    );
  }
}
