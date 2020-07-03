import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/BACE_Page.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/PHQ9_Page.dart';
import 'package:mental_health_app/ResultPage.dart';
import 'package:mental_health_app/SDRS_Page.dart';
import 'package:mental_health_app/Showup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerPage extends StatefulWidget {
  String nextPage;
  bool hasBth;
  TimerPage(this.nextPage, this.hasBth);
  @override
  _TimerPageState createState() => _TimerPageState(nextPage, hasBth);
}

class _TimerPageState extends State<TimerPage> {
  bool hasBoth;
  String nextPage;
  _TimerPageState(this.nextPage, this.hasBoth);

  Future<List<int>> getImageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dummy1 = prefs.get('currentPage');
    int cp = int.parse(dummy1);
    String dummy2 = prefs.get('totalPages');
    int tp = int.parse(dummy2);
    List<int> pages = List<int>(2);
    pages[0] = cp;
    pages[1] = tp;
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getImageData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                child: ListView(
                  children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ShowUp(
                          delay: 400,
                          child: Container(
                              child: Image(
                            image: AssetImage(
                                'assets/timer_${snapshot.data[0]}-${snapshot.data[1]}.png'),
                            height: MediaQuery.of(context).size.height / 5,
                          )),
                        ),
                        SizedBox(
                          // height: MediaQuery.of(context).size.height / 10,
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text(
                          snapshot.data[0] != snapshot.data[1]
                              ? "${snapshot.data[0]} down ${snapshot.data[1] - snapshot.data[0]} more to go!"
                              : "You have Completed all the quizzes, Click the below button to view your result!",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        // ListView(),
                        TextPortion(
                          nextPage: nextPage,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        ShowUp(
                          child: Container(
                            height: _height / 17,
                            width: _width / 2,
                            child: RaisedButton(
                              //elevation: 10,
                              onPressed: () {
                                if (nextPage == "GAD7") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GAD7Page(hasBoth)));
                                } else if (nextPage == "PHQ9") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PHQ9Page()));
                                } else if (nextPage == "BACE") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BACEPage()));
                                } else if (nextPage == "SDRS") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SDRSPage()));
                                } else if (nextPage == "Result") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultPage()));
                                } else {}
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
                                snapshot.data[0] != snapshot.data[1]
                                    ? "NEXT"
                                    : "View Result",
                                style: TextStyle(fontSize: _width / 23),
                              ),
                            ),
                          ),
                          delay: 1100,
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ]),
              );
          }),
    );
  }
}

class TextPortion extends StatelessWidget {
  TextPortion({
    this.nextPage,
    Key key,
  }) : super(key: key);
  final String nextPage;
  double textSize = 18;

  @override
  Widget build(BuildContext context) {
    if (nextPage == "GAD7") {
      print("GAD7");
      return Column(
        children: [
          SizedBox(height: 20),
          Text(
              "To help us screen for Depression or Anxiety Disorder. (Keep in mind, this is just a screening test!)",
              style: TextStyle(fontSize: textSize)),
          SizedBox(
            height: 20,
          ),
          Text(
              "Select over the last 2 weeks, how often have you been bothered by the following problems.",
              style: TextStyle(color: Colors.red, fontSize: textSize)),
          SizedBox(height: 8),
        ],
      );
    } else if (nextPage == "PHQ9") {
      print("PHQ9");
      return Column(
        children: [
          // SizedBox(height: 20),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Text(
              "To help us screen for Depression or Anxiety Disorder. (Keep in mind, this is just a screening test!)",
              style: TextStyle(fontSize: textSize)),
          SizedBox(
            height: 20,
          ),
          Text(
              "Select over the last 2 weeks, how often have you been bothered by the following problems.",
              style: TextStyle(color: Colors.red, fontSize: textSize)),
          SizedBox(height: 8),
        ],
      );
    } else if (nextPage == "SDRS") {
      print("SDRS");
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Select",
                  style: TextStyle(color: Colors.black, fontSize: textSize)),
              TextSpan(
                  text: " how much the following statements apply to you, ",
                  style: TextStyle(color: Colors.red, fontSize: textSize)),
              TextSpan(
                  text: "this will help us understand you better.",
                  style: TextStyle(color: Colors.black, fontSize: textSize)),
            ]),
          ),
        ],
      );
    } else if (nextPage.compareTo("BACE") == 0) {
      print("BACE");
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
                "Next, you will see a list of things that can stop, delay, or discourage people from getting professional care for a mental health problem, or continuing to get help. By professional care, we mean care from staff such as a GP (family doctor), member of a community mental health team (e.g. care coordinator, mental health nurse or mental health social worker), psychiatrist, counselor, psychologist, or psychotherapist.",
                style: TextStyle(fontSize: textSize - 2)),
            SizedBox(
              height: 12,
            ),
            Text(
                "Answer the following questions in accordance to the extent up to which any of these issues ever stopped, delayed, or discouraged you from getting, or continuing with, professional care for a mental health problem?",
                style: TextStyle(color: Colors.red, fontSize: textSize - 2)),
            SizedBox(
              height: 12,
            ),
            Text(
                "Reference:\nBarriers to Care Evaluation (BACE-3) scale © 2011. Health Service and Population Research Department, Institute of Psychiatry, King’s College London.",
                style: TextStyle(color: Colors.red, fontSize: textSize - 6)),
          ],
        ),
      );
    } else
      return Container();
  }
}
