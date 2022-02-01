import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseService {
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection("users");
  final FirebaseAuth Firebase = FirebaseAuth.instance;

  Future saveUserData(String name, String email) async {
    var userID = Firebase.currentUser?.uid;
    return await userCollectionRef
        .doc(userID)
        .set({"username": name, "email": email, "id":userID});
  }
}
