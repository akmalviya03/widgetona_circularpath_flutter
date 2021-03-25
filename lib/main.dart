import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CircularPathWidget(),
    );
  }
}

class CircularPathWidget extends StatefulWidget {
  @override
  _CircularPathWidgetState createState() => _CircularPathWidgetState();
}

class _CircularPathWidgetState extends State<CircularPathWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget child) {
                  return Transform.translate(
                    //          X                            Y
                    /* cos(0)   = 1               , sin(0)   = 0
                    *  cos(15)  = 0.96592582628   , sin(15)  = 0.2588190451
                    *  cos(30)  = 0.86602540378   , sin(30)  = 0.5
                    *  cos(45)  = 0.70710678118   , sin(45)  = 0.70710678118
                    *  cos(60)  = 0.5             , sin(60)  = 0.86602540378
                    *  cos(75)  = 0.2588190451    , sin(75)  = 0.96592582628
                    *  cos(90)  = 0               , sin(90)  = 1
                    *  cos(105) = -0.2588190451   , sin(105) = 0.96592582628
                    *  cos(120) = -0.5            , sin(120) = 0.86602540378
                    *  cos(135) = -0.70710678118  , sin(135) = 0.70710678118
                    *  cos(150) = -0.86602540378  , sin(150) = 0.5
                    *  cos(165) = -0.96592582628  , sin(165) = 0.2588190451
                    *  cos(180) = -1              , sin(180) = 0
                    *  cos(195) = -0.96592582628  , sin(195) = -0.2588190451
                    *  cos(210) = -0.86602540378  , sin(210) = -0.5
                    *  cos(225) = -0.70710678118  , sin(225) = -0.70710678118
                    *  cos(240) = -0.5            , sin(240) = -0.86602540378
                    *  cos(255) = -0.2588190451   , sin(255) = -0.96592582628
                    *  cos(270) = 0               , sin(270) = -1
                    *  cos(285) = 0.2588190451    , sin(285) = -0.96592582628
                    *  cos(300) = 0.5             , sin(300) = -0.86602540378
                    *  cos(315) = 0.70710678118   , sin(315) = -0.70710678118
                    *  cos(330) = 0.86602540378   , sin(330) = -0.5
                    *  cos(345) = 0.96592582628   , sin(345) = -0.2588190451
                    *  cos(360) = 1               , sin(360) = 0
                    * */
                    offset: Offset(
                      20 +
                          cos((_animationController.value * 360 * pi) / 180.0) *
                              100,
                      20 +
                          sin((_animationController.value * 360 * pi) / 180.0) *
                              100,
                    ),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orangeAccent,
                      ),
                    ),
                  );
                }),
            Transform.translate(
              offset: Offset(20,20),
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,)
              ),
            )
          ],
        ),
      ),
    );
  }
}
