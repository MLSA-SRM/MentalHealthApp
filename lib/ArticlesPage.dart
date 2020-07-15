
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Showup.dart';
import 'main.dart';


class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {


  Future<List<ArticleDetails>> _getArticleDeets() async {

    List<ArticleDetails> articles = [
      ArticleDetails("Everything you need to know about depression.","https://www.psychiatry.org/patients-families/depression/what-is-depression"),
      ArticleDetails("What are Anxiety Disorders?","https://www.nimh.nih.gov/health/topics/anxiety-disorders/index.shtml"),
      ArticleDetails("Learn how stress affects your health.","https://www.apa.org/topics/stress-health"),
      ArticleDetails("Natural remedies for anxiety.","https://www.healthline.com/health/natural-ways-to-reduce-anxiety"),
      ArticleDetails("Alleviate Stress within Minutes.","https://www.helpguide.org/articles/stress/quick-stress-relief.htm"),
      ArticleDetails("Know how to be happier.","https://www.nhs.uk/conditions/stress-anxiety-depression/feel-better-and-happy/"),
      ArticleDetails("Types of mental health problems.","https://www.mind.org.uk/information-support/types-of-mental-health-problems/"),
      ArticleDetails("The live love laugh foundation.","https://www.thelivelovelaughfoundation.org/#ourfocus")
    ];

    return articles;
  }

  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;


    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => MyApp()));
      },
      child: Icon(Icons.home),
      backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(height: _height/70,),

            Padding(
              padding:  EdgeInsets.only(left: _width/20),
              child: Text("Articles",style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: _width/13
              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: _width/20),
              child: Text("to get you going!",style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: _width/20
              ),),
            ),
            SizedBox(height: _height/30,),

            Container(
              height: _height*0.9,
              child: FutureBuilder(
                future: _getArticleDeets(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else {
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length??0,
                        itemBuilder: (BuildContext context, int index){
                          return Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.attach_file,size: _width/18, color: Colors.black,),
                                title: Text(snapshot.data[index].title,style: TextStyle(
                                  fontSize: _width/23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),),
                                onTap: () async {
                                  launch(snapshot.data[index].url);
                                },
                              ),
                              Divider(),
                            ],
                          );
                        }
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ArticleDetails {

  String title,url;
  ArticleDetails(this.title,this.url);
}