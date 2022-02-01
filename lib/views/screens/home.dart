import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:flutter_zoom_clone/providers/auth_provider.dart';
import 'package:flutter_zoom_clone/views/screens/landing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignedin = false;
  final AuthProvider _authProvider=AuthProvider(user: UserDetails());
  logoutfunc(){
    // A navigator instance that will kill previous screens on logout
    Navigator.of(context).pushAndRemoveUntil(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => LandingPage(),
      ),

          (Route route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(onPressed: (){_authProvider.signOut(logoutfunc());}, child: Text("Logout")),)
        ],
      ),
    );
  }
}
