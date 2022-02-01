import 'package:flutter_zoom_clone/models/databaseservice.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final UserDetails user;
  bool isLoggingin = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: prefer_typing_uninitialized_variables
  var error;
  var firebaseauth = FirebaseAuth.instance;
  final DataBaseService DBs = DataBaseService();

  AuthProvider({required this.user});

  login(Function navigateHome) async {
    try {
      // await firebaseauth.signInWithEmailAndPassword(
      await DBs.Firebase.signInWithEmailAndPassword(
          email: user.email, password: user.password);
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
    try {
      // await user.firebaseauth.createUserWithEmailAndPassword(
      await DBs.Firebase.createUserWithEmailAndPassword(
          email: email, password: password);

      await DBs.saveUserData(username, email);

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
