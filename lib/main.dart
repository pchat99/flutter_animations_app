import 'package:flutter/material.dart';

import 'animations/animations.dart';

void main() {
  runApp(AnimationApp());
}

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anim(),
    );
  }
}
