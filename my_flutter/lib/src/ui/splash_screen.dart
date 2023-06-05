import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  const SplashScreen({super.key});
}

class  _SplashScreenState extends State {
  @override void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 5), () =>
        Navigator.pushReplacement( context,
          MaterialPageRoute(builder: (context) => const NavigationPage()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("lib/src/ui/assets/SplashScreen.gif",
                gaplessPlayback: true,
                fit: BoxFit.fill
            )
        ));
  }
}
