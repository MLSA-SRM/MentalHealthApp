import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/SocioDemographic.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

List<String> answers = ["none", "none", "none"];
List<String> year = [
  "First Year",
  "Second Year",
  "Third Year",
  "Fourth Year",
  "Intern",
  "Faculty"
];
List<String> course = [
  "Engineering & Technology",
  "Medicine & Health Sciences",
  "Management",
  "Science & Humanities",
  "Dental",
  "Law",
  "Teacher Education and Research",
  "Hotel and Catering Management"
];
List<String> engdivision = [
  "Department of Aerospace Engineering",
  "Department of Architecture and Interior Design",
  "Department of Automobile Engineering",
  "Department of Biomedical Engineering",
  "Department of Biotechnology",
  "Department of Chemical Engineering",
  "Department of Chemistry",
  "Department of Civil Engineering",
  "Department of Computer Science Engineering",
  "Department of Electrical and Electronics",
  "Department of Electronics & Communication",
  "Department of Electronics & Instrumentation",
  "Department of English and Foreign Languages",
  "Department of Food Process Engineering",
  "Department of Genetic Engineering",
  "Department of Information Technology",
  "Department of Mathematics",
  "Department of Mechanical Engineering",
  "Department of Mechatronics",
  "Department of Nanotechnology",
  "Department of Nuclear Engineering",
  "Department of Physics",
  "Department of Software Engineering",
  "Department of Telecommunication",
];
List<String> meddivision = [
  "Anaesthesia",
  "Anatomy",
  "Audiology",
  "Biochemistry",
  "Cardio Vascular & Thoracic Surgery",
  "Cardiology",
  "Community Medicine",
  "Clinical Psychology",
  "Dermatology, Venerology and Leprosy",
  "General Medicine",
  "General Surgery",
  "MBBS",
  "Microbiology",
  "Nephrology",
  "Neurology",
  "Neurosurgery",
  "Nursing",
  "Obstetrics & Gynaecology",
  "Occupational Therapy",
  "Ophthalmology",
  "Optometry",
  "Orthopaedics",
  "Otorhinolaryngology",
  "Paediatric Surgery",
  "Paediatrics",
  "Pathology",
  "Pharmacology",
  "Pharmacy",
  "Physiology",
  "Physiotherapy",
  "Plastic & Reconstructive Surgery",
  "Psychiatry",
  "Public Health",
  "Radio Diagnosis",
  "Respiratory Medicine",
  "Urology"
];
List<String> mandivision = [
  "BBA",
  "MBA",
  "MMS In Banking and Financial Services",
  "Ph.D"
];
List<String> scidivision = [
  "Department of Bharatanatyam",
  "Department of Biotechnology",
  "Department of Career Development",
  "Department of Commerce",
  "Department of Computer Applications",
  "Department of Computer Science",
  "Department of Corporate Secretaryship and Accounting & Finance",
  "Department of Economics",
  "Department of English",
  "Department of Fashion Designing",
  "Department of French",
  "Department of Hindi",
  "Department of Journalism & Mass Communication",
  "Department of Mathematics and Statistics",
  "Department of Music",
  "Department of Public Relations",
  "Department of Physical Education",
  "Department of Tamil",
  "Department of Visual Communication"
];
List<String> dendivision = [
  "Conservative Dentistry and Endodontics",
  "Oral Diagnosis, Oral Medicine & Radiology",
  "Oral and Maxillofacial Pathology",
  "Oral and Maxillofacial Surgery",
  "Orthodontics and Dentofacial Orthopedics",
  "Pedodontics & Preventive Dentistry",
  "Periodontics",
  "Prosthodontics & Implantology",
  "Public Health Dentistry"
];
List<String> defdivision = ["-"];

List<bool> q1done = [false, false, false];
List<bool> q3done = [false, false, false, false];
List<bool> q4done = [false, false, false, false, false];
String currentyear = "First Year";
String currentcourse = "Engineering & Technology";
String currentdiveng = "Department of Automobile Engineering";
String currentdivmed = "Anaesthesia";
String currentdivman = "BBA";
String currentdivsci = "Department of Biotechnology";
String currentdivden = "Conservative Dentistry and Endodontics";
String currentdefault = "-";
String currentDivision = "Department of Automobile Engineering";
int rating = 18;
final snackBar = SnackBar(
  content: Text("Please complete the questionnaire"),
  duration: Duration(milliseconds: 800),
);

