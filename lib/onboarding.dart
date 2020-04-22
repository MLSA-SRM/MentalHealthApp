import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/question.dart';
import 'package:mental_health_app/quiz.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:link/link.dart';
import 'Showup.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  SwiperController _controller = SwiperController();
  List<Question> SDRS_Questions = [
    Question(),
    Question(),
    Question(),
    Question(),
    Question()
  ];
  List<Color> randomizecolor = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.orange
  ];
  List<Color> randomizecolorlight = [
    Colors.blue[100],
    Colors.red[100],
    Colors.green[100],
    Colors.purple[100],
    Colors.pink[100],
    Colors.orange[100]
  ];

  int total = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
        itemCount: 3,
        curve: Curves.easeInOutCubic,
        scrollDirection: Axis.horizontal,
        loop: false,
        viewportFraction: 0.95,
        scale: 0.8,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Center(
              child: SizedBox(
                //height: MediaQuery.of(context).size.height*10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    ShowUp(
                      delay: 500,
                      child: Container(
                          child: Image(
                        image: AssetImage('assets/Onboarding1.png'),
                        height: 250,
                      )),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Developed by Professionals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "This app has been developed by Mental health Professionals and is based on Scientific evidence and research. There is a team of eminent mental health professionals in the University who is available to help you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        _controller.next();
                      },
                      child: Card(
                        elevation: 8,
                        color: randomizecolor[index % 6],
                        child: ListTile(
                          //leading: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                          title: Text(
                            "Swipe anywhere or Tap here to Navigate",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: StepProgressIndicator(
                          totalSteps: 3,
                          height: 10,
                          currentStep: index + 1,
                          selectedColor: randomizecolor[index % 6],
                          unselectedColor: randomizecolorlight[index % 6],
                          customStep: (index, color) {
                            return Icon(
                              Icons.check_box_outline_blank,
                              color: color,
                              size: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (index == 1) {
            return Center(
              child: SizedBox(
                //height: MediaQuery.of(context).size.height*10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    ShowUp(
                      delay: 500,
                      child: Container(
                          child: Image(
                        image: AssetImage('assets/Onboarding2.png'),
                        height: 250,
                      )),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "It's OK to ask for help",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Going out and asking for help is a good thing; don’t let others tell you otherwise. If you can’t seem to get help then you might be looking in the wrong place. Let professionals lend you a hand.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        _controller.next();
                      },
                      child: Card(
                        elevation: 8,
                        color: randomizecolor[index % 6],
                        child: ListTile(
                          leading: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                          title: Text(
                            "I understand",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: StepProgressIndicator(
                          totalSteps: 3,
                          height: 10,
                          currentStep: index + 1,
                          selectedColor: randomizecolor[index % 6],
                          unselectedColor: randomizecolorlight[index % 6],
                          customStep: (index, color) {
                            return Icon(
                              Icons.check_box_outline_blank,
                              color: color,
                              size: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (index == 2) {
            return Center(
              child: SizedBox(
                //height: MediaQuery.of(context).size.height*10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    ShowUp(
                      delay: 500,
                      child: Container(
                          child: Image(
                        image: AssetImage('assets/Onboarding3.png'),
                        height: 250,
                      )),
                    ),
                    //SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Disclaimer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "This is not an alternative to seeking professional help for any acute mental health condition, If you’re currently feeling extremely anxious, suicidal or depressed kindly visit the Emergency of SRM Medical College & Hospital help will be provided to you promptly for the same. Please go through the Consent form below \n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Link(
                        child: Text(
                        "Consent Form",
                         textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue[700]),
                      ),
                        url: 'https://athensdazzle.wixsite.com/mysite',
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        //_controller.next();
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                      },
                      child: Card(
                        elevation: 8,
                        color: randomizecolor[index % 6],
                        child: ListTile(
                          trailing: Icon(Icons.done, color: Colors.white),
                          title: Text(
                            "I have read the form and I give Consent",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: StepProgressIndicator(
                          totalSteps: 3,
                          height: 10,
                          currentStep: index + 1,
                          selectedColor: randomizecolor[index % 6],
                          unselectedColor: randomizecolorlight[index % 6],
                          customStep: (index, color) {
                            return Icon(
                              Icons.check_box_outline_blank,
                              color: color,
                              size: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
