import 'package:avatar_glow/avatar_glow.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/WebView.dart';
import 'package:mental_health_app/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Showup.dart';
import 'quiz.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder:(context) =>  MaterialApp(
          locale: DevicePreview.of(context).locale,
          builder: DevicePreview.appBuilder,
    title: 'Navigation Basics',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ),
      ));
}


Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }

  // Or do other work.
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
        setState(() {

        });
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        print(message['data']['body']);
        url = message['data']['body'];
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url)));
        setState(() {

        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        print(message['data']['body']);
        url = message['data']['body'];
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url)));
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
    ScreenUtil.init(context,
        allowFontScaling: true);
//     FirebaseDatabase.instance.reference().child('recent').child('id')
// .set({
// 'title': 'Realtime db rocks',
// 'created_at': 'a goodtime'
// });
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                      endRadius: _width/4,
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
                            radius: _width/5,
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
                          fontSize: _width/15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    delay: delayedAmount - 500,
                  ),
                  SizedBox(
                    height: _height/20,
                  ),
                  ShowUp(
                    child: Text(
                      "\'And the thoughts in Your Head\'\n",
                      style: TextStyle(fontSize: _width/18, color: Colors.black),
                    ),
                    delay: delayedAmount,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width/20,vertical: _height/70),
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
                    //height: MediaQuery.of(context).size.height / 150,
                  ),
                  ShowUp(
                    child: Container(
                      height: _height/10,
                      width: _width/2,
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
                          style: TextStyle(fontSize: _width/20),
                        ),
                      ),
                    ),
                    delay: 1100,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  ShowUp(
                    child: Text("Instructions: Swipe Up after every question\n",
                        style: TextStyle(color: Colors.grey)),
                  ),
                  ShowUp(
                    delay: 1300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                  image: AssetImage("assets/mspc.png"),
                  height: 250.h,
                ),
                Image(
                  image: AssetImage("assets/envision.png"),
                  height: 250.h,
                ),
                      ],
                    )
                  ,),
                ]),
              ]),
        )
      ),
    );
  }
}
