import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/DASS21_Page.dart';

import 'Showup.dart';
import 'questionaire.dart';

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

class Quiz extends StatefulWidget {
  Quiz({Key key, this.title}) : super(key: key);

  final String title;

  @override
  QuizState createState() => new QuizState();
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Quiz(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizState extends State<Quiz> {
  SwiperController _controller = SwiperController();
  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Swiper(
            curve: Curves.easeInOutCubic,
            scrollDirection: Axis.vertical,
            loop: false,
            viewportFraction: 0.7,
            scale: 0.2,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              //return Image(image: AssetImage('assets/google-developers-logo.png'));
              if (index == 0) {
                return Center(
                  child: SizedBox(
                    //height: 800,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: 130,
                            child: Image(image: AssetImage('assets/gendercomf.png'))
                            ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "I identify as a",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 18, color: Colors.black),
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
                            color: Colors.blue,
                            child: ListTile(
                              leading: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white),
                              title: Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
                            color: Colors.pink,
                            child: ListTile(
                              leading: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white),
                              title: Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Others',
                                  hintText: 'Please Specify',
                                ),
                                autofocus: false,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (index == 1) {
                return Center(
                  child: SizedBox(
                    //height: 800,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(image: AssetImage('assets/dob-info.png')),
                          height: 130,
                        ),
                        Text(
                          "Please enter the following details.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'DOB',
                                  hintText: 'Date of Birth',
                                ),
                                autofocus: false,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Course',
                                  hintText: 'Course',
                                ),
                                autofocus: false,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Year',
                                  hintText: 'Year',
                                ),
                                autofocus: false,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (index == 2) {
                return Center(
                  child: SizedBox(
                    //height: 10,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(image: AssetImage('assets/previosmedical.png')),
                          height: 130,
                        ),
                        Text(
                          "\nAny previous medical history? If yes, please specify.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Yes',
                                  hintText: 'Please Specify',
                                ),
                                autofocus: false,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 0;
                            });
                          },
                          child: Card(
                            elevation: 8,
                            color: Color(0xffDB4437),
                            child: ListTile(
                              leading: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white),
                              title: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } 
              if (index == 3) {
                return Center(
                  child: SizedBox(
                    //height: 10,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(image: AssetImage('assets/prevpsychhelp.png')),
                          height: 130,
                        ),
                        Text(
                          "\nAny previous psychiatric consultation? If yes, please specify.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 1;
                            });
                          },
                          child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Yes',
                                  hintText: 'Please Specify',
                                ),
                                autofocus: false,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.next();
                            setState(() {
                              answers[3] = 0;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dass21Page()));
                          },
                          child: Card(
                            elevation: 8,
                            color: Color(0xffDB4437),
                            child: ListTile(
                              leading: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white),
                              title: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } 
              else
                return null;
            },
            itemCount: 4,
            pagination: new SwiperPagination(
                alignment: Alignment.topRight,
                builder: SwiperPagination.fraction,
                margin: EdgeInsets.all(40)),
            //control: new SwiperControl(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
