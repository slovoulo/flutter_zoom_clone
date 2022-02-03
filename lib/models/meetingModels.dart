import 'dart:io' show Platform;
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeetingModels {
  var uuid = const Uuid();
  var code = "";

//Using UUID generate random codes that will be used as meeting codes
  createMeetingCode() {
    //substring limits generated coode to 5 characters
    return code = const Uuid().v1().substring(0, 5);
  }

  joinMeeting(var roomCode,)async{
    await createMeetingCode();
    final usernameprefs = await SharedPreferences.getInstance();
    final username = usernameprefs.getString("username");
    //final profilePic = usernameprefs.getString("profilePic");
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };

        // Here is an example, disabling features for each platform
        if (Platform.isAndroid) {
          // Disable ConnectionService usage on Android to avoid issues
          featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        } else if (Platform.isIOS) {
          // Disable PIP on iOS as it looks weird
          featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
        }


      var options = JitsiMeetingOptions(room: roomCode)

        //..serverURL = "https://someHost.com"
        ..subject = "Meeting with $username"
        ..userDisplayName = username
       // ..userEmail = "myemail@email.com"
       // ..userAvatarURL = null // or .png
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        ..featureFlags.addAll(featureFlags);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
     print("error: $error");
    }

  }
}
