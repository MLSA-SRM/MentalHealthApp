import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/SDRS_Page.dart';
import 'package:mental_health_app/TimerPage.dart';
import 'package:mental_health_app/question.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Showup.dart';

class BACEPage extends StatefulWidget {
  @override
  _BACEPageState createState() => _BACEPageState();
}

class _BACEPageState extends State<BACEPage> {
  SwiperController _controller = SwiperController();
  List<Question> BACE_Questions = [
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
    Question(),
  ];

  List<String> questions = [
    "Being unsure where to go to get  professional care",
    "Wanting to solve the problem on my own",
    "Concern that I might be seen as weak for having a mental health problem",
    "Fear of being put in hospital against my will",
    "Concern that it might harm my chances when applying for jobs",
    "Problems with transport or travelling to appointments",
    "Thinking the problem would get better by itself",
    "Concern about what my family might think, say, do or feel",
    "Feeing embarrassed or ashamed",
    "Preferring to get alternative forms of care (e.g. traditional / religious healing or alternative / complementary therapies)",
    "Not being able to afford the financial costs involved",
    "Concern that I might be seen as ‘crazy’",
    "Thinking that professional care probably would not help",
    "Professionals from my own ethnic or cultural group not being available",
    "Being too unwell to ask for help",
    "Concern that people I know might find out",
    "Dislike of talking about my feelings, emotions or thoughts",
    "Concern that people might not take me seriously if they found out I was having professional care",
    "Concerns about the treatments available (e.g. medication side effects)",
    "Not wanting a mental health problem to be on my medical records",
    "Having had previous bad experiences with professional care for mental health",
    "Preferring to get help from family or friends",
    "Thinking I did not have a problem",
    "Concern about what my friends might think, say or do",
    "Difficulty taking time off work",
    "Concern about what people at work might think, say or do",
    "Having no one who could help me get professional care"
  ];

  List<int> qType = [2, 4, 7, 8, 11, 15, 17, 19, 23, 25];
  List<Color> randomizecolor = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.pink,
    Colors.orange
  ];
  List<Color> randomizecolorlight = [
    Colors.blue[100],
    Colors.green[100],
    Colors.red[100],
    Colors.purple[100],
    Colors.pink[100],
    Colors.orange[100]
  ];

  List<List<bool>> isselected =
      new List.generate(27, (j) => [false, false, false, false]);
  int total_a = 0, total_d = 0, total_s = 0;
  String result_a, result_d, result_s;
int count = 0;
  int total = 0, critical_total = 0;

  var varysize=1;

  _getQuestions() {
    for (int i = 0; i < 27; i++) {
      BACE_Questions[i]
          .getQues(questions[i], 'assets/bace-DrManik_${(i + 1)}.png');
      BACE_Questions[i]
          .getOptions("Not at all", "A little", "Quite a lot", "A lot");
      BACE_Questions[i].getColor(randomizecolor[i % 6], randomizecolor[i % 6],
          randomizecolor[i % 6], randomizecolor[i % 6]);
      BACE_Questions[i].type = 1;
    }
    qType.forEach((index) {
      BACE_Questions[index].type = 2;
    });
  }

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
        onIndexChanged: (index){
          varysize = index+1;
        },
        itemCount: 28,
        curve: Curves.easeInOutCubic,
        scrollDirection: Axis.vertical,
        loop: false,
        viewportFraction: 0.99,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          if (index < 27) {
            return page(BACE_Questions[index], index);
          } else if (index == 27)
            return summary(context);
          else
            return null;
        },
      ),
    );
  }

  Widget page(Question question, int index) {
    ScreenUtil.init(context,
        allowFontScaling: true);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShowUp(
            delay: 500,
            child: Container(
                child: Image(
              image: AssetImage(question.imgURL),
              height: 350.h,
            )),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              question.ques,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(55,allowFontScalingSelf: true),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              _controller.next();
              if (BACE_Questions[index].type == 1) {
                total += 0;
              } else {
                total += 0;
                critical_total += 0;
              }
              setState(() {
                BACE_Questions[index].answer = question.opt1;
                BACE_Questions[index].points = 0;
                isselected[index][0] = true;
                isselected[index][1] = false;
                isselected[index][2] = false;
                isselected[index][3] = false;
              });
            },
            child: Card(
              elevation: 8,
              color: question.opt1Color,
              child: ListTile(
                leading:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
              if (BACE_Questions[index].type == 1) {
                total += 1;
              } else {
                total += 1;
                critical_total += 1;
              }
              setState(() {
                BACE_Questions[index].answer = question.opt2;
                BACE_Questions[index].points = 1;
                isselected[index][0] = false;
                isselected[index][1] = true;
                isselected[index][2] = false;
                isselected[index][3] = false;
              });
            },
            child: Card(
              elevation: 8,
              color: question.opt2Color,
              child: ListTile(
                leading:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
              if (BACE_Questions[index].type == 1) {
                total += 2;
              } else {
                total += 2;
                critical_total += 2;
              }
              setState(() {
                BACE_Questions[index].answer = question.opt3;
                BACE_Questions[index].points = 2;
                isselected[index][0] = false;
                isselected[index][1] = false;
                isselected[index][2] = true;
                isselected[index][3] = false;
              });
            },
            child: Card(
              elevation: 8,
              color: question.opt3Color,
              child: ListTile(
                leading:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
              if (BACE_Questions[index].type == 1) {
                total += 3;
              } else {
                total += 3;
                critical_total += 3;
              }
              setState(() {
                BACE_Questions[index].answer = question.opt4;
                BACE_Questions[index].points = 3;
                isselected[index][0] = false;
                isselected[index][1] = false;
                isselected[index][2] = false;
                isselected[index][3] = true;
              });
            },
            child: Card(
              elevation: 8,
              color: question.opt4Color,
              child: ListTile(
                leading:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: StepProgressIndicator(
                  totalSteps: 27,
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
                    if(varysize==index)
                    {
                      return Icon(
                      Icons.check_box_outline_blank,
                      color: color,
                      size: 40.w,
                    );
                    }
                    return Icon(
                      Icons.stop,
                      color: color,
                      size: 40.w,
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
    );
  }

Future pushToFirebase() async {
    final Map<String, String> someMap = {};
    print('map for BACE created');
    
    someMap["Q10"] = DateTime.now().toString();
    for (int i = 0; i < 27; i++) {
      someMap["Q${i + 10+1}"] = BACE_Questions[i].answer;
      print(BACE_Questions[i].answer);
    }
    print('done');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pushId = prefs.getString('key');
    FirebaseDatabase.instance
        .reference()
        .child("Responses")
        .child(pushId)
        .child("bace")
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
              onTap: () async{
                setState(() {
                  count = 0;
                  for (int i = 0; i < 27; i++) {
                    if (isselected[i][0] == true ||
                        isselected[i][1] == true ||
                        isselected[i][2] == true ||
                        isselected[i][3] == true) {
                      count += 1;
                    }
                  }
                });
                if(count == 27)
                {
                  await pushToFirebase();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String dummy = prefs.get('currentPage');
                  int cp = int.parse(dummy);
                  prefs.setString('currentPage', (cp+1).toString());
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TimerPage("SDRS",false)));
                }
                else
                {
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
