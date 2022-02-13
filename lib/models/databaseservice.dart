import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseService {
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference FeedbackCollectionRef =
  FirebaseFirestore.instance.collection("feedback");

  final FirebaseAuth firebase = FirebaseAuth.instance;

  Future saveUserData(String name, String email) async {
    var userID = firebase.currentUser?.uid;
    return await userCollectionRef
        .doc(userID)
        .set({"username": name, "email": email, "id":userID});
  }

  Future saveUserFeedback(String feedback) async {
    var userID = firebase.currentUser?.uid;
    var userEmail=firebase.currentUser?.email;
    final usernameprefs = await SharedPreferences.getInstance();
    final username = usernameprefs.getString("username");
    return await FeedbackCollectionRef
        .doc(userID)
        .set({"Username": username, "Email": userEmail, "Userid":userID, "Message":feedback});
  }
}
