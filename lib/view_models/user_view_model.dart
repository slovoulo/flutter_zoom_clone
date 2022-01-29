import 'package:flutter_zoom_clone/models/usermodel.dart';

class UserViewModel {
  //Calling the User class from usermodel.dart
  final User? user;

  UserViewModel({this.user});

  // String get username {
  //   return user!.username;
  // }
  // getusername(){
  //   String? username;
  //   return username=user!.username;
  // }
  //String username=user.username;

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
