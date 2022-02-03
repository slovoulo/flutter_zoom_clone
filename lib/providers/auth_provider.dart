import 'package:flutter_zoom_clone/models/databaseservice.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final UserDetails user;
  bool isLoggingin = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: prefer_typing_uninitialized_variables
  var error;
  var firebaseauth = FirebaseAuth.instance;
  final DataBaseService DBs = DataBaseService();
  String username="";


  AuthProvider({required this.user});

  Future retrieveUsername() async {
    final documentsnap=await DBs.userCollectionRef.doc(user.userID).get();
    final userdata=documentsnap.data();
    username = (userdata as dynamic)["username"];
    return username;
  }

  login(String email,String password,Function navigateHome) async {
    final loginprefs = await SharedPreferences.getInstance();
    try {
      // await firebaseauth.signInWithEmailAndPassword(
      await DBs.firebase.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      //Retrieve username from firebase
      await retrieveUsername();

      //Save username in state to be retrieved anytime in the app
      loginprefs.setString("username",username);
      print("Username is $username");
      navigateHome();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      error = e.message;
      showAlert();
      isLoggingin = false;
      notifyListeners();
    }
  }

  register(String username, String email, String password,
      Function navigateHome) async {
    final registerprefs = await SharedPreferences.getInstance();
    try {
      // await user.firebaseauth.createUserWithEmailAndPassword(
      await DBs.firebase.createUserWithEmailAndPassword(
          email: email, password: password);

      await DBs.saveUserData(username, email);

      //Save username in state to be retrieved anytime in the app
      registerprefs.setString("username", username);

      navigateHome();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      error = e.message;
      showAlert();
      isLoggingin = false;
      notifyListeners();
    }
  }

  signOut(Function goTolandng) async {
    await FirebaseAuth.instance.signOut();
    goTolandng();
  }


  //A widget that will display firebase error(if present) message to user during authentication
  Widget showAlert() {
    if (error != null) {
      return Container(
        color: kLightGrey,
        width: double.infinity,
        padding: const EdgeInsets.all(7.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 7.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(error, maxLines: 3),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  error = null;
                },
              ),
            )
          ],
        ),
      );
    }
    return const SizedBox(
      height: 0,
    );
  }
}
