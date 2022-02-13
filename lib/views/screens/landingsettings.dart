import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/widgets/appversion.dart';


class GeneralSettings extends StatelessWidget {

  GetPackageInfo packageInfo=GetPackageInfo();
  //String appVersion=packageInfo.getpackageInfo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      Row(children: [Text("Version"), Text(packageInfo.getpackageInfo())],),
      Row(children: [Text("Send Feedback"),IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))],),
      Row(children: [Text("Tell Others About us"),IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))],),
      Row(children: [Text("Rate us on Google Play Store"),IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))],),
      Row(children: [Text("Privacy Policy"),IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))],),
      Row(children: [Text("Terms of Service"),IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))],)
    ],));
  }
}
