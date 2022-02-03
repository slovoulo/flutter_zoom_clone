import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/meetingModels.dart';


class StartMeeting extends StatefulWidget {

  String meetingCode;
  StartMeeting ({
    required this.meetingCode
  });

  @override
  _StartMeetingState createState() => _StartMeetingState();
}

class _StartMeetingState extends State<StartMeeting> {
  @override
  MeetingModels _meetingModels = MeetingModels();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body:Column(children: [
        //Meeting ID
        Text("Meeting code ${widget.meetingCode}"),

        //Start meeting button
        ElevatedButton(onPressed: ()async{_meetingModels.joinMeeting(widget.meetingCode);}, child: Text("Start Meeting"))
      ],)
      ),
    );
  }
}
