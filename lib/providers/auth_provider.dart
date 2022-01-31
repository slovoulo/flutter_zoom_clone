
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart' ;

class AuthProvider extends ChangeNotifier{
  final UserDetails user;
  bool isLoggingin=false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var error;
  

  AuthProvider({required this.user});

  login()async{
   try{
     await user.firebaseauth.signInWithEmailAndPassword(email: user.email, password: user.password);
   user.isSignedin=true;
   notifyListeners();
   }
   on FirebaseAuthException catch(e){
     error=e.message;
                        isLoggingin=false ;
                        notifyListeners();
   }
   

  }
  register()async{
      try{final newUSer = user.firebaseauth .createUserWithEmailAndPassword(
                                              email: user.email, password: user.password);notifyListeners();}on FirebaseAuthException catch(e){
                                                error=e.message;
                        isLoggingin=false ;
                        notifyListeners();

                                              }

  }
  Widget showAlert(){
    if(error!=null){
      return Container(
        color: kLightGrey,
        width: double.infinity,
        padding: EdgeInsets.all(7.0),
        child: Row(
          children: [
            const Padding(
              padding:  EdgeInsets.only(right: 7.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(child: AutoSizeText(error, maxLines:3 ),),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: IconButton(
                icon:Icon(Icons.close),
                onPressed: (){
                  
                    error = null;
                  
                },
              ),
            )
          ],

        ),
      );
    }
    return SizedBox(height: 0,);
  }
}


