import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/ArticlesPage.dart';
import 'package:mental_health_app/Showup.dart';
import 'package:mental_health_app/main.dart';
import 'package:mental_health_app/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:highlight_text/highlight_text.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String res, msg, title, endMsg, imgUrl;

  Map<String, HighlightedWord> words;
  HighlightMap highlightMap;

  Future<List<String>> _getFinalMessage() async {
    List<String> msgList = List<String>(4);
    var prefs = await SharedPreferences.getInstance();
    res = prefs.get('result');
    if (res == 'dep') {
      msg =
          "Sadness is a human emotion that all people feel at certain times during their lives."
          " Feeling sad is a natural reaction to situations that cause emotional upset or pain.";
      endMsg = " Depression differs from sadness. The feelings you have will affect all aspects of your life."
          " Depression is a medical Condition, not an emotion."
          " Our screening assessment suggests that you have symptoms suggestive of Depression.";
      title = "Depression";
      imgUrl = "assets/icon_depression.png";
      words = {
        "Depression": HighlightedWord(
            textStyle: TextStyle(color: Color(0xffF65158)),
            onTap: () {
              print("Depression");
            })
      };
    } else if (res == 'anx') {
      msg =
          "It’s normal to feel Anxious when faced with a potentially dangerous situation or worrying triggers,"
          " our “nerves” become the warning signs we need to navigate the dangers around us.";
      endMsg =
          " The problem starts when you start experiencing  these symptoms constantly or intensely even without a present danger."
          " Our screening assessment suggests that you may have symptoms suggestive of an Anxiety disorder.";
      title = "Anxiety";
      imgUrl = "assets/icon_anxiety.png";
      words = {
        "Anxiety": HighlightedWord(
            textStyle:
                TextStyle(color: Color(0xffF65158), fontWeight: FontWeight.bold),
            onTap: () {
              print("Anxiety");
            })
      };
    } else if (res == 'str') {
      msg =
          "We all go through stress in our lives, it’s important for your growth."
          " Stress becomes a problem when it exceeds your ability to cope with them.";
      endMsg =
          " Our screening assessment suggests that you may be under stress, which you’re unable to cope with.";
      title = "Stress";
      imgUrl = "assets/icon_stress.png";
      words = {
        "Stress": HighlightedWord(
            textStyle:
                TextStyle(color: Color(0xffF65158), fontWeight: FontWeight.bold),
            onTap: () {
              print("Stress");
            })
      };
    } else if(res == 'no issues'){
      msg =
          "Strong mental health isn’t just the absence of mental health problems."
          " Being mentally or emotionally healthy is much more than being free of depression, anxiety, or other psychological issues.";
      endMsg =
          " Rather than the absence of mental illness, mental health refers to the presence of positive characteristics."
          " Although our Screening assessment didn’t find signs of any problems. ";
      title = "No Issues";
      imgUrl = "assets/icon_no problems.png";
    }
    else {

    }
    msgList[0] = title;
    msgList[1] = msg;
    msgList[2] = endMsg;
    msgList[3] = imgUrl;
    prefs.setString('status', 'done');
    prefs.remove('deviceToken');
    print(msgList[2]);
    return msgList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Text(
            "Here are your Preliminary Findings!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff28324B)),
          ),
          ShowUp(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: FutureBuilder(
                    future: _getFinalMessage(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height/10 ,
                            ),
                            Text(
                              "Your result is loading....",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                            LinearProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            )
                          ],
                        );
                      } else
                        return Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/50,
                                        ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffEFBFC3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height/10 ,
                                        ),
                                        Text(
                                          snapshot.data[1],
//                                          words: highlightMap.getMap,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  24,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 70,
                                        ),
                                        Text(
                                           snapshot.data[2],
                                         // words: highlightMap.getMap,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  24,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ShowUp(
                                  delay: 400,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          child: Image(
                                            image: AssetImage(snapshot.data[3]),
                                            height: MediaQuery.of(context).size.height / 6,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Text(
                              "Don't worry we are “Here For You”",
                              style: TextStyle(
                                color: Color(0xffF65158),
                                fontSize:
                                    MediaQuery.of(context).size.width / 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                launch(
                                    "https://docs.google.com/document/d/1ZZLO3FCzaQupIxGP1x0Bpsarps9Z1gx4X6UQlxnhBhQ/edit?usp=sharing");
                              },
                              child: Text(
                                "Click here to Get Help Now!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF65158),
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            SizedBox(
                              height:  MediaQuery.of(context).size.height / 30,
                            ),
                            RichText(
                              textAlign:TextAlign.center,
                                text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                 text:  "To read more about common Mental Health Problems, we have a specially curated list of Articles you might benefit from. ",
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width / 24,
                                    color: Color(0xff28324B),
                                  ),
                                ),
                                TextSpan(
                                  text:"Click Here!",
                                  recognizer:  TapGestureRecognizer()..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePage()));
                                  },
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width / 24,
                                      color: Color(0xff28324B),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              ]
                            )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 30),
                              child: ShowUp(
                                child: Container(
                                  height:
                                  MediaQuery.of(context).size.height / 15,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: RaisedButton(
                                    //    elevation: 10,
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyApp()));
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    textColor: Colors.white,
                                    color: Color(0xffD3515B),
//                                    padding: const EdgeInsets.all(8.0),
                                    child: new Text(
                                      "Homepage",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .width /
                                              25),
                                    ),
                                  ),
                                ),
                                delay: 1100,
                              ),
                            ),
                          ],
                        );
                    },
                  ))),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
        ],
      ),
    );
  }
}
