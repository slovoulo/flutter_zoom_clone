import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/providers/themeProvider.dart';
import 'package:provider/provider.dart';


class ChangeThemeButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context);;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(thmode.darkMode ? 'Dark' :'Light'),
        CupertinoSwitch(
          value: thmode.darkMode,
          onChanged: (bool val) {
            thmode.changemode();
          },
        ),
      ],
    );
  }
}
