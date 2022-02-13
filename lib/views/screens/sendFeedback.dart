///Steps
//Scaffold with appbar and back button

//Descriptive Text

//Text input field

//Send button After validation
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SendFeedback extends StatelessWidget {
  final GlobalKey<FormState> feedbackKey = GlobalKey<FormState>();
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Scaffold with appbar and back button
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeback"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RichText(
            text:
                TextSpan(text: "For technical support please visit", children: [
              TextSpan(
                  text: ' Support.',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  //style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //Insert function that leads to your support site
                    }),
            ]),
          ),
          Form(key:feedbackKey,
            child: TextFormField(
              controller: feedbackController,

              decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Username", hintText: "Your username"),

              onChanged: (value) {
                // var vl=userVM.username;
                // if(vl != null){userVM.username = value;}
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "You did not type anything";
                }
              },
            ),)
        ],
      ),
    );
  }
}
