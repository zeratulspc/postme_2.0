import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:postme/page/setting/settingListTIle.dart';

class SettingPage extends StatefulWidget {
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  String? versionInfo;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((d) {
      setState(() {
        versionInfo = d.version;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: ListView(
        children: [
          SettingListTile(
            title: "Version",
            subTitle: versionInfo!=null ? versionInfo!:"Loading..",
          ),
          SettingListTile(
            title: "Developer",
            subTitle: "zeratulspc",
          )
        ],
      ),
    );
  }

}