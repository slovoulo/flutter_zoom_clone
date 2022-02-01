import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:flutter_zoom_clone/providers/auth_provider.dart';

import 'package:flutter_zoom_clone/views/screens/home.dart';
import 'package:flutter_zoom_clone/views/screens/landing.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(

    
  );
  
  runApp( FlutterZoomClone());
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class FlutterZoomClone extends StatelessWidget {
  
  var firebaseUser = FirebaseAuth.instance.currentUser;
  UserDetails user=UserDetails();

  
   

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AuthProvider>(create: (context){return AuthProvider(user: user);})],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: firebaseUser!=null?const HomePage():const LandingPage()
      ),
    );
  }
}



