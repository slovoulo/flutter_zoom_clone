import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:flutter_zoom_clone/providers/auth_provider.dart';
import 'package:flutter_zoom_clone/providers/themeProvider.dart';

import 'package:flutter_zoom_clone/views/screens/home.dart';
import 'package:flutter_zoom_clone/views/screens/landing.dart';
import 'package:flutter_zoom_clone/views/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  UserDetails user = UserDetails();

  ///Logic to show onboarding screens only once

  runApp(MultiProvider(providers:[ChangeNotifierProvider<AuthProvider>(create: (context) {
    return AuthProvider(user: user);
  }),
    ChangeNotifierProvider<DarkMode>(
      create: (context) {
        return DarkMode();
      },

    )],child: FlutterZoomClone()));
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class FlutterZoomClone extends StatelessWidget {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  //UserDetails user = UserDetails();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/chat.png"), context);
    precacheImage(AssetImage("assets/images/videocall.png"), context);
    precacheImage(AssetImage("assets/images/start.png"), context);
    precacheImage(AssetImage("assets/images/screenshare.png"), context);
    final thmode = Provider.of<DarkMode>(context);
    return MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData(
          ///here the value of darmode var is updationg by switching
          brightness: thmode.darkMode ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: firebaseUser != null ? const HomePage() : OnboardingScreen());
  }
}
