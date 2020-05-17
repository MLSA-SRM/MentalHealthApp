import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/question.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BACE_Page.dart';
import 'Showup.dart';


class PHQ9Page extends StatefulWidget {
  @override
  _PHQ9PageState createState() => _PHQ9PageState();
}

class _PHQ9PageState extends State<PHQ9Page> {

  SwiperController _controller = SwiperController();
  List<Question> PHQ9_Questions = [Question(),Question(),Question(),Question(),Question(),Question(),Question(),Question(),Question()];
  List<Color> randomizecolor = [Colors.blue,Colors.green,Colors.red,Colors.purple,Colors.pink,Colors.orange];
  List<Color> randomizecolorlight = [Colors.blue[100],Colors.green[100],Colors.red[100],Colors.purple[100],Colors.pink[100],Colors.orange[100]];

  List<List<bool>> isselected = new List.generate(9, (j) => [false,false,false,false,false]);
  List<String> questions = ["Little interest or pleasure in doing things",
    "Feeling down, depressed, or hopeless",
    "Trouble falling or staying asleep, or sleeping too much",
    "Feeling tired or having little energy",
    "Poor appetite or overeating",
    "Feeling bad about yourself — or that you are a failure or have let yourself or your family down",
    "Trouble concentrating on things, such as reading the newspaper or watching television",
    "Moving or speaking so slowly that other people could "
        "have noticed? Or the opposite — being fidgety"
        "",
    "Thoughts that you would be better off dead or of hurting yourself in some way"];


  _getQuestions(){
    for(int i =0;i<9;i++){
      PHQ9_Questions[i].getQues(questions[i], "assets/PHQ-9icons_${(i+1)}.png");
      PHQ9_Questions[i].getOptions("Not at all", "Several days", "More than half the days", "Nearly every day");
      PHQ9_Questions[i].getColor(randomizecolor[i%6],randomizecolor[i%6],randomizecolor[i%6], randomizecolor[i%6]);
      PHQ9_Questions[i].type = 1;
    }
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
        itemCount: 10,
        curve: Curves.easeInOutCubic,
        scrollDirection:Axis.horizontal,
        loop: false,
        viewportFraction: 0.95,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          if(index<9){
            return page(PHQ9_Questions[index],index);
          }
          else return summary();
        },
      ),
    );
  }

  Widget page(Question question,int index) {
    ScreenUtil.init(context, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, allowFontScaling: true);

    return Center(
      child: SizedBox(
        height: 650.h,
        child: Column(
          children: <Widget>[
            ShowUp(
              delay : 500,
              child: Container(
                  child: Image(
                    image: AssetImage(question.imgURL),
                    height: 150.h,
                  )
                  ),
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
                total +=0;PHQ9_Questions[index].points = 0;
                setState(() {
                  PHQ9_Questions[index].answer = question.opt1;
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
                total +=1;PHQ9_Questions[index].points = 1;
                setState(() {
                  PHQ9_Questions[index].answer = question.opt2;
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
                total +=2;PHQ9_Questions[index].points = 2;
                setState(() {
                  PHQ9_Questions[index].answer = question.opt3;
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
                total +=3;PHQ9_Questions[index].points = 3;
                setState(() {
                  PHQ9_Questions[index].answer = question.opt4;
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
            Container(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: StepProgressIndicator(
                    totalSteps: 9,
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
                      return Icon(
                        Icons.check_box_outline_blank,
                        color: color,
                        size: 15,
                      );
                    },
                    onTap: (index) {
                      return () {
                        _controller.move(index-1);
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

  String _getresult(){
    if(total >=0 && total <= 5) return "Mild";
    else if(total >=6 && total <= 10) return "Moderate";
    else if(total >=11 && total <= 15) return "Moderately severe";
    else return "Severe";
  }

  Widget summary(){
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(padding: EdgeInsets.only(top: 300),
          child: Column(
            children: <Widget>[
              Text("Result",style: TextStyle(fontSize: 30)),
              Text("Depression = " + _getresult() ,style: TextStyle(fontSize: 20),),
              RaisedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BACEPage()));
              },
                color: Colors.teal,
                child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),),)
            ],
          ),
        ),
      ),
    );
  }

}
