import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animation extends StatefulWidget {
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animation> with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  AnimationController padController;
  Animation<double> padAnimation;

  AnimationController textController;
  Animation<double> textAnimation;

  int i = 0;
  int j = 0;
  double padding = 0;
  double textPadding = 0;
  bool flag = false;
  bool flag1 = false;

  void changeColors() {
    if (flag == false && i <= _colors.length - 1) {
      sleep(Duration(milliseconds: 100));
      if (i == _colors.length - 1) {
        flag = true;
      } else {
        print(i);
        i++;
      }
    } else if (flag == true && i >= 0) {
      sleep(Duration(milliseconds: 100));
      if (i == 0) {
        flag = false;
      } else {
        print(i);
        i--;
      }
    }
  }

  void changeAppBarColor() {
    if (flag1 == false && j <= _appbarColor.length - 1) {
      sleep(Duration(milliseconds: 100));
      if (j == _appbarColor.length - 1) {
        flag1 = true;
      } else {
        print(j);
        j++;
      }
    } else if (flag1 == true && j >= 0) {
      sleep(Duration(milliseconds: 100));
      if (j == 0) {
        flag1 = false;
      } else {
        print(j);
        j--;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animController)
      ..addListener(() {
        setState(() {
          changeColors();
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
    animController.forward();

    // Second Animation Controller
    padController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    padAnimation = Tween<double>(
      begin: 0.28,
      end: 1,
    ).animate(padController)
      ..addListener(() {
        setState(() {
          padding = padAnimation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          padController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          padController.forward();
        }
      });
    padController.forward();

    // Third Animation Controller
    textController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    textAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(textController)
      ..addListener(() {
        setState(() {
          textPadding = textAnimation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          textController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          textController.forward();
        }
      });
    textController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Animation App',
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(padding * 100, padding * 100),
                  child: Image(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/pchat99/flutter_animations_app/main/images/0_TZfTsYARaJupeCTP.png',
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                Transform.translate(
                  offset: Offset(padding * -2, padding * -2),
                  child: Image(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/pchat99/flutter_animations_app/main/images/33972111.png',
                    ),
                    height: 80,
                    width: 80,
                  ),
                ),
                Transform.translate(
                  offset: Offset(padding * -100, padding * 100),
                  child: Image(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/pchat99/flutter_animations_app/main/images/logo-vertical.png',
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Transform.rotate(
              angle: animation.value,
              child: Center(
                child: Container(
//                  margin: EdgeInsets.only(left: padding * 100),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _colors[i],
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: padding * 2.3,
                      child: Text(
                        'Welcome to app',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 320,
              child: MaterialButton(
                onPressed: () {
                  print("button Pressed!");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: textPadding * 40),
                  child: Text(
                    'Click here to Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _colors = [
    Color(0xFFc95959),
    Color(0xFFc43f3f),
    Color(0xFFc42727),
    Color(0xFFc91818),
    Color(0xFFc40808),
    Color(0xFFc47e49),
    Color(0xFFc77334),
    Color(0xFFc76720),
    Color(0xFFc25b10),
    Color(0xFFc25608),
    Color(0xFFbdb85b),
    Color(0xFFc4be49),
    Color(0xFFc4bd33),
    Color(0xFFc9c11e),
    Color(0xFFc9c008),
  ];

  final _appbarColor = [
    Color(0xFF424242),
    Color(0xFF363636),
    Color(0xFF292929),
    Color(0xFF212121),
    Color(0xFF0d0d0d),
  ];

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
