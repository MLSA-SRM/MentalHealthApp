import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/PHQ9_Page.dart';
import 'package:mental_health_app/TimerPage.dart';
import 'package:mental_health_app/question.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Showup.dart';

class GAD7Page extends StatefulWidget {
  bool hasBoth;
  GAD7Page(this.hasBoth);
  @override
  _GAD7PageState createState() => _GAD7PageState(hasBoth);
}

class _GAD7PageState extends State<GAD7Page> {
  bool hasBoth;

  int count = 0;

  var varysize = 1;
  _GAD7PageState(this.hasBoth);
  SwiperController _controller = SwiperController();
  List<Question> GAD7_Questions = [
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question()
  ];
  List<Color> randomizecolor = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.blue,
    Colors.green
  ];
  List<Color> randomizecolorlight = [
    Colors.blue[100],
    Colors.green[100],
    Colors.red[100],
    Colors.purple[100],
    Colors.pink[100],
    Colors.orange[100],
    Colors.blue[100],
    Colors.green[100]
  ];

  List<List<bool>> isselected =
      new List.generate(8, (j) => [false, false, false, false, false]);
  List<String> questions = [
    "Feeling nervous, anxious or on edge",
    " Not being able to stop or control worrying",
    "Worrying too much about different things",
    "Trouble relaxing",
    "Being so restless that it is hard to sit still",
    "Becoming easily annoyed or irritable",
    "Feeling afraid as if something awful might happen",
    " If you checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?"
  ];

  _getQuestions() {
    for (int i = 0; i < 7; i++) {
      GAD7_Questions[i]
          .getQues(questions[i], "assets/PHQ-9icons_${(i + 1)}.png");
      GAD7_Questions[i].getOptions("Not at all", "Several days",
          "More than half the days", "Nearly every day");
      GAD7_Questions[i].getColor(randomizecolor[i % 7], randomizecolor[i % 7],
          randomizecolor[i % 7], randomizecolor[i % 7]);
      GAD7_Questions[i].type = 1;
    }
    GAD7_Questions[7].getQues(questions[7], "assets/PHQ-9icons_8.png");

    GAD7_Questions[7].getColor(randomizecolor[0], randomizecolor[0],
        randomizecolor[0], randomizecolor[0]);

    GAD7_Questions[7].getOptions(
      "Not at all Difficult",
      "Somewhat Difficult",
      "Very Difficult",
      "Extremely Difficult"
    );
    //  print("\n\n")
  }

  int total_a = 0, total_d = 0, total_s = 0;
  String result_a, result_d, result_s;

  int total = 0;

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
        onIndexChanged: (index) {
          varysize = index + 1;
        },
        itemCount: 9,
        curve: Curves.easeInOutCubic,
        scrollDirection: Axis.horizontal,
        loop: false,
        viewportFraction: 0.95,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          if (index < 8) {
            return page(GAD7_Questions[index], index);
          } else
            return summary(context);
        },
      ),
    );
  }

  Widget page(Question question, int index) {
    print("question.opt1Color = ${question.opt1Color.toString()} $index");
    ScreenUtil.init(context, allowFontScaling: true);
    return Center(
      child: SingleChildScrollView(
              child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShowUp(
              delay: 500,
              child: Container(
                  child: Image(
                image: AssetImage(question.imgURL),
                height: 400.h,
              )),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                question.ques,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                _controller.next();
                total += 0;
                GAD7_Questions[index].points = 0;
                setState(() {
                  GAD7_Questions[index].answer = question.opt1;
                  isselected[index][0] = true;
                  isselected[index][1] = false;
                  isselected[index][2] = false;
                  isselected[index][3] = false;
                  isselected[index][4] = false;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt1Color,
                child: ListTile(
                  leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  trailing: isselected[index][0]
                      ? Icon(Icons.spellcheck, color: Colors.white)
                      : null,
                  title: Text(
                    question.opt1,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                total += 1;
                GAD7_Questions[index].points = 1;
                setState(() {
                  GAD7_Questions[index].answer = question.opt2;
                  isselected[index][0] = false;
                  isselected[index][1] = true;
                  isselected[index][2] = false;
                  isselected[index][3] = false;
                  isselected[index][4] = false;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt2Color,
                child: ListTile(
                  leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  trailing: isselected[index][1]
                      ? Icon(Icons.spellcheck, color: Colors.white)
                      : null,
                  title: Text(
                    question.opt2,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                total += 2;
                GAD7_Questions[index].points = 2;
                setState(() {
                  GAD7_Questions[index].answer = question.opt3;
                  isselected[index][0] = false;
                  isselected[index][1] = false;
                  isselected[index][2] = true;
                  isselected[index][3] = false;
                  isselected[index][4] = false;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt3Color,
                child: ListTile(
                  leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  trailing: isselected[index][2]
                      ? Icon(Icons.spellcheck, color: Colors.white)
                      : null,
                  title: Text(
                    question.opt3,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                total += 3;
                GAD7_Questions[index].points = 3;
                setState(() {
                  GAD7_Questions[index].answer = question.opt4;
                  isselected[index][0] = false;
                  isselected[index][1] = false;
                  isselected[index][2] = false;
                  isselected[index][3] = true;
                  isselected[index][4] = false;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt4Color,
                child: ListTile(
                  leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  trailing: isselected[index][3]
                      ? Icon(Icons.spellcheck, color: Colors.white)
                      : null,
                  title: Text(
                    question.opt4,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: StepProgressIndicator(
                    totalSteps: 8,
                    height: 10.h,
                    //currentStep: index,
                    //selectedColor: randomizecolor[index % 6],
                    //unselectedColor: randomizecolorlight[index % 6],
                    customColor: (index) => isselected[index - 1][0] ||
                            isselected[index - 1][1] ||
                            isselected[index - 1][2] ||
                            isselected[index - 1][3]
                        ? Colors.green
                        : Colors.red,
                    customStep: (index, color) {
                      if (varysize == index) {
                        return Icon(
                          Icons.check_box_outline_blank,
                          color: color,
                          size: 50.w,
                        );
                      }
                      return Icon(
                        Icons.stop,
                        color: color,
                        size: 50.w,
                      );
                    },
                    onTap: (index) {
                      return () {
                        _controller.move(index - 1);
                        //print('$index step pressed');
                      };
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getresult() {
    if (total >= 0 && total <= 5)
      return "Mild";
    else if (total >= 6 && total <= 10)
      return "Moderate";
    else if (total >= 11 && total <= 15)
      return "Moderately severe";
    else
      return "Severe";
  }

  Future pushToFirebase() async {
    final Map<String, String> someMap = {};
    print('map for GAD7 created');

    someMap["Q10"] = DateTime.now().toString();
    for (int i = 0; i < 8; i++) {
      someMap["Q${i + 10 + 1}"] = GAD7_Questions[i].answer;
      print(GAD7_Questions[i].answer);
    }
    print('done');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pushId = prefs.getString('key');
    FirebaseDatabase.instance
        .reference()
        .child("Responses")
        .child(pushId)
        .child("gad7")
        .set(someMap);
  }

  Widget summary(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                child: Image(
              image: AssetImage('assets/checklist.png'),
              height: 400.h,
            )),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  count = 0;
                  for (int i = 0; i < 8; i++) {
                    if (isselected[i][0] == true ||
                        isselected[i][1] == true ||
                        isselected[i][2] == true ||
                        isselected[i][3] == true) {
                      count += 1;
                    }
                  }
                });
                if (count == 8) {
                  await pushToFirebase();
                  if (hasBoth) {
                    prefs.setString('currentPage', '2');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimerPage("PHQ9", false)));
                  } else {
                    prefs.setString('currentPage', '2');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimerPage("BACE", false)));
                  }
                } else {
                  final snackBar = SnackBar(
                    content: Text("Please complete the questionnaire"),
                    duration: Duration(milliseconds: 800),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: Card(
                elevation: 8,
                color: Colors.teal[400],
                child: ListTile(
                  leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    "Proceed",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
