import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:language_pickers/language_pickers.dart';
import 'package:language_pickers/languages.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/Showup.dart';
import 'package:mental_health_app/dass21_intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocioDemo extends StatefulWidget {
  @override
  _SocioDemoState createState() => _SocioDemoState();
}

class _SocioDemoState extends State<SocioDemo> {
  SwiperController _controller = SwiperController();
  bool langClicked = false;
  List<String> langprof = [
    "Elementary Proficiency",
    "Limited Working Proficiency",
    "Professional Working Proficiency",
    "Full Professional Proficiency",
    "Native or Bilingual Proficiency"
  ];
  String langProfValue = "Elementary Proficiency";

  List<String> states = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra & Nagar Haveli and Daman & Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep Islands",
    'Madhya Pradesh',
    "Maharashtra",
    'Manipur',
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Others"
  ];

  List<String> languages = [
"Assamese",
"Bengali",
"Bodo",
"Dogri",
"Gujarati",
"Hindi",
"Kannada",
"Kashmiri",
"Konkani",
"Maithili",
"Malayalam",
"Manipuri",
"Marathi",
"Nepali",
"Odia",
"Punjabi",
"Sanskrit",
"Santhali",
"Sindhi",
"Tamil",
"Telugu",
"Urdu"
  ];

  String _selectedDialogLanguage = "Tamil";
  // LanguagePickerUtils.getLanguageByIsoCode('ml');

  String stateChosen = "Tamil Nadu";

  List<String> living = [
    "Day Scholar with Family",
    "Hostel",
    "Paying Guest",
    "Rented accommodation with friends"
  ];
  String livingChosen = "Hostel";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
        itemCount: 4,
        curve: Curves.easeInOutCubic,
        scrollDirection: Axis.horizontal,
        loop: false,
        viewportFraction: 1,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShowUp(
                    delay: 300,
                    child: Container(
                        child: Image(
                      image: AssetImage("assets/sociodemo_1.png"),
                      height: MediaQuery.of(context).size.height / 8,
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Center(
                    child: Text("What is your mother tongue?",
                        style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(65, allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: DropdownButton<String>(
                        //decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: Colors.orange,
                        iconEnabledColor: Colors.orange[800],
                        focusColor: Colors.orange,
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 10,
                        value: _selectedDialogLanguage.toString(),
                        items: languages.map((String dropdownstringitem) {
                          return DropdownMenuItem<String>(
                            value: dropdownstringitem,
                            child: Text(dropdownstringitem,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(50, allowFontScalingSelf: true),
                                    color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            _selectedDialogLanguage = newValueSelected;
                            print(_selectedDialogLanguage);
                            _controller.next();
                          });
                        }),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.orange,
                  //   ),
                  //   child:
                  //       //  ListTile(
                  //       //   // leading: Icon(Icons.language),
                  //       //   title:
                  //       Expanded(
                  //     child: LanguagePickerDropdown(
                  //       initialValue: 'ml',
                  //       itemBuilder: (language) => Container(
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Icon(
                  //               Icons.translate,
                  //               color: Colors.black,
                  //             ),
                  //             SizedBox(width: 7),
                  //             Text("${language.name} (${language.isoCode})",
                  //                 style: TextStyle(color: Colors.black)),
                  //           ],
                  //         ),
                  //       ),
                  //       onValuePicked: (Language language) {
                  //         _selectedDialogLanguage = language;
                  //         print(_selectedDialogLanguage.name);
                  //         print(_selectedDialogLanguage.isoCode);
                  //         _controller.next();
                  //       },
                  //     ),
                  //   ),
                  //   // ),
                  // ),
                ],
              ),
            );
          } else if (index == 1) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShowUp(
                    delay: 300,
                    child: Container(
                        child: Image(
                      image: AssetImage("assets/sociodemo_2.png"),
                      height: MediaQuery.of(context).size.height / 8,
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Text("How familiar are you with the local language?",
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(65, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: DropdownButton<String>(
                        //decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: Colors.orange,
                        iconEnabledColor: Colors.orange[800],
                        focusColor: Colors.orange,
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 10,
                        value: langProfValue.toString(),
                        items: langprof.map((String dropdownstringitem) {
                          return DropdownMenuItem<String>(
                            value: dropdownstringitem,
                            child: Text(dropdownstringitem,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(50, allowFontScalingSelf: true),
                                    color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            langProfValue = newValueSelected;
                            print(langProfValue);
                            _controller.next();
                          });
                        }),
                  ),
                ],
              ),
            );
          } else if (index == 2) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShowUp(
                    delay: 300,
                    child: Container(
                        child: Image(
                      image: AssetImage("assets/sociodemo_3.png"),
                      height: MediaQuery.of(context).size.height / 8,
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Text("Where is your Hometown?",
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(65, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: DropdownButton<String>(
                        //decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: Colors.orange,
                        iconEnabledColor: Colors.orange[800],
                        focusColor: Colors.orange,
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 10,
                        value: stateChosen,
                        items: states.map((String dropdownstringitem) {
                          return DropdownMenuItem<String>(
                            value: dropdownstringitem,
                            child: Text(dropdownstringitem,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(50, allowFontScalingSelf: true),
                                    color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            stateChosen = newValueSelected;
                            _controller.next();
                          });
                        }),
                  ),
                ],
              ),
            );
          } else if (index == 3) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShowUp(
                    delay: 300,
                    child: Container(
                        child: Image(
                      image: AssetImage("assets/sociodemo_4.png"),
                      height: MediaQuery.of(context).size.height / 8,
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Text(
                      "What is your living arrangement here in the university?",
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(65, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: DropdownButton<String>(
                        //decoration: InputDecoration(border: InputBorder.none),
                        dropdownColor: Colors.orange,
                        iconEnabledColor: Colors.orange[800],
                        focusColor: Colors.orange,
                        iconSize: 30,
                        isExpanded: true,
                        elevation: 10,
                        value: livingChosen,
                        items: living.map((String dropdownstringitem) {
                          return DropdownMenuItem<String>(
                            value: dropdownstringitem,
                            child: Text(dropdownstringitem,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(50, allowFontScalingSelf: true),
                                    color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          livingChosen = newValueSelected;
                          print(livingChosen);
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  ShowUp(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width / 2,
                      child: RaisedButton(
                        //    elevation: 10,
                        onPressed: () async {
                          if (livingChosen != null &&
                              stateChosen != null &&
                              langProfValue != null &&
                              _selectedDialogLanguage != null) {
                            await _pushToFirebase(
                                livingChosen: livingChosen,
                                stateChosen: stateChosen,
                                langProfValue: langProfValue,
                                selectedDialogLanguageName:
                                    _selectedDialogLanguage);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dass21Intro()));
                          } else {
                            final snackBar = SnackBar(
                              content:
                                  Text("Please complete the questionnaire"),
                              duration: Duration(milliseconds: 800),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        textColor: Colors.white,
                        color: Colors.orange,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Proceed",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 23),
                        ),
                      ),
                    ),
                    delay: 1400,
                  ),
                ],
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}

Future _pushToFirebase(
    {String livingChosen,
    String stateChosen,
    String langProfValue,
    String selectedDialogLanguageName}) async {
  print(livingChosen);
  print(stateChosen);
  print(langProfValue);
  print(selectedDialogLanguageName);
  final Map<String, String> someMap = {};
  print('map for socioDemographic created');

  someMap["Q10"] = DateTime.now().toString();
  someMap["Q11"] = livingChosen;
  someMap["Q12"] = stateChosen.toString();
  someMap["Q13"] = langProfValue;
  someMap["Q14"] = selectedDialogLanguageName;
  print('done');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String pushId = prefs.getString('key');
  FirebaseDatabase.instance
      .reference()
      .child("Responses")
      .child(pushId)
      .child("socioDemographic")
      .set(someMap);
}

Widget _buildDropdownItem(Language language) {
  return Container(
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    ),
  );
}
