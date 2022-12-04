import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

class RecipeDetailScreen extends StatefulWidget {
  CoffeeRecipe recipe;
  RecipeDetailScreen(this.recipe);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  @override
  void initState() {
    super.initState();
    int totalSteps = widget.recipe.steps.length;
    currentStep = 0;
    remainingSteps = widget.recipe.steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              key: Key('Back-Button'),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Color(0xff4C748B)))),
      body: ListView(
        children: [
          Text(widget.recipe.name, key: Key("recipeName-text")),
          Text("${widget.recipe.coffeeVolumeGrams}",
              key: Key("coffeeGrams-text")),
          Text("${widget.recipe.waterVolumeGrams}",
              key: Key("waterGrams-text")),
          ListTile(
              title: Text("Steps"),
              trailing: widget.recipe.totaltimeinseconds < 10
                  ? Text(
                      "Total: " +
                          widget.recipe.totaltimeinminutes.toString() +
                          ":" +
                          "0" +
                          widget.recipe.totaltimeinseconds.toString(),
                      key: Key("total-time-text"))
                  : Text(
                      "Total: " +
                          widget.recipe.totaltimeinminutes.toString() +
                          ":" +
                          widget.recipe.totaltimeinseconds.toString(),
                      key: Key("total-time-text"))),
          for (RecipeStep step in remainingSteps)
            ListTile(
                title: Text(step.text,
                    key: Key("step${remainingSteps.indexOf(step) + 1}-text")),
                trailing: step.seconds < 10
                    ? Text(
                        "0" +
                            step.minutes.toString() +
                            ":" +
                            "0" +
                            step.seconds.toString(),
                        key: Key(
                            "step${remainingSteps.indexOf(step) + 1}-time-text"))
                    : Text(
                        "0" +
                            step.minutes.toString() +
                            ":" +
                            step.seconds.toString(),
                        key: Key(
                            "step${remainingSteps.indexOf(step) + 1}-time-text"))),
          ElevatedButton(
            child: Text("Start", key: Key("start-text")),
            key: Key("start-btn"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeStepsScreen(widget.recipe)),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
