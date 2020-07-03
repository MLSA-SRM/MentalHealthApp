import 'package:flutter/material.dart';
import 'package:mental_health_app/DASS21_Page.dart';

import 'Showup.dart';

class Dass21Intro extends StatelessWidget {
  const Dass21Intro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = 18;
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        child: ListView(children: [
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ShowUp(
                  delay: 400,
                  child: Container(
                      child: Image(
                    image: AssetImage('assets/dass-timer.png'),
                    height: MediaQuery.of(context).size.height / 5,
                  )),
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height / 10,
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Text(
                  "Kudos on taking a step towards improving your mental health!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                // TextPortion(
                //   nextPage: nextPage,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),

                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "Before you start answering the Questions, Read each statement and select based on ",
                        style:
                            TextStyle(color: Colors.black, fontSize: textSize)),
                    TextSpan(
                        text:
                            "how much the statement applied to you over the past week.",
                        style:
                            TextStyle(color: Colors.red, fontSize: textSize)),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Note: There are no right or wrong answers. So, do not spend too much time on any Question. Answer the Questions honestly, it will help us ascertain if you’re stressed and are unable to cope with your anxious and depressive thoughts.",
                    style: TextStyle(color: Colors.black, fontSize: textSize)),
                SizedBox(
                  height: 20,
                ),
                ShowUp(
                  child: Container(
                    height: _height / 17,
                    width: _width / 2,
                    child: RaisedButton(
                      //elevation: 10,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dass21Page()));
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
                        "NEXT",
                        style: TextStyle(fontSize: _width / 23),
                      ),
                    ),
                  ),
                  delay: 1100,
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
