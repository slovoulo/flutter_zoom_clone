import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';
import 'package:flutter_zoom_clone/models/landing_images.dart';
import 'package:flutter_zoom_clone/views/screens/register.dart';
import 'package:flutter_zoom_clone/widgets/landingDrawer.dart';

import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  String? title;
  Image? imageFile;

  OnboardingScreen({this.imageFile, this.title});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: LandingDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              //Align(alignment: Alignment.topLeft,child: IconButton(icon: Icon(Icons.settings),onPressed: (){ LandingDrawer();},),),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              Container(height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: contents.length,
                    itemBuilder: (_, itemBuilder) {
                      return Column(
                        children: [
                          Text(
                            contents[itemBuilder].title,
                            style: kOnboardingStyle,
                          ),
                          Image.asset(contents[itemBuilder].image)
                        ],
                      );
                    }),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.75, 35)),

                  onPressed: () {},
                  child: const Text("Join a Meeting")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: buttonStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: Text(
                      "Login",
                      style: buttonStyle,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
