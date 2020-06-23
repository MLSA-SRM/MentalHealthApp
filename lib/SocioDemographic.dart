import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:language_pickers/language_pickers.dart';
import 'package:language_pickers/languages.dart';
import 'package:mental_health_app/DASS21_Page.dart';
import 'package:mental_health_app/Showup.dart';

class SocioDemo extends StatefulWidget {
  @override
  _SocioDemoState createState() => _SocioDemoState();
}

class _SocioDemoState extends State<SocioDemo> {

  SwiperController _controller = SwiperController();
  bool langClicked = false;

  @override
  Widget build(BuildContext context) {


    List<String> langprof = ["Elementary Proficiency","Limited Working Proficiency","Professional Working Proficiency",
                            "Full Professional Proficiency", "Native or Bilingual Proficiency"];
    String langProfValue = "Elementary Proficiency";

    List<String> states = ["Andhra Pradesh", "Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh",
    "Jharkhand","Karnataka","Kerala",'Madhya Pradesh', "Maharashtra",'Manipur',"Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan",
    "Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar Islands","Chandigarh",
    "Dadra & Nagar Haveli and Daman & Diu","Delhi","Jammu and Kashmir","Lakshadweep","Puducherry","Ladakh","Other"];

    String stateChosen = "Tamil Nadu";

    List<String> living = ["Day Scholar with Family","Hostel","Paying Guest","rented accommodation with friends"];
    String livingChosen = "Hostel";

    ScreenUtil.init(context,
        allowFontScaling: true);
    Language _selectedDialogLanguage =
    LanguagePickerUtils.getLanguageByIsoCode('ml');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
          itemCount: 4,
        curve: Curves.easeInOutCubic,
        scrollDirection:Axis.horizontal,
        loop: false,
        viewportFraction: 1,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context,int index){
            if(index == 0){
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShowUp(
                      delay: 300,
                      child: Container(
                          child: Image(
                            image: AssetImage("assets/sociodemo_1.png"),
                            height: MediaQuery.of(context).size.height/8,
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10),
                    Text("What is your mother tongue?",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(65,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.language),
                          title: LanguagePickerDropdown(
                            initialValue: 'ml',
                            itemBuilder: _buildDropdownItem,
                            onValuePicked: (Language language) {
                              _selectedDialogLanguage = language;
                              print(_selectedDialogLanguage.name);
                              print(_selectedDialogLanguage.isoCode);
                            },
                          )
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }
            else if(index == 1){
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShowUp(
                      delay: 300,
                      child: Container(
                          child: Image(
                            image: AssetImage("assets/sociodemo_2.png"),
                            height: MediaQuery.of(context).size.height/8,
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10),
                    Text("How familiar are you with the local language?",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(65,allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange
                      ),
                      child: DropdownButton<String>(
                          dropdownColor: Colors.orange,
                          iconEnabledColor: Colors.orange[800],
                          focusColor: Colors.orange,
                          iconSize: 30,
                          isExpanded: true,
                          elevation: 10,
                          value: langProfValue,
                          items: langprof.map((String dropdownstringitem) {
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
                              langProfValue = newValueSelected;
                            });
                          }),
                    ),
                  ],
                ),
              );
            }
            else if(index == 2){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShowUp(
                      delay: 300,
                      child: Container(
                          child: Image(
                            image: AssetImage("assets/sociodemo_3.png"),
                            height: MediaQuery.of(context).size.height/8,
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10),
                    Text("Where is your Hometown?",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(65,allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange
                      ),
                      child: DropdownButton<String>(
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
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              stateChosen = newValueSelected;
                            });
                          }),
                    ),
                  ],
                ),
              );
            }
            else if(index == 3){
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: <Widget>[
                    ShowUp(
                      delay: 300,
                      child: Container(
                          child: Image(
                            image: AssetImage("assets/sociodemo_4.png"),
                            height: MediaQuery.of(context).size.height/8,
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10),
                    Text("What is your living arrangement here in the university?",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(65,allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange
                      ),
                      child: DropdownButton<String>(
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
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(50,
                                          allowFontScalingSelf: true),
                                      color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            livingChosen = newValueSelected;
                            print(livingChosen);
                            setState(() {
                            });
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/10
                      ,
                    ),
                    ShowUp(
                      child: Container(
                        height: MediaQuery.of(context).size.height/17,
                        width: MediaQuery.of(context).size.width/2,
                        child: RaisedButton(
                          //    elevation: 10,
                          onPressed: () {
                            if(livingChosen != null && stateChosen != null && langProfValue != null && _selectedDialogLanguage.name != null){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dass21Page()));
                            }
                            else {
                              final snackBar = SnackBar(
                                content: Text("Please complete the questionnaire"),
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
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width/23),
                          ),
                        ),
                      ),
                      delay: 1400,
                    ),
                  ],
                ),
              );
            }
            else return Container();
        },

      ),
    );
  }
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

