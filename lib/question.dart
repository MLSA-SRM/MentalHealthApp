import 'package:flutter/material.dart';

class Question {
  String ques,opt1,opt2,opt3,opt4,opt5,imgURL,answer;
  Color opt1Color,opt2Color,opt3Color,opt4Color,opt5Color;
  int points,type;
   void getQues(String ques, String url){
    this.ques = ques;
    this.imgURL = url;
  }

  void getColor(Color c1,Color c2,Color c3,Color c4,[Color c5]){
   this.opt1Color = c1;
   this.opt2Color = c2;
   this.opt3Color = c3;
   this.opt4Color = c4;
   this.opt5Color = c5;
  }

  void getOptions(opt1,opt2,opt3,opt4,[opt5]){
     this.opt1 = opt1;
     this.opt2 = opt2;
     this.opt3 = opt3;
     this.opt4 = opt4;
     this.opt5 = opt5;
  }
}