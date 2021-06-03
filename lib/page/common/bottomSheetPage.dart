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

  Widget _buildSlideAnimation(BuildContext context, Widget? child) {
    var layout = _buildAnimatedBottomSheetWidget(context, child);
    return GestureDetector(
      //onVerticalDragDown: _onVerticalDragDown,
      //onVerticalDragUpdate: _onVerticalDragUpdate,
      //onVerticalDragEnd: _onVerticalDragEnd,
      //onVerticalDragCancel: _handleDragCancel,
      //onVerticalDragStart: _handleDragStart,
      child: layout,
    );
  }

  Widget _buildAnimatedBottomSheetWidget(BuildContext context, Widget? child) {
    return FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        //heightFactor: widget.animationController.value,
        child: child);
  }

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