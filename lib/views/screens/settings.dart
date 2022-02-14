import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: appbarStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container( decoration: const BoxDecoration(

            color: kCardBG ,
          ),

            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  profileContainer(MediaQuery.of(context).size.height * 0.07,
                      MediaQuery.of(context).size.width * 0.15),
                  SizedBox(width: 15,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Talion"),
                      Text(
                        "talion@mordor.com",
                        style: TextStyle(color: kLightText, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.35,),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
