import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/question.dart';


class SDRSPage extends StatefulWidget {
  @override
  _SDRSPageState createState() => _SDRSPageState();
}

class _SDRSPageState extends State<SDRSPage> {

  SwiperController _controller = SwiperController();
  List<Question> SDRS_Questions = [Question(),Question(),Question(),Question(),Question()];

  List<String> questions = ["I am always courteous even to people who are disagreeable.",
                            "There have been occasions when I took advantage of someone.",
                            "I sometimes try to get even rather than forgive and forget.",
                            "I sometimes feel resentful when I don’t get my way",
                            "No matter who I’m talking to, I’m always a good listener."];

  List<int> qtype = [1,2,3];

  _getQuestions(){
    for(int i =0;i<5;i++){
      SDRS_Questions[i].getQues(questions[i], "assets/sdrs_${(i+1)}.png");
      SDRS_Questions[i].getOptions("Definitely True", "Mostly True", "Don't Know", "Mostly False","Definitely False");
      SDRS_Questions[i].getColor(Colors.green, Colors.red, Colors.yellow, Colors.blue,Colors.purple);
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
        itemCount: 6,
        curve: Curves.easeInOutCubic,
        scrollDirection:Axis.horizontal,
        loop: false,
        viewportFraction: 0.95,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
            if(index<5){
              return page(SDRS_Questions[index],index);
            }
            else return summary();
        },
      ),
    );
  }

  Widget page(Question question,int index) {
    return Center(
      child: SizedBox(
        //height: 800,
        child: Column(
          children: <Widget>[
            Container(
                child: Image(
                  image: AssetImage(question.imgURL),
                  height: 250,
                )),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _controller.next();
                if(SDRS_Questions[index].type == 1){total +=1;SDRS_Questions[index].points = 1;}
                else {total += 0;SDRS_Questions[index].points = 0;}
                setState(() {
                  SDRS_Questions[index].answer = question.opt1;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt1Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt2Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt3Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt4Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
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
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt5Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    question.opt5,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summary(){
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(padding: EdgeInsets.only(top: 300),
          child: Column(
            children: <Widget>[
              Text("Result",style: TextStyle(fontSize: 30)),
              Text("Total = " + total.toString(),style: TextStyle(fontSize: 20),),
              RaisedButton(onPressed: (){},
                color: Colors.teal,
                child: Text("Done For Now",style: TextStyle(fontSize: 20,color: Colors.white),),)
            ],
          ),
        ),
      ),
    );
  }

}
