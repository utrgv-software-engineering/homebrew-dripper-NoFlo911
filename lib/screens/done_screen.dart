import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(100, 250, 87, 16),
            child: Text(
              "enjoy your amazing \n handmade coffee",
              key: Key("doneScreen-text"),
              style: TextStyle(
                  color: Color(0xff4c748b),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  letterSpacing: 1.6),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(100, 280, 87, 16),
          ),
          TextButton(
            child: Text("done",
                key: Key("done-text"),
                style: TextStyle(
                    color: Color(0xff4c748b),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    letterSpacing: 1.6)),
            key: Key("done-btn"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeSelectionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
