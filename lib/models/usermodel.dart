import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserDetails {
  String username="";
   String email="";
   String? profilePic;
  String password="";
  var firebaseauth = FirebaseAuth.instance;
  bool isSignedin=false; //This wil notify the enetire app of the users signed in status


  DocumentReference? userRef;


  //UserDetails({  required this.email, this.profilePic, required this.password, this.userRef ,required this.firebaseauth});

  String get userID{
    return userRef!.id;}


    


}

