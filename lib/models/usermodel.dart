import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  String username="";
  final String email;
  final String? profilePic;
  String password="";

  DocumentReference? userRef;


  User({required this.username, required this.email, this.profilePic, required this.password, this.userRef });

  String get userID{
    return userRef!.id;}


}

