import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Showup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String res, msg,title;
 Future<List<String>> _getFinalMessage() async {
    List<String> msgList = List<String>(2);
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
              " Depression is a medical Condition, not an emotion. Our screening assessment suggests that you may be depressed.";
      title = "Depression";
    }
    else if (res == 'anx'){
      msg ="It’s normal to feel Anxious when faced with a potentially dangerous situation or worrying triggers,"
          " our “nerves” become the warning signs we need to navigate the dangers around us."
          " The problem starts when you start experiencing  these symptoms constantly or intensely even without a present danger."
          " Our screening assessment suggests that you may be overly anxious and are unable to cope with it.";
      title = "Anxiety";
    }
    else if (res == 'str'){
      msg = "We all go through stress in our lives, it’s important for out growth,"
          " stress becomes a problem when it exceeds your ability to cope with them."
          " Our screening assessment suggests that you may be under stress, which you’re unable to cope with.";
      title = "Stress";
    }
    else {
      msg ="Strong mental health isn’t just the absence of mental health problems."
          " Being mentally or emotionally healthy is much more than being free of depression, anxiety, or other psychological issues."
          " Rather than the absence of mental illness, mental health refers to the presence of positive characteristics."
          " Although our Screening assessment didn’t find signs of any problems,"
          " we suggest you to go through the Know More section of the app to learn more about Positive Mental Health."
          " If you currently have any problems or face any problems in the future,";
      title = "No Issues";
    }
    msgList[0] = title;
    msgList[1] = msg;
   return msgList; 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Text("Final Result",textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/15,
                fontWeight: FontWeight.bold,
              color: Colors.green
            ),),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
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
                    Text(snapshot.data[0],textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/20,
                        fontWeight: FontWeight.bold
                      ),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Text(snapshot.data[1],textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/25,
                      ),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Text("Don't worry we are “Here For You” Click on the below given link to get help now.",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/25,
                      ),),
                    GestureDetector(
                      onTap: ()async{
                        launch("https://athensdazzle.wixsite.com/website-1");
                      },
                      child: Text("\nhttps://athensdazzle.wixsite.com/website-1",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/25,
                          color: Colors.blue,
                        ),),
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
