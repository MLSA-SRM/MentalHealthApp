import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
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
  String res, msg,title,endMsg,imgUrl;


  Map<String, HighlightedWord> words;
  HighlightMap highlightMap;


 Future<List<String>> _getFinalMessage() async {
    List<String> msgList = List<String>(4);
    var prefs = await SharedPreferences.getInstance();
    res = prefs.get('result');
    if (res == 'dep') {
      msg =
          "Sadness is a human emotion that all people feel at certain times during their lives."
              " Feeling sad is a natural reaction to situations that cause emotional upset or pain."
              " When you’re sad, it may feel all-encompassing at times."
              " But you should also have moments when you are able to laugh or be comforted."
              " Depression differs from sadness. The feelings you have will affect all aspects of your life."
              " It may be hard or even impossible to find enjoyment in anything, including activities and people you used to enjoy."
              " Depression is a medical Condition, not an emotion."
              " Our screening assessment suggests that you have symptoms suggestive of Depression.";
      title = "Depression";
      endMsg = "Our screening assessment suggests that you may be depressed.";
      imgUrl = "assets/icon_depression.png";
      words = {"Depression": HighlightedWord(
          textStyle: TextStyle(color: Colors.blue),
          onTap: (){
        print("Depression");
      })};
    }
    else if (res == 'anx'){
      msg = "It’s normal to feel Anxious when faced with a potentially dangerous situation or worrying triggers,"
          " our “nerves” become the warning signs we need to navigate the dangers around us."
          " The problem starts when you start experiencing  these symptoms constantly or intensely even without a present danger."
          " Our screening assessment suggests that you may have symptoms suggestive of an Anxiety disorder.";
      title = "Anxiety";
      endMsg = "Our screening assessment suggests that you may be overly anxious and are unable to cope with it.";
      imgUrl = "assets/icon_anxiety.png";
      words = {"Anxiety": HighlightedWord(
          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          onTap: (){
        print("Anxiety");
      })};
    }
    else if (res == 'str'){
      msg = "We all go through stress in our lives, it’s important for your growth."
          " Stress becomes a problem when it exceeds your ability to cope with them."
          " Our screening assessment suggests that you may be under stress, which you’re unable to cope with.";
      title = "Stress";
      endMsg = "Our screening assessment suggests that you may be under stress, which you’re unable to cope with.";
      imgUrl = "assets/icon_stress.png";
      words = {"Stress": HighlightedWord(
          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          onTap: (){
        print("Stress");
      })};
    }
    else {
      msg = "Strong mental health isn’t just the absence of mental health problems."
          " Being mentally or emotionally healthy is much more than being free of depression, anxiety, or other psychological issues."
          " Rather than the absence of mental illness, mental health refers to the presence of positive characteristics."
          " Although our Screening assessment didn’t find signs of any problems. ";
      title = "No Issues";
      endMsg = "Although our Screening assessment didn’t find signs of any problems,"
          " we suggest you to go through the Know More section of the app to learn more about Positive Mental Health."
          " If you currently have any problems or face any problems in the future,";
      imgUrl = "assets/icon_no problems.png";
    }
    msgList[0] = title;
    msgList[1] = msg;
    msgList[2] = endMsg;
    msgList[3] = imgUrl;
    highlightMap = HighlightMap(words);
    prefs.setString('status', 'done');
    prefs.remove('deviceToken');
   return msgList; 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Text("Preliminary Findings",textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/15,
                fontWeight: FontWeight.bold,
              color: Colors.teal
            ),),
          ShowUp(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child:FutureBuilder(
              future: _getFinalMessage(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Your result is loading....",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/25,
                        ),),
                      LinearProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),)
                    ],
                  );
                }
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    ShowUp(
                      delay: 400,
                      child: Container(
                          child: Image(
                            image: AssetImage(snapshot.data[3]),
                            height: MediaQuery.of(context).size.height/7,
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    TextHighlight(text: snapshot.data[1],
                      words: highlightMap.getMap,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/24,
                        color: Colors.black
                      ),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Text("Don't worry we are “Here For You”",
                      style: TextStyle(
                        color: Color(0xffEB6841),
                        fontSize: MediaQuery.of(context).size.width/24,
                      ),),
                    GestureDetector(
                      onTap: ()async{
                        launch("https://docs.google.com/document/d/1ZZLO3FCzaQupIxGP1x0Bpsarps9Z1gx4X6UQlxnhBhQ/edit?usp=sharing");
                      },
                      child: Text("Click here to Get Help Now!",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/24,
                          color: Color(0xffEB6841),
                          decoration: TextDecoration.underline
                        ),),
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),
                    child: Text("To read more about common Mental Health Problems, we have a specially curated list of Articles you might benefit from.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/24,
                      color: Color(0xffCC333F),
                    ),),),

                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/60),
                      child: ShowUp(
                        child: Container(
                          height: MediaQuery.of(context).size.height/17,
                          width: MediaQuery.of(context).size.width/2,
                          child: RaisedButton(
                            //    elevation: 10,
                            onPressed: () async {
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
                            color: Colors.teal,
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Articles",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width/20),
                            ),
                          ),
                        ),
                        delay: 1100,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/60),
                      child: ShowUp(
                        child: Container(
                          height: MediaQuery.of(context).size.height/17,
                          width: MediaQuery.of(context).size.width/2,
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
                                Radius.circular(30),
                              ),
                            ),
                            textColor: Colors.white,
                            color: Color(0xffEB6841),
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Homepage",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width/20),
                            ),
                          ),
                        ),
                        delay: 1100,
                      ),
                    )
                  ],
                );
              },
            )
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
        ],
      ),
    );
  }
}
