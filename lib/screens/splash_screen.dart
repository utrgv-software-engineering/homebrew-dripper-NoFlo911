import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'dart:async';
import 'recipe_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEBREW",
                style: TextStyle(
                    fontFamily: 'Norwester',
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                    color: Color(0xffffffff),
                    letterSpacing: 8.0)),
            Text("Handmade Coffee",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xffffffff)))
          ],
        ),
      ),
      backgroundColor: Color(0xFF4C748B),
    );
  }
}
