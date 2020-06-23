import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/BACE_Page.dart';
import 'package:mental_health_app/GAD7_Page.dart';
import 'package:mental_health_app/PHQ9_Page.dart';
import 'package:mental_health_app/ResultPage.dart';
import 'package:mental_health_app/SDRS_Page.dart';
import 'package:mental_health_app/Showup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerPage extends StatefulWidget {
  String nextPage;
  bool hasBth;
  TimerPage(this.nextPage,this.hasBth);
  @override
  _TimerPageState createState() => _TimerPageState(nextPage,hasBth);
}

class _TimerPageState extends State<TimerPage> {
  bool hasBoth;
  String nextPage;
  _TimerPageState(this.nextPage,this.hasBoth);


  Future<List<int>> getImageData() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dummy1 = prefs.get('currentPage');
    int cp = int.parse(dummy1);
    String dummy2 = prefs.get('totalPages');
    int tp = int.parse(dummy2);
    List<int> pages = List<int>(2);
    pages[0] = cp;
    pages[1] = tp;
    return pages;
  }


  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getImageData(),
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return CircularProgressIndicator();
          }
          else
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ShowUp(
                  delay: 400,
                  child: Container(
                      child: Image(
                        image: AssetImage('assets/timer_${snapshot.data[0]}-${snapshot.data[1]}.png'),
                        height: MediaQuery.of(context).size.height/5,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                ),
                Text( snapshot.data[0] != snapshot.data[1] ?
                  "${snapshot.data[0]} down ${snapshot.data[1] - snapshot.data[0]} more to go!"
                  :"You have Completed all the quizzes, Click the below button to view your result!",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width/20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
                ),
                ShowUp(
                  child: Container(
                    height: _height/17,
                    width: _width/2,
                    child: RaisedButton(
                      //elevation: 10,
                      onPressed: () {
                        if(nextPage == "GAD7"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>GAD7Page(hasBoth)));
                        }
                        else if(nextPage == "PHQ9"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PHQ9Page()));
                        }
                        else if(nextPage == "BACE"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BACEPage()));
                        }
                        else if(nextPage == "SDRS"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SDRSPage()));
                        }
                        else if(nextPage == "Result"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage()));
                        }
                        else{

                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      textColor: Colors.white,
                      color: Colors.teal,
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "NEXT!",
                        style: TextStyle(fontSize: _width/23),
                      ),
                    ),
                  ),
                  delay: 1100,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
