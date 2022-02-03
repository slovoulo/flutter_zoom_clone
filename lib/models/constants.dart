

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



//colors
const kRedColor = Color(0xFFef403d);
const kDuwitColor = Color(0xFFd0225a);

const kCyanColor = Color(0xff15bece);
const kGreenColor = Color(0xffa6ce38);
const kDarkGrey = Color(0xff58585b);
const kBackGround = Color(0xfff9fafb);
const kLightGrey= Color(0xffdbdbdb);
const kLightPink= Color(0xffffe8ea);
const kLightText= Color(0xff757575);
const kCircularColor= Color(0xffeeeeee);
const kLightBG= Color(0xff616161);
const kGoldColor= Color(0xffFFD700);
const kBloodRed= Color(0xff8A0303);
const kCardBG= Color(0xff1e1e1e);
const kCardLightBG= Color(0xff898d90);



const kColorPrimary = Color(0xff283149);
const kColorPrimaryLight = Color(0xff424B67);
const kColorPrimaryDark = Color(0xff21293E);
const kColorAccent = Colors.blue;
const kColorText = Color(0xffDBEDF3);



const TextStyle kSendButtonTextStyle = TextStyle(
  color: kColorText,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

//Defining textstyle class where fontsize is the only required character
TextStyle myStyle(double size, [Color? color,FontWeight fw=FontWeight.w700]){
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );



}



















