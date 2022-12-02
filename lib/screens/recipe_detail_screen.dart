import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
      ),
      body: ListView(
        children: [
          Text(recipe.name, key: Key("recipeName-text")),
          Text("${recipe.coffeeVolumeGrams}", key: Key("coffeeGrams-text")),
          Text("${recipe.waterVolumeGrams}", key: Key("waterGrams-text")),
          ListTile(
              title: Text("Steps"),
              trailing: recipe.totaltimeinseconds < 10
                  ? Text(
                      "Total: " +
                          recipe.totaltimeinminutes.toString() +
                          ":" +
                          "0" +
                          recipe.totaltimeinseconds.toString(),
                      key: Key("total-time-text"))
                  : Text(
                      "Total: " +
                          recipe.totaltimeinminutes.toString() +
                          ":" +
                          recipe.totaltimeinseconds.toString(),
                      key: Key("total-time-text"))),
          ElevatedButton(
            child: Text("Start", key: Key("start-text")),
            key: Key("start-btn"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeStepsScreen(recipe)),
              );
            },
          ),
        ],
      ),
    );
  }
}
