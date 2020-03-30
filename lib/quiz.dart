import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

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
        body: new Swiper(
          curve: Curves.easeInOut,
          scrollDirection: Axis.vertical,
          loop: false,
          viewportFraction: 0.9,
          scale: 0.8,
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
                          child: Image(image: AssetImage('assets/news.png'))),
                      Text(
                        "I am\n",
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
                          color: Color(0xff4285F4),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A School Student',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                          color: Color(0xffDB4437),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A College Student',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.next();
                          setState(() {
                            answers[1] = 1;
                          });
                        },
                        child: Card(
                          elevation: 8,
                          color: Color(0xffF4B400),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Working',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                          elevation: 20,
                          color: Color(0xff0F9D58),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Self Employed',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
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
                  //height: 800,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image(image: AssetImage('assets/question.png')),
                        height: 300,
                      ),
                      Text(
                        "I have been feeling low lately\n",
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
                          color: Color(0xffDB4437),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Yes',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                        },
                        child: Card(
                          elevation: 8,
                          color: Color(0xffF4B400),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'No',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
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
                  //height: 800,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image(image: AssetImage('assets/who.png')),
                        height: 300,
                      ),
                      Text(
                        "When were you with your family last",
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
                            answers[5] = 0;
                          });
                        },
                        child: Card(
                          elevation: 8,
                          color: Color(0xff4285F4),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A Week Ago',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.next();
                          setState(() {
                            answers[5] = 0;
                          });
                        },
                        child: Card(
                          elevation: 8,
                          color: Color(0xffDB4437),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Been a month',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.next();
                          setState(() {
                            answers[5] = 1;
                          });
                        },
                        child: Card(
                          elevation: 8,
                          color: Color(0xffF4B400),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'I am with them',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.next();
                          setState(() {
                            answers[5] = 0;
                          });
                        },
                        child: Card(
                          elevation: 20,
                          color: Color(0xff0F9D58),
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A month or more',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
          itemCount: 3,
          pagination: new SwiperPagination(alignment: Alignment.topRight, builder: SwiperPagination.fraction,margin: EdgeInsets.all(40)),
          control: new SwiperControl(color: Colors.red),
        ),
      ),
    );
  }
}
