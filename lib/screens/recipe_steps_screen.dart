import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];
    return Scaffold(
      backgroundColor: Color(0XFF4C748B),
      body: ListView(
        padding: EdgeInsets.only(top: 85),
        children: [
          Center(
            child: Column(children: [
              Text("$stepTimeRemaining",
                  key: Key("timer-text"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.w400,
                      fontSize: 96,
                      color: Color(0xFFFFFFFF))),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 65),
                child: Text("${currentRecipeStep.text}",
                    key: Key("currentStep-text"),
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xFFFFFFFF))),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 0, 10),
            child: Text("Steps",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFFFFFFF))),
          ),
          for (RecipeStep step in remainingSteps)
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                shape: remainingSteps.indexOf(step) == 0
                    ? RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10))
                    : null,
                title: Text(step.text,
                    key: Key("step${remainingSteps.indexOf(step) + 1}-text"),
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFFFFFFFF))),
                trailing: Text(
                    step.seconds < 10
                        ? "0${step.minutes}:0${step.seconds}"
                        : "0${step.minutes}:${step.seconds}",
                    key: Key(
                        "step${remainingSteps.indexOf(step) + 1}-time-text"),
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFFFFFFFF),
                    )),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
