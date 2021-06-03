import 'package:flutter/material.dart';

import 'bottomSheetController.dart';

class BottomSheetPage extends StatefulWidget {
  final Widget lowerLayout;
  final Widget upperLayout;
  final Widget headerWidget;
  final headerHeight = 50.0;
  final RubberAnimationController animationController;
  BottomSheetPage({
    required this.lowerLayout,
    required this.upperLayout,
    required this.headerWidget,
    required this.animationController,
  });

  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final GlobalKey _keyPeak = GlobalKey();
  final GlobalKey _keyWidget = GlobalKey();

  RubberAnimationController get controller => widget.animationController;

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
        heightFactor: widget.animationController.value,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
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
    var elem = AnimatedBuilder(
        animation: controller,
        builder: _buildSlideAnimation,
        child: sheet,
    );
    return Stack(
      key: _keyWidget,
      children: [
        widget.lowerLayout,
        Align(child: elem, alignment: Alignment.bottomRight,)
      ],
    );
  }


}