class QuizState extends State<Quiz> {
  SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return WillPopScope(
      onWillPop: _backPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: new Swiper(
              curve: Curves.easeInOutCubic,
              scrollDirection: Axis.vertical,
              loop: false,
              viewportFraction: 0.9,
              scale: 0.2,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: 400.h,
                            child: Image(
                                image: AssetImage('assets/gendercomf.png'))),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "I identify as a",
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(75, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              setState(() {
                                answers[0] = "Male";
                                q1done[0] = true;
                                q1done[1] = false;
                                q1done[2] = false;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue,
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q1done[0]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              setState(() {
                                answers[0] = "Female";
                                q1done[0] = false;
                                q1done[1] = true;
                                q1done[2] = false;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.pink[400],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q1done[1]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              setState(() {
                                answers[0] = "Others";
                                q1done[0] = false;
                                q1done[1] = false;
                                q1done[2] = true;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.purple,
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q1done[2]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Others',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (index == 1) {
                  return Center(
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        Container(
                          child:
                              Image(image: AssetImage('assets/dob-info.png')),
                          height: 400.h,
                        ),
                        Text(
                          "Please enter the following details.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(75, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Please select your age : $rating",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ScreenUtil()
                                    .setSp(50, allowFontScalingSelf: true),

                                //fontWeight: FontWeight.bold,

                                color: Colors.black),
                          ),
                        ),
                        Slider(
                          value: rating.toDouble(),
                          onChanged: (newRating) {
                            setState(() {
                              rating = newRating.toInt();
                            });
                          },
                          divisions: 53,
                          label: "$rating",
                          min: 18,
                          max: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: RaisedButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            disabledColor: Colors.orange,
                            color: Colors.orange,
                            child: DropdownButton<String>(
                                dropdownColor: Colors.orange,
                                iconEnabledColor: Colors.orange[800],
                                focusColor: Colors.orange,
                                iconSize: 30,
                                isExpanded: true,
                                elevation: 10,
                                value: currentyear,
                                hint: Text("Please select your year of study"),
                                items: year.map((String dropdownstringitem) {
                                  return DropdownMenuItem<String>(
                                    value: dropdownstringitem,
                                    child: Text(dropdownstringitem,
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(50,
                                                allowFontScalingSelf: true),
                                            color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    currentyear = newValueSelected;
                                    print(currentyear);
                                  });
                                }),
                          ),
                        ),
                        Visibility(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              disabledColor: Colors.orange,
                              color: Colors.orange,
                              child: DropdownButton<String>(
                                  dropdownColor: Colors.orange,
                                  iconEnabledColor: Colors.orange[800],
                                  focusColor: Colors.orange,
                                  iconSize: 30,
                                  isExpanded: true,
                                  elevation: 10,
                                  value: currentcourse,
                                  items:
                                      course.map((String dropdownstringitem0) {
                                    return DropdownMenuItem<String>(
                                      value: dropdownstringitem0,
                                      child: Text(dropdownstringitem0,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(40,
                                                  allowFontScalingSelf: true),
                                              color: Colors.white)),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      currentcourse = newValueSelected;
                                    });
                                  }),
                            ),
                          ),
                          visible: currentyear == "Faculty" ||
                                  currentyear == "Intern"
                              ? false
                              : true,
                        ),
                        Visibility(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              disabledColor: Colors.orange,
                              color: Colors.orange,
                              child: DropdownButton<String>(
                                  dropdownColor: Colors.orange,
                                  iconEnabledColor: Colors.orange[800],
                                  focusColor: Colors.orange,
                                  iconSize: 30,
                                  isExpanded: true,
                                  elevation: 10,
                                  value: currentcourse ==
                                          "Engineering & Technology"
                                      ? currentdiveng
                                      : currentcourse ==
                                              "Medicine & Health Sciences"
                                          ? currentdivmed
                                          : currentcourse == "Management"
                                              ? currentdivman
                                              : currentcourse ==
                                                      "Science & Humanities"
                                                  ? currentdivsci
                                                  : currentcourse == "Dental"
                                                      ? currentdivden
                                                      : currentdefault,
                                  items: currentcourse ==
                                          "Engineering & Technology"
                                      ? engdivision
                                          .map((String dropdownstringitem0) {
                                          return DropdownMenuItem<String>(
                                            value: dropdownstringitem0,
                                            child: Text(dropdownstringitem0,
                                                style: TextStyle(
                                                    fontSize: ScreenUtil().setSp(
                                                        40,
                                                        allowFontScalingSelf:
                                                            true),
                                                    color: Colors.white)),
                                          );
                                        }).toList()
                                      : currentcourse ==
                                              "Medicine & Health Sciences"
                                          ? meddivision.map(
                                              (String dropdownstringitem0) {
                                              return DropdownMenuItem<String>(
                                                value: dropdownstringitem0,
                                                child: Text(dropdownstringitem0,
                                                    style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(40,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        color: Colors.white)),
                                              );
                                            }).toList()
                                          : currentcourse == "Management"
                                              ? mandivision.map(
                                                  (String dropdownstringitem0) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: dropdownstringitem0,
                                                    child: Text(
                                                        dropdownstringitem0,
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(40,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color:
                                                                Colors.white)),
                                                  );
                                                }).toList()
                                              : currentcourse ==
                                                      "Science & Humanities"
                                                  ? scidivision.map((String
                                                      dropdownstringitem0) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value:
                                                            dropdownstringitem0,
                                                        child: Text(
                                                            dropdownstringitem0,
                                                            style: TextStyle(
                                                                fontSize: ScreenUtil()
                                                                    .setSp(40,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                                color: Colors
                                                                    .white)),
                                                      );
                                                    }).toList()
                                                  : currentcourse == "Dental"
                                                      ? dendivision.map((String
                                                          dropdownstringitem0) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value:
                                                                dropdownstringitem0,
                                                            child: Text(
                                                                dropdownstringitem0,
                                                                style: TextStyle(
                                                                    fontSize: ScreenUtil().setSp(
                                                                        40,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                                    color: Colors
                                                                        .white)),
                                                          );
                                                        }).toList()
                                                      : defdivision.map(
                                                          (String dropdownstringitem0) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value:
                                                                dropdownstringitem0,
                                                            child: Text(
                                                                dropdownstringitem0,
                                                                style: TextStyle(
                                                                    fontSize: ScreenUtil().setSp(
                                                                        40,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                                    color: Colors
                                                                        .white)),
                                                          );
                                                        }).toList(),
                                  onChanged: currentcourse == "Engineering & Technology"
                                      ? (String newValueSelected) {
                                          setState(() {
                                            currentdiveng = newValueSelected;
                                            currentDivision = newValueSelected;
                                          });
                                          _controller.next();
                                        }
                                      : currentcourse == "Medicine & Health Sciences"
                                          ? (String newValueSelected) {
                                              setState(() {
                                                currentdivmed =
                                                    newValueSelected;
                                                currentDivision =
                                                    newValueSelected;
                                              });
                                              _controller.next();
                                            }
                                          : currentcourse == "Management"
                                              ? (String newValueSelected) {
                                                  setState(() {
                                                    currentdivman =
                                                        newValueSelected;
                                                    currentDivision =
                                                        newValueSelected;
                                                  });
                                                  _controller.next();
                                                }
                                              : currentcourse == "Science & Humanities"
                                                  ? (String newValueSelected) {
                                                      setState(() {
                                                        currentdivsci =
                                                            newValueSelected;
                                                        currentDivision =
                                                            newValueSelected;
                                                      });
                                                      _controller.next();
                                                    }
                                                  : currentcourse == "Dental"
                                                      ? (String newValueSelected) {
                                                          setState(() {
                                                            currentdivden =
                                                                newValueSelected;
                                                            currentDivision =
                                                                newValueSelected;
                                                          });
                                                          _controller.next();
                                                        }
                                                      : (String newValueSelected) {
                                                          setState(() {
                                                            currentdefault =
                                                                newValueSelected;
                                                            currentDivision =
                                                                newValueSelected;
                                                          });
                                                          _controller.next();
                                                        }),
                            ),
                          ),
                          visible: currentyear == "Faculty" ||
                                  currentyear == "Intern"
                              ? false
                              : true,
                        )
                      ],
                    ),
                  );
                }
                if (index == 2) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(image: AssetImage('assets/heart.png')),
                          height: 400.h,
                        ),
                        Text(
                          "\nDo you have any physical illness?\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(65, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              answers[1] = "Medical Doctor";
                              setState(() {
                                q3done[0] = true;
                                q3done[1] = false;
                                q3done[2] = false;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.orange[300],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q3done[0]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Medical Doctor',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              answers[1] = "AYUSH doctor";
                              setState(() {
                                q3done[0] = false;
                                q3done[1] = true;
                                q3done[2] = false;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.orange[400],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q3done[1]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'AYUSH doctor',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              answers[1] =
                                  "Have physical illness but haven't consulted a doctor";
                              setState(() {
                                q3done[0] = false;
                                q3done[1] = false;
                                q3done[2] = true;
                                q3done[3] = false;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.amber[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q3done[2]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Have physical illness but haven\'t consulted a doctor',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              _controller.next();
                              answers[1] = "No physical illness";
                              setState(() {
                                q3done[0] = false;
                                q3done[1] = false;
                                q3done[2] = false;
                                q3done[3] = true;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.amber[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q3done[3]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'No physical illness',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (index == 3) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(
                              image: AssetImage('assets/prevpsychhelp.png')),
                          height: 400.h,
                        ),
                        Text(
                          "\nHave you ever consulted a",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(70, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                answers[2] = "Faith Healer";
                                q4done[0] = true;
                                q4done[1] = false;
                                q4done[2] = false;
                                q4done[3] = false;
                                q4done[4] = false;
                              });
                              if (answers[0] == "none" ||
                                  answers[1] == "none" ||
                                  answers[2] == "none" ||
                                  rating == null)
                                Scaffold.of(context).showSnackBar(snackBar);
                              else {
                                getAnswers();
                                await _pushToFirebase();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocioDemo()));
                              }
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[400],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q4done[0]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Faith Healer',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                answers[2] = "Counsellor";
                                q4done[0] = false;
                                q4done[1] = true;
                                q4done[2] = false;
                                q4done[3] = false;
                                q4done[4] = false;
                              });
                              if (answers[0] == "none" ||
                                  answers[1] == "none" ||
                                  answers[2] == "none" ||
                                  rating == null)
                                Scaffold.of(context).showSnackBar(snackBar);
                              else {
                                _pushToFirebase();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocioDemo()));
                              }
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue,
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q4done[1]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Counsellor',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                answers[2] = "Psychologist";
                                q4done[0] = false;
                                q4done[1] = false;
                                q4done[2] = true;
                                q4done[3] = false;
                                q4done[4] = false;
                              });
                              if (answers[0] == "none" ||
                                  answers[1] == "none" ||
                                  answers[2] == "none" ||
                                  rating == null)
                                Scaffold.of(context).showSnackBar(snackBar);
                              else {
                                _pushToFirebase();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocioDemo()));
                              }
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[600],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q4done[2]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Psychologist',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                answers[2] = "Psychiatrist";
                                q4done[0] = false;
                                q4done[1] = false;
                                q4done[2] = false;
                                q4done[3] = true;
                                q4done[4] = false;
                              });
                              if (answers[0] == "none" ||
                                  answers[1] == "none" ||
                                  answers[2] == "none" ||
                                  rating == null)
                                Scaffold.of(context).showSnackBar(snackBar);
                              else {
                                _pushToFirebase();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocioDemo()));
                              }
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q4done[3]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'Psychiatrist',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                answers[2] = "None";
                                q4done[0] = false;
                                q4done[1] = false;
                                q4done[2] = false;
                                q4done[3] = false;
                                q4done[4] = true;
                              });
                              if (answers[0] == "none" ||
                                  answers[1] == "none" ||
                                  answers[2] == "none" ||
                                  rating == null)
                                Scaffold.of(context).showSnackBar(snackBar);
                              else {
                                _pushToFirebase();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocioDemo()));
                              }
                            },
                            child: Card(
                              elevation: 8,
                              color: Colors.blue[700],
                              child: ListTile(
                                leading: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white),
                                trailing: q4done[4]
                                    ? Icon(
                                        Icons.spellcheck,
                                        color: Colors.white,
                                      )
                                    : null,
                                title: Text(
                                  'None',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60,
                                          allowFontScalingSelf: true),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else
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

void getAnswers() {
  print("answers[0]=${answers[0]}");
  print("rating=$rating");
  print("currentyear=$currentyear");
  print("currentcourse=$currentcourse");
  print("answers[1]=${answers[1]}");
  print("answers[2]=${answers[2]}");
  final Map<String, String> someMap = {};

  someMap["Q10"] = DateTime.now().toString();
  someMap["Q11"] = answers[0];
  someMap["Q12"] = rating.toString();
  someMap["Q13"] = currentyear;
  someMap["Q14"] = answers[1];
  someMap["Q15"] = answers[2];

  someMap.forEach((key, value) {
    print(key + "=>" + value);
  });
}

Future _pushToFirebase() async {
  print("answers[0]=${answers[0]}");
  print("rating=$rating");
  print("currentyear=$currentyear");
  print("currentcourse=$currentcourse");
  print("answers[1]=${answers[1]}");
  print("answers[2]=${answers[2]}");
  final Map<String, String> someMap = {};
  print('map for demographic created');

  someMap["Q10"] = DateTime.now().toString();
  someMap["Q11"] = answers[0]; //gender
  someMap["Q12"] = rating.toString();

  ///age
  someMap["Q13"] = currentyear; //year of study
  someMap["Q14"] = currentcourse; //Engg, BBA,Pharma etc.
  someMap["Q15"] = currentDivision; //CSE,SWE and all
  someMap["Q16"] = answers[1]; //has conducted if physical illness
  someMap["Q17"] = answers[2]; //has consulted a
  print('done');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String pushId = prefs.getString('key');
  FirebaseDatabase.instance
      .reference()
      .child("Responses")
      .child(pushId)
      .child("demographic")
      .set(someMap);
}
