import 'package:flutter_zoom_clone/models/usermodel.dart';

class UserViewModel {
  //Calling the User class from usermodel.dart
  final UserDetails? user;

  UserViewModel({this.user});

  // String set username {
  //   return user!.username;
  // }
  // getusername(){
  //   String? username;
  //   return username=user!.username;
  // }
  //static String username=user.username;

  String get profilepic {
    if (user!.profilePic == null) {
      return "user.profilePic";
    }
    return user!.profilePic!;
  }

  String get password {
    return user!.password;
  }

  String get userID {
    return user!.userID;
  }
}
