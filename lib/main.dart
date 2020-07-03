import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mental_health_app/ArticlesPage.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/ResultPage.dart';
import 'package:mental_health_app/SocioDemographic.dart';
import 'package:mental_health_app/WebView.dart';
import 'package:mental_health_app/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Showup.dart';
import 'quiz.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
        MaterialApp(
          title: 'Navigation Basics',
          home: MyApp(),
          debugShowCheckedModeBanner: false,
        ),
    );
      });
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
  bool onCallback = false,buttontoshow = false;
  String url,_result;

  getresult() async {
    prefs = await SharedPreferences.getInstance();
    final _result = prefs.getString('status');
    print(_result);
    if(_result != null)
    buttontoshow = true;
  }

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
    getresult();
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
      // print('${orderRef.key}');
      // orderRef.set({'akey': 'avalue okay ! '});
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  ShowUp(
                    child: AvatarGlow(
                      //curve: Curves.easeOut,
                      endRadius: _width/3.5,
                      duration: Duration(seconds: 3),
                      glowColor: Colors.blueAccent,
                      repeat: true,
                      child: GestureDetector(
                        onTap: () async {
                         //launch("https://docs.google.com/document/d/1-UaRguuQuFR4R08Q4jtmiL9KCL_B-ZwYG70tQImGNgU/edit?ts=5ecccadb");
                        },
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
                    height: _height/70,
                  ),
                  ShowUp(
                    child: Text(
                      "&",
                      style: TextStyle(fontSize: _width/15, color: Colors.black),
                    ),
                    delay: delayedAmount,
                  ),
                  SizedBox(
                    height: _height/70,
                  ),
                  ShowUp(
                    child: Text(
                      "\'The thoughts in your head\'",
                      style: TextStyle(fontSize: _width/18, color: Colors.black),
                    ),
                    delay: delayedAmount,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                      ShowUp(
                        child: Text("Developed By",style: TextStyle(
                          fontSize: _width/25
                        ),),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      ShowUp(
                    delay: 1300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ,),]),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height/17,
                          width: _width/2,
                          child: RaisedButton(
                            //elevation: 10,
                            onPressed: () {
                              !buttontoshow ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Onboarding()))
                              : Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
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
                              !buttontoshow ? "Get Started" : "Retake Quiz",
                              style: TextStyle(fontSize: _width/23),
                            ),
                          ),
                        ),
                        delay: 1100,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/70,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height/17,
                          width: _width/2,
                          child: RaisedButton(
                            //    elevation: 10,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArticlePage()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.orange,
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Articles",
                              style: TextStyle(fontSize: _width/23),
                            ),
                          ),
                        ),
                        delay: 1400,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/70,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height/17,
                          width: _width/2,
                          child: RaisedButton(
                            //elevation: 10,
                            onPressed: () async{
                              launch("https://github.com/MSPC-Tech/MentalHealthApp/raw/master/static/Get%20Help%20Now.pdf");
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.teal,
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Get Help Now!",
                              style: TextStyle(fontSize: _width/23),
                            ),
                          ),
                        ),
                        delay: 1100,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/50,
                      ),
                    ],
                  ),
              ]),
        )
      ),
    );
  }
}
