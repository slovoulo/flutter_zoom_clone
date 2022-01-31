import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserDetails {
  String username="";
  final String email;
  final String? profilePic;
  String password="";
  final firebaseauth = FirebaseAuth.instance;
  bool isSignedin=false; //This wil notify the enetire app of the users signed in status

  DocumentReference? userRef;


  UserDetails({required this.username, required this.email, this.profilePic, required this.password, this.userRef });

  String get userID{
    return userRef!.id;}


}

