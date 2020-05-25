import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
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
Future<bool> _backPressed() async {
    print("code reached here quiz");
    return Future.value(false);
    // bool exit = false;
    // final snackBarpop = SnackBar(
    //               content: Text("All your saved progress will be lost"),
    //               duration: Duration(milliseconds: 800),
    //               action: SnackBarAction(
    //           label: 'Exit',
    //           onPressed: () {
    //             exit = true;
    //           },
    //         ),
    //             );
    //             //Scaffold.of(context).showSnackBar(snackBarpop);
    //             if(context==null)
    //             print("its null bro");
    //             if(exit==true)
    //             return Future.value(true);
    //             else
    //             return Future.value(false);

  }

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
  DateTime _dateTime,date;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, allowFontScaling: true);
    return WillPopScope(
      onWillPop: _backPressed,
          child: MaterialApp(
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
                if (index == 0) {
                  return Center(
                    child: SizedBox(
                      height: 650.h,
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 130.h,
                              child: Image(image: AssetImage('assets/gendercomf.png'))
                              ),
                          SizedBox(
                            height: 5.h,
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
                              color: Colors.pink[400],
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
                      height: 650.h,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image(image: AssetImage('assets/dob-info.png')),
                            height: 130.h,
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
                              //_controller.next();
                              showDatePicker(context: context,
                               initialDate: DateTime.now(),
                              firstDate: DateTime(1930), 
                              lastDate: DateTime(2021)).then((date){
                                    setState(() {
                                      _dateTime = date;
                                    });
                              });
                            },
                            child: Card(
                                elevation: 8,
                                color: Colors.blue,
                                child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  _dateTime==null? "Please enter Date of Birth":_dateTime.day.toString()+"/"+_dateTime.month.toString()+"/"+_dateTime.year.toString(),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                                //child: Text(_dateTime==null? "Please select a date":_dateTime.toString()),
                                /*TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'DOB',
                                    hintText: 'Date of Birth',
                                  ),
                                  autofocus: false,
                                )*/
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
                      height: 650.h,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image(image: AssetImage('assets/heart.png')),
                            height: 130.h,
                          ),
                          Text(
                            "\nDo you have any physical illness?\nIf yes, have you consulted a",
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
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.orange[300],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'Medical Doctor',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _controller.next();
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.orange[400],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'AYUSH doctor',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _controller.next();
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.amber[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'No physical illness',
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
                      height: 650.h,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image(image: AssetImage('assets/prevpsychhelp.png')),
                            height: 130.h,
                          ),
                          Text(
                            "\nHave you ever consulted a",
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
                          /*InkWell(
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
                          ),*/
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
                              color: Colors.blue[400],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'Psychiatrist',
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
                                answers[3] = 0;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dass21Page()));
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue,
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'Psychologist',
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
                                answers[3] = 0;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dass21Page()));
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[600],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'Counsellor',
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
                                answers[3] = 0;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dass21Page()));
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                title: Text(
                                  'None',
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
              //control: new SwiperControl(color: Colors.red,disableColor: Colors.blue[100]),
            ),
          ),
        ),
      ),
    );
  }
}
