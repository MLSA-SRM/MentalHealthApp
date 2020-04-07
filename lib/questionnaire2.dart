import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/questionnaire3.dart';

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
      home: new Questionaire(),
    );
  }
}*/

class Questionaire2 extends StatefulWidget {
  Questionaire2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Questionaire2State createState() => new Questionaire2State();
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Questionaire2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Questionaire2State extends State<Questionaire2> {
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
          scrollDirection: Axis.vertical,
          loop: false,
          viewportFraction: 0.8,
          scale: 0.5,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            //return Image(image: AssetImage('assets/google-developers-logo.png'));




            if (index == 0) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mf.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "I am always courteous even to people who are disagreeable.\n",
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
                          color: Colors.orange,
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely True',
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
                          color: Colors.orange[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Mostly True',
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
                          color: Colors.orange[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Don\'t Know',
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
                          color: Colors.orange[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Mostly False',
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
                          color: Colors.orange[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely False',
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
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mf.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "There have been occasions when I took advantage of someone.\n",
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
                              'Definitely True',
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
                              'Mostly True',
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
                              'Don\'t Know',
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
                              'Mostly False',
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
                          color: Colors.blue[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely False',
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
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mf.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "I sometimes try to get even rather than forgive and forget.\n",
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
                              'Definitely True',
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
                              'Mostly True',
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
                              'Don\'t Know',
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
                              'Mostly False',
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
                          color: Colors.green[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely False',
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





            if (index == 3) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mf.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "I sometimes feel resentful when I don’t get my way\n",
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
                              'Definitely True',
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
                              'Mostly True',
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
                              'Don\'t Know',
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
                              'Mostly False',
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
                          color: Colors.orange[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely False',
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





            if (index == 4) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          //child: Image(image: AssetImage('assets/mf.png'))
                          ),
                          SizedBox(height: 10,),
                      Text(
                        "No matter who I’m talking to, I’m always a good listener. \n",
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
                          color: Colors.pink[600],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely True',
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
                          color: Colors.pink[700],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Mostly True',
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
                          color: Colors.pink[800],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Don\'t Know',
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
                          color: Colors.pink[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Mostly False',
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

                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Questionaire3()));
                          });
                        },
                        child: Card(
                          elevation: 8,
                          color: Colors.pink[900],
                          child: ListTile(
                            leading: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            title: Text(
                              'Definitely False',
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
