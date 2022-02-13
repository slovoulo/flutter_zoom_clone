import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:flutter_zoom_clone/providers/auth_provider.dart';
import 'package:flutter_zoom_clone/views/screens/landing.dart';
import 'package:flutter_zoom_clone/views/screens/profile.dart';
import 'package:flutter_zoom_clone/views/screens/videocall.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignedin = false;
  final AuthProvider _authProvider = AuthProvider(user: UserDetails());
  logoutfunc() {
    // A navigator instance that will kill previous screens on logout
    Navigator.of(context).pushAndRemoveUntil(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => LandingPage(),
      ),

      (Route route) => false,
    );
  }

  int page = 0;
  List pageoptions=[VideoCall(),ProfilePage(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        //selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_call,
                size: 32,
              ),
              label: "Video Call"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: "Profile"),

        ],
      ),
      body: pageoptions[page],
    );
  }
}
