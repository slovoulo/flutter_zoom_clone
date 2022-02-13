import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/constants.dart';
import 'package:flutter_zoom_clone/models/meetingModels.dart';
import 'package:flutter_zoom_clone/views/screens/startMeeting.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  MeetingModels _meetingModels = MeetingModels();
  String meetingCode = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Call & Chat",
          style: appbarStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //New meeting
              Column(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.width * 0.15,
                  //   width: MediaQuery.of(context).size.width * 0.15,
                  //   child: ElevatedButton(
                  //     style: khomeButtonStyle(
                  //         kBloodRed,
                  //         //MediaQuery.of(context).size.width * 0.05,
                  //         22.0,
                  //         MediaQuery.of(context).size.width * 0.15),
                  //     child: Icon(
                  //       Icons.video_call,
                  //       size: 30,
                  //     ),
                  //     onPressed: () async {
                  //       //1.Generate  meeting code
                  //       setState(() {
                  //         meetingCode = _meetingModels.createMeetingCode();
                  //       });
                  //
                  //       //2.Push user to meeting details page
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   StartMeeting(meetingCode: meetingCode),
                  //               fullscreenDialog: true));
                  //     },
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        meetingCode = _meetingModels.createMeetingCode();
                      });

                      //2.Push user to meeting details page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartMeeting(meetingCode: meetingCode),
                              fullscreenDialog: true));
                    },
                    child: kbuttonContainer(
                      Icon(Icons.video_call),
                      kBloodRed,
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "New Meeting",
                    style: TextStyle(fontSize: 10, color: kLightText),
                  )
                ],
              ),
              //Join meeting
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {

                    },
                    child: kbuttonContainer(
                      Icon(Icons.add),
                      kColorAccent,
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Join Meeting",
                    style: TextStyle(fontSize: 10, color: kLightText),
                  )
                ],
              ),
              //Schedule meeting
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                    ;
                    },
                    child: kbuttonContainer(
                      Icon(Icons.calendar_today_outlined),
                      kColorAccent,
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Schedule",
                    style: TextStyle(fontSize: 10, color: kLightText),
                  )
                ],
              ),
              //Share screen
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {

                    },
                    child: kbuttonContainer(
                      Icon(Icons.mobile_screen_share_outlined),
                      kColorAccent,
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Share Screen",
                    style: TextStyle(fontSize: 10, color: kLightText),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Icon(
            Icons.chat,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Find People and Start Chatting"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize:
                      Size(MediaQuery.of(context).size.width * 0.75, 35)),
              onPressed: () {},
              child: Text("Add Contacts"))
        ],
      ),
    ));
  }
}
