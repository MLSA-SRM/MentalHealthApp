import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/question.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'Showup.dart';


class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  SwiperController _controller = SwiperController();
  List<Question> SDRS_Questions = [Question(),Question(),Question(),Question(),Question()];
  List<Color> randomizecolor = [Colors.blue,Colors.green,Colors.red,Colors.purple,Colors.pink,Colors.orange];
  List<Color> randomizecolorlight = [Colors.blue[100],Colors.green[100],Colors.red[100],Colors.purple[100],Colors.pink[100],Colors.orange[100]];

  int total=0;

  @override
  void initState() {
    super.initState();
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
        scale: 0.8,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
            if(index<5){
              return page(index);
            }
            else return null;
        },
      ),
    );
  }

  Widget page(int index) {
    return Center(
      child: SizedBox(
        //height: 800,
        child: Column(
          children: <Widget>[
            ShowUp(
              delay : 500,
                          child: Container(
                  child: Image(
                    image: AssetImage('assets/gendercomf.png'),
                    height: 250,
                  )),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Text",
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
              },
              child: Card(
                elevation: 8,
                color: Colors.blue,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    "Text",
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
            totalSteps: 5,
            height: 10,
            currentStep: index,
            selectedColor: randomizecolor[index%6],
            unselectedColor: randomizecolorlight[index%6],
            customStep: (index,color){
              return Icon(
                    Icons.check_box_outline_blank,
                    color: color,
                    size: 15,
                  );
            },
            onTap: (index) {
              return () {
                  _controller.move(index);
                  //print('$index step pressed');
              };}
          ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
