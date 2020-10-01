import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';

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
  String assetPDFPath4 = "";
  final int delayedAmount = 1000;
  SharedPreferences prefs;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  bool onCallback = false, buttontoshow = false;
  String url, _result;

  getresult() async {
    prefs = await SharedPreferences.getInstance();
    final _result = prefs.getString('status');
    print(_result);
    if (_result != null) buttontoshow = true;
  }

  checkDeviceId() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('deviceToken')?.isEmpty ?? true) {
      String deviceToken = await firebaseMessaging.getToken();
      await FirebaseDatabase.instance
          .reference()
          .child("fcm-token")
          .child(deviceToken)
          .set({"token": deviceToken});
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
        setState(() {});
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        print(message['data']['body']);
        url = message['data']['body'];
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebViewPage(url)));
        setState(() {});
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        print(message['data']['body']);
        url = message['data']['body'];
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebViewPage(url)));
        setState(() {});
      },
    );
    getFileFromAsset4("assets/Get Help Now.pdf").then((f4) {
      setState(() {
        assetPDFPath4 = f4.path;
      });
    });
  }

  Future<File> getFileFromAsset4(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/Get Help Now.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
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
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    ShowUp(
                      child: AvatarGlow(
                        //curve: Curves.easeOut,
                        endRadius: _width / 4,
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
                                child: Image(
                                    image: AssetImage('assets/mainlogo.png')),
                                radius: _width / 6,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 90,
                    ),
                    ShowUp(
                      child: Text(
                        "Here For You",
                        style: GoogleFonts.nunito(
                          fontSize: _width / 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _height / 100,
                    ),
                    ShowUp(
                      child: Text(
                        "&",
                        style: GoogleFonts.nunito(
                          fontSize: _width / 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _height / 70,
                    ),
                    ShowUp(
                      child: Text(
                        "\" The thoughts in your head \"",
                        style: GoogleFonts.nunito(
                          fontSize: _width / 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    ShowUp(
                      child: Text(
                        "Developed By",
                        style: GoogleFonts.nunito(
                          fontSize: _width / 27,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    Divider(
                      height: 3,
                    ),
                    SizedBox(
                      height: _height / 90,
                    ),
                    ShowUp(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              launch(
                                  "https://msclubsrm.in/static/hereforyou.html");
                            },
                            child: Image(
                              image: AssetImage("assets/mspcnew.png"),
                              height: 250.h,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              launch(
                                  "https://envision.aaruush.org/Here-For-You-App-Team-Page/");
                            },
                            onLongPress: () async {
                              launch("https://envision.aaruush.org/");
                            },
                            child: Image(
                              image: AssetImage("assets/envision.png"),
                              height: 250.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height / 90,
                  ),
                  Divider(
                    height: 3,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height / 17,
                          width: _width / 2,
                          child: RaisedButton(
                            //elevation: 10,
                            onPressed: () {
                              !buttontoshow
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Onboarding()))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Quiz()));
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
                              style: GoogleFonts.nunito(
                                fontSize: _width / 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height / 17,
                          width: _width / 2,
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
                              style: GoogleFonts.nunito(
                                fontSize: _width / 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      ShowUp(
                        child: Container(
                          height: _height / 17,
                          width: _width / 2,
                          child: RaisedButton(
                            //elevation: 10,
                            onPressed: () async {
                              if (assetPDFPath4 != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PdfViewPage(path: assetPDFPath4)));
                              }
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
                              style: GoogleFonts.nunito(
                                fontSize: _width / 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                    ],
                  ),
                ]),
          )),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage + 1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
