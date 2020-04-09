import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/question.dart';

import 'Showup.dart';

//void main() => runApp(new MyApp());

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Quiz(),
    );
  }
}*/

class QuizTest extends StatefulWidget {
  QuizTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  QuizTestState createState() => new QuizTestState();
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: QuizTest(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizTestState extends State<QuizTest> {
  String session;

  SwiperController _controller = SwiperController();
  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1];
  List<String> userDeets = List<String>();
  List<String> demographicQuestions = [
    "Enter your Gender",
    "Enter your DOB",
    "Enter your Branch and Year",
    "Any previous Psychiatric consultation? If yes, What?",
    "Any known Medical Conditions? If yes, What?"
  ];
  List<String> demographicImages = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Gender_symbols_side_by_side_solid.svg/1200px-Gender_symbols_side_by_side_solid.svg.png",
    "https://www.pngkey.com/png/full/194-1942977_celebrate-your-birthday-with-bodyfactory-convenient-location-icon.png",
    "https://static.vecteezy.com/system/resources/previews/000/511/962/non_2x/vector-student-glyph-black-icon.jpg",
    "https://media-exp1.licdn.com/dms/image/C4D1BAQG7r0WmbuCpWg/company-background_10000/0?e=2159024400&v=beta&t=MG2Val9hsa_eX0HcYmch0WN-yjaDoduniTHTb_nSN38",
    "https://cdn.pixabay.com/photo/2017/03/02/09/26/question-mark-2110767_960_720.jpg"
  ];

  List<Question> SDRS_Questions = [
    Question(),
    Question(),
    Question(),
    Question(),
    Question()
  ];

  _getQuestions() {
    SDRS_Questions[0]
        .getQues("I found it hard to wind down\n", 'assets/hardtowinddown.png');
    SDRS_Questions[1].getQues(
        "I was aware of dryness of my mouth\n", 'assets/mouthdryness.png');
    SDRS_Questions[2].getQues(
        "I couldn’t seem to experience any positive feeling at all \n",
        'assets/no positive feeling.png');
    SDRS_Questions[3].getQues("I experienced breathing difficulty\n",
        'assets/breathingdifficulty.png');
    SDRS_Questions[4].getQues(
        "I found it difficult to work up the initiative to do things\n",
        'assets/difficultinitiative.png');
    for (int i = 0; i < 5; i++) {
      SDRS_Questions[i].getOptions(
          'Did not apply to me at all',
          'Applied to me to some degree',
          'Applied to me to a considerable degree',
          'Applied to me very much');
      SDRS_Questions[i]
          .getColor(Colors.blue, Colors.yellow, Colors.red, Colors.green);
    }
  }

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: new Swiper(
          //TODO: onIndexChanged:
          curve: Curves.easeInOut,
          scrollDirection: Axis.vertical,
          loop: false,
          viewportFraction: 0.9,
          scale: 0.8,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            //return Image(image: AssetImage('assets/google-developers-logo.png'));
            if (index == 0) {
              return page(SDRS_Questions[index]);
            } else if (index == 1) {
              return page(SDRS_Questions[index]);
            } else if (index == 2) {
              return page(SDRS_Questions[index]);
            } else if (index == 3) {
              return page(SDRS_Questions[index]);
            } else if (index == 4) {
              return page(SDRS_Questions[index]);
            } else
              return null;
          },
          itemCount: 5,
//          pagination: new SwiperPagination(
//              alignment: Alignment.topRight,
//              builder: SwiperPagination.fraction,
//              margin: EdgeInsets.all(40)),
          control: new SwiperControl(color: Colors.red),
        ),
      ),
    );
  }

  Widget page(Question question) {
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
                setState(() {
                  answers[1] = 0;
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
                setState(() {
                  answers[1] = 0;
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
                setState(() {
                  answers[1] = 0;
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
                setState(() {
                  answers[1] = 0;
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
          ],
        ),
      ),
    );
  }
}
