import 'package:flutter/material.dart';

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
                    adduser();
                  },
                  child: const Text("Login")),
                  ElevatedButton(
                  onPressed: () {
                    registeruser();
                  },
                  child: const Text("Register"))
                
        
      ],),
    );
  }
}