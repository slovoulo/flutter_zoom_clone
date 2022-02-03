import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                child: Text("Start Meeting"),
                onPressed: () async {
                  //1.Generate  meeting code
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
              ),
              Text("Join Meeting")
            ],
          )
        ],
      ),
    ));
  }
}
