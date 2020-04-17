import 'package:flutter/material.dart';

class Question {
  String ques,opt1,opt2,opt3,opt4,opt5,imgURL,answer;
  Color opt1Color,opt2Color,opt3Color,opt4Color,opt5Color;
  int points,type;
   void getQues(String ques, String url){
    this.ques = ques;
    this.imgURL = url;
  }

  void getColor(ColorSwatch c1,ColorSwatch c2,ColorSwatch c3,ColorSwatch c4,[ColorSwatch c5]){
   this.opt1Color = c1[400];
   this.opt2Color = c2[500];
   this.opt3Color = c3[600];
   this.opt4Color = c4[700];
   if(c5!=null)
   this.opt5Color = c5[800];
   else
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