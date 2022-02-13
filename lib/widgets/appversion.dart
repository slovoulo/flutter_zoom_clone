import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GetPackageInfo{
  getpackageInfo()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    return Text(version);
  }

}
