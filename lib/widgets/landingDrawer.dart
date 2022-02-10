import 'package:flutter/material.dart';

import 'change_theme_switch.dart';

class LandingDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Drawer(
      child: SingleChildScrollView(child: Column(children: [
        ChangeThemeButton()

      ],),),
    ));
  }
}
