import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//colors
const kRedColor = Color(0xFFef403d);
const kDuwitColor = Color(0xFFd0225a);

const kCyanColor = Color(0xff15bece);
const kGreenColor = Color(0xffa6ce38);
const kDarkGrey = Color(0xff58585b);
const kBackGround = Color(0xfff9fafb);
const kLightGrey = Color(0xffdbdbdb);
const kLightPink = Color(0xffffe8ea);
const kLightText = Color(0xff757575);
const kCircularColor = Color(0xffeeeeee);
const kLightBG = Color(0xff616161);
const kGoldColor = Color(0xffFFD700);
const kBloodRed = Color(0xff8A0303);
const kCardBG = Color(0xff1e1e1e);
const kCardLightBG = Color(0xff898d90);

const kColorPrimary = Color(0xff283149);
const kColorPrimaryLight = Color(0xff424B67);
const kColorPrimaryDark = Color(0xff21293E);
const kColorAccent = Colors.blue;
const kColorText = Color(0xffDBEDF3);

const TextStyle kSendButtonTextStyle = TextStyle(
  color: kCyanColor,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

ButtonStyle khomeButtonStyle(Color color, double width, double height) {
  return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      primary: color,
      fixedSize: Size(width, height));
}

const TextStyle kOnboardingStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 27,
);
TextStyle buttonStyle = GoogleFonts.montserrat(
  color: kColorAccent,
  fontWeight: FontWeight.w300,
  fontSize: 18,
);

TextStyle appbarStyle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
//Defining textstyle class where fontsize is the only required character
TextStyle myStyle(double size,
    [Color? color, FontWeight fw = FontWeight.w700]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

Widget kbuttonContainer(Icon icon, Color color, double height, double width,
    [Function? func]) {
  return Container(
    decoration: BoxDecoration(
      color:color,
      //border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15)
    ),

    height: height,
    width: width,
    child: Center(
      child: icon,
    ),
  );
}

Widget profileContainer(double height, double width,){
  return Container( decoration: BoxDecoration(
      image: DecorationImage(
        image: new AssetImage(
            'assets/images/talion.jpg'),
        fit: BoxFit.fill,
      ),

      //border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15)
  ),
  width: width,height: height,);
}
