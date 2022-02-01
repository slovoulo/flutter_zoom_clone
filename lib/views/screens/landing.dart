import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/views/screens/login.dart';
import 'package:flutter_zoom_clone/views/screens/register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.35,),
        ElevatedButton(
         // style:ButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage()));
                  },
                  child: const Text("Login")),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterPage()));
                   
                  },
                  child: const Text("Register"))
                
        
      ],),
    );
  }
}