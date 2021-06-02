import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  final Widget lowerLayout;
  final Widget upperLayout;
  final Widget headerWidget;
  final headerHeight = 50.0;
  BottomSheetPage({
    required this.lowerLayout,
    required this.upperLayout,
    required this.headerWidget,
  });

  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final GlobalKey _keyPeak = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var header = Container(
      key: _keyPeak,
      height: widget.headerHeight,
      child: widget.headerWidget,
    );
    var sheet = Stack(
      children: [
        header,
        Container(
          margin: EdgeInsets.only(top: widget.headerHeight),
          child: widget.upperLayout,
        ),
      ],
    );
    return Scaffold();
  }


}