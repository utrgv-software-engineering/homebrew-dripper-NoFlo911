import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text("enjoy your amazing handmade coffee",
              key: Key("doneScreen-text")),
          TextButton(
            child: Text("done", key: Key("done-text")),
            key: Key("done-btn"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeSelectionScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
