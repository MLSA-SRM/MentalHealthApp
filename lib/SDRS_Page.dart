import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/ResultPage.dart';
import 'package:mental_health_app/PHQ9_Page.dart';
import 'package:mental_health_app/TimerPage.dart';
import 'package:mental_health_app/question.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Showup.dart';


class SDRSPage extends StatefulWidget {
  @override
  _SDRSPageState createState() => _SDRSPageState();
}

class _SDRSPageState extends State<SDRSPage> {

  SwiperController _controller = SwiperController();
  List<Question> SDRS_Questions = [Question(),Question(),Question(),Question(),Question()];
  List<Color> randomizecolor = [Colors.blue,Colors.green,Colors.red,Colors.purple,Colors.pink,Colors.orange];
  List<Color> randomizecolorlight = [Colors.blue[100],Colors.green[100],Colors.red[100],Colors.purple[100],Colors.pink[100],Colors.orange[100]];

  List<List<bool>> isselected = new List.generate(27, (j) => [false,false,false,false,false]);
  List<String> questions = ["I am always courteous even to people who are disagreeable",
                            "There have been occasions when I took advantage of someone",
                            "I sometimes try to get even rather than forgive and forget",
                            "I sometimes feel resentful when I don’t get my way",
                            "No matter who I’m talking to, I’m always a good listener"];

  List<int> qtype = [1,2,3];
  bool isSevere = false;

  int count = 0;

  var varysize=1;

  _getQuestions(){
    for(int i =0;i<5;i++){
      SDRS_Questions[i].getQues(questions[i], "assets/sdrs_${(i+1)}.png");
      SDRS_Questions[i].getOptions("Definitely True", "Mostly True", "Don't Know", "Mostly False","Definitely False");
      SDRS_Questions[i].getColor(randomizecolor[i%6], randomizecolor[i%6], randomizecolor[i%6],randomizecolor[i%6], randomizecolor[i%6]);
      SDRS_Questions[i].type = 1;
    }
    qtype.forEach((i){
      SDRS_Questions[i].type = 2;
    });
  }

  int total_a =0,total_d =0,total_s =0;
  String result_a,result_d,result_s;

  int total=0;

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
        itemCount: 6,
        curve: Curves.easeInOutCubic,
        scrollDirection:Axis.horizontal,
        loop: false,
        viewportFraction: 1,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
            if(index<5){
              return page(SDRS_Questions[index],index);
            }
            else return summary(context);
        },
      ),
    );
  }

  Widget page(Question question,int index) {
    ScreenUtil.init(context,
        allowFontScaling: true);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShowUp(
            delay : 500,
                        child: Container(
                child: Image(
                  image: AssetImage(question.imgURL),
                  height: 300.h,
                )),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              question.ques,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(55,allowFontScalingSelf: true),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              _controller.next();
              if(SDRS_Questions[index].type == 1){total +=1;SDRS_Questions[index].points = 1;}
              else {total += 0;SDRS_Questions[index].points = 0;}
              setState(() {
                SDRS_Questions[index].answer = question.opt1;
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
                leading:
                Icon(Icons.keyboard_arrow_right, color: Colors.white),
                trailing: isselected[index][0]? Icon(Icons.spellcheck, color: Colors.white) : null,
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
              if(SDRS_Questions[index].type == 1){total +=1;SDRS_Questions[index].points = 1;}
              else {total += 0;SDRS_Questions[index].points = 0;}
              setState(() {
                SDRS_Questions[index].answer = question.opt2;
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
                leading:
                Icon(Icons.keyboard_arrow_right, color: Colors.white),
                trailing: isselected[index][1]? Icon(Icons.spellcheck, color: Colors.white) : null,
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
              if(SDRS_Questions[index].type == 1){total +=1;SDRS_Questions[index].points = 1;}
              else {total += 0;SDRS_Questions[index].points = 0;}
              setState(() {
                SDRS_Questions[index].answer = question.opt3;
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
                leading:
                Icon(Icons.keyboard_arrow_right, color: Colors.white),
                trailing: isselected[index][2]? Icon(Icons.spellcheck, color: Colors.white) : null,
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
              if(SDRS_Questions[index].type == 1){total +=1;SDRS_Questions[index].points = 1;}
              else {total += 0;SDRS_Questions[index].points = 0;}
              setState(() {
                SDRS_Questions[index].answer = question.opt4;
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
                leading:
                Icon(Icons.keyboard_arrow_right, color: Colors.white),
                trailing: isselected[index][3]? Icon(Icons.spellcheck, color: Colors.white) : null,
                title: Text(
                  question.opt4,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _controller.next();
              if(SDRS_Questions[index].type == 2){total +=1;SDRS_Questions[index].points = 1;}
              else {total += 0;SDRS_Questions[index].points = 0;}
              setState(() {
                SDRS_Questions[index].answer = question.opt5;
                isselected[index][0] = false;
                isselected[index][1] = false;
                isselected[index][2] = false;
                isselected[index][3] = false;
                isselected[index][4] = true;
              });
            },
            child: Card(
              elevation: 8,
              color: question.opt5Color,
              child: ListTile(
                leading:
                Icon(Icons.keyboard_arrow_right, color: Colors.white),
                trailing: isselected[index][4]? Icon(Icons.spellcheck, color: Colors.white) : null,
                title: Text(
                  question.opt5,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            child: StepProgressIndicator(
                totalSteps: 5,
                height: 10.h,
                //currentStep: index,
                //selectedColor: randomizecolor[index % 6],
                //unselectedColor: randomizecolorlight[index % 6],
                customColor: (index) => isselected[index - 1][0] ||
                        isselected[index - 1][1] ||
                        isselected[index - 1][2] ||
                        isselected[index - 1][3] ||
                        isselected[index - 1][4]
                    ? Colors.green
                    : Colors.red,
                customStep: (index, color) {
                  if(varysize==index)
                    {
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
                    _controller.move(index-1);
                    //print('$index step pressed');
                  };
                }),
          ),
        ],
      ),
    );
  }

  _calcResult() async {/*
    SharedPreferences saveTotal = await SharedPreferences.getInstance();
    total_a = int.parse(saveTotal.getString('totalAnxiety'));
    total_d = int.parse(saveTotal.getString('totalDepression'));
    total_s = int.parse(saveTotal.getString('totalStress'));
    if(total_a >=6 || total_d >=7 )isSevere = true;
    else isSevere = false;*/
  }
Future pushToFirebase() async {
    final Map<String, String> someMap = {};
    print('map for SDRS created');

    someMap["Q10"] = DateTime.now().toString();
    for (int i = 0; i < 5; i++) {
      someMap["Q${i + 10+1}"] = SDRS_Questions[i].answer;
      print(SDRS_Questions[i].answer);
    }
    print('done');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pushId = prefs.getString('key');
    FirebaseDatabase.instance
        .reference()
        .child("Responses")
        .child(pushId)
        .child("sdrs")
        .set(someMap);
  }

  Widget summary(BuildContext context){
    _calcResult();
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
              onTap: ()async {
                setState(() {
                  count = 0;
                  for (int i = 0; i < 5; i++) {
                    if (isselected[i][0] == true ||
                        isselected[i][1] == true ||
                        isselected[i][2] == true ||
                        isselected[i][3] == true ||
                        isselected[i][4] == true
                        ) {
                      count += 1;
                    }
                  }
                });
                if(count == 5)
                {
                  await pushToFirebase();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String dummy = prefs.get('currentPage');
                  int cp = int.parse(dummy);
                  prefs.setString('currentPage', (cp+1).toString());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TimerPage("Result",false)));//Done
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
                "Done",
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
