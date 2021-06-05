
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  SettingListTile({
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      title: Text(
        title
      ),
      subtitle: subTitle!=null ?
      Text(
          subTitle!
      ) : null,
    );
  }
}