import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'Showup.dart';
import 'questionnaire2.dart';

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
      home: new Questionaire(),
    );
  }
}*/

class Questionaire3 extends StatefulWidget {
  Questionaire3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Questionaire3State createState() => new Questionaire3State();
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Questionaire3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Questionaire3State extends State<Questionaire3> {
  SwiperController _controller = SwiperController();
  List<int> answers = [-1, -1, -1, -1, -1, -1, -1, -1];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: new Swiper(
          curve: Curves.easeInOutCubic,
          scrollDirection: Axis.horizontal,
          loop: false,
          viewportFraction: 0.95,
          scale: 0.5,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {




            if (index == 0) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/hardtowinddown.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "Being unsure where to go to get  professional care\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
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
                              'Not at all',
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
                          color: Colors.blue[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A little',
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
                          color: Colors.blue[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Quite a lot',
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
                          color: Colors.blue[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A lot',
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




            else if (index == 1) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mouthdryness.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "Wanting to solve the problem on my own \n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
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
                          color: Colors.yellow[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Not at all',
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
                          color: Colors.yellow[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A little',
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
                          color: Colors.yellow[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Quite a lot',
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
                          color: Colors.yellow[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A lot',
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




            else if (index == 2) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/no positive feeling.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "Concern that I might be seen as weak for having a mental health problem\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
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
                          color: Colors.green,
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Not at all',
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
                          color: Colors.green[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A little',
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
                          color: Colors.green[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Quite a lot',
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
                          color: Colors.green[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A lot',
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




            else if (index == 3) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/breathingdifficulty.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "Fear of being put in hospital against my will\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
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
                          color: Colors.red,
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Not at all',
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
                          color: Colors.red[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A little',
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
                          color: Colors.red[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Quite a lot',
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
                          color: Colors.red[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A lot',
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




            else if (index == 4) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/difficultinitiative.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "Concern that it might harm my chances when applying for jobs\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
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
                          color: Colors.purple,
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Not at all',
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
                          color: Colors.purple[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A little',
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
                          color: Colors.purple[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Quite a lot',
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
                          color: Colors.purple[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'A lot',
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
          itemCount: 5,
          pagination: new SwiperPagination(alignment: Alignment.topRight, builder: SwiperPagination.fraction,margin: EdgeInsets.all(40)),
          //control: new SwiperControl(color: Colors.red),
        ),
      ),
    );
  }
}
