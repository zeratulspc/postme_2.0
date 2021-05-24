import 'package:flutter/material.dart';
import 'package:postme/page/home.dart';

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  late Animation _introAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _introAnimation = Tween(begin: 0.0, end: 3.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutQuart))
        ..addStatusListener((status) { 
          if(status == AnimationStatus.completed) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          }
        });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Transform.scale(
            scale: _introAnimation.value,
            child: Text(
              "PostMe!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

}