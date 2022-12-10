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
      backgroundColor: Color(0xffe5e5e5),
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
          Container(
              decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  border: Border.all(
                      color: Color(0xff4c748b),
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 19, right: 19, top: 16, bottom: 24),
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(
                        top: 12, left: 102, right: 102, bottom: 8),
                    child: Text(widget.recipe.name,
                        key: Key("recipeName-text"),
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Kollektif",
                            fontSize: 18,
                            letterSpacing: 1.6))),
                Divider(
                    color: Color(0xff4c748b),
                    indent: 22,
                    endIndent: 22,
                    thickness: 1),
                Container(
                    margin: EdgeInsets.only(top: 25, bottom: 14),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                              "${widget.recipe.coffeeVolumeGrams}" +
                                  "g - finely ground coffee",
                              key: Key("coffeeGrams-text"),
                              style: TextStyle(
                                  color: Color(0xff4c748b),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kollektif",
                                  fontSize: 14,
                                  letterSpacing: 1.6))),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                              "${widget.recipe.waterVolumeGrams}" + "g - water",
                              key: Key("waterGrams-text"),
                              style: TextStyle(
                                  color: Color(0xff4c748b),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kollektif",
                                  fontSize: 14,
                                  letterSpacing: 1.6)))
                    ])),
                Container(
                    margin: EdgeInsets.only(bottom: 20, left: 36, right: 35),
                    child: Text("The original recipe: makes one delicious cup",
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat-Italic",
                            fontStyle: FontStyle.italic,
                            fontSize: 10,
                            letterSpacing: 1.6)))
              ])),
          ListTile(
              title: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text("Steps",
                    style: TextStyle(
                        color: Color(0xff4c748b),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kollektif",
                        fontSize: 14,
                        letterSpacing: 1.6)),
              ),
              trailing: widget.recipe.totaltimeinseconds < 10
                  ? Container(
                      child: Text(
                          "Total: " +
                              widget.recipe.totaltimeinminutes.toString() +
                              ":" +
                              "0" +
                              widget.recipe.totaltimeinseconds.toString(),
                          key: Key("total-time-text"),
                          style: TextStyle(
                              color: Color(0xff4c748b),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Kollektif",
                              fontSize: 12,
                              letterSpacing: 1.6)))
                  : Container(
                      child: Text(
                          "Total: " +
                              widget.recipe.totaltimeinminutes.toString() +
                              ":" +
                              widget.recipe.totaltimeinseconds.toString(),
                          key: Key("total-time-text"),
                          style: TextStyle(
                              color: Color(0xff4c748b),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Kollektif",
                              fontSize: 12,
                              letterSpacing: 1.6)))),
          for (RecipeStep step in remainingSteps)
            Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 12),
                child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity(vertical: -4),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xff4c748b),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    title: Text(step.text,
                        key:
                            Key("step${remainingSteps.indexOf(step) + 1}-text"),
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Kollektif",
                            fontSize: 12,
                            letterSpacing: 1.6)),
                    trailing: step.seconds < 10
                        ? Text(
                            "0" +
                                step.minutes.toString() +
                                ":" +
                                "0" +
                                step.seconds.toString(),
                            key: Key(
                                "step${remainingSteps.indexOf(step) + 1}-time-text"),
                            style: TextStyle(
                                color: Color(0xff4c748b),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kollektif",
                                fontSize: 12,
                                letterSpacing: 1.6))
                        : Text(
                            "0" +
                                step.minutes.toString() +
                                ":" +
                                step.seconds.toString(),
                            key: Key(
                                "step${remainingSteps.indexOf(step) + 1}-time-text"),
                            style: TextStyle(
                                color: Color(0xff4c748b),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kollektif",
                                fontSize: 12,
                                letterSpacing: 1.6)))),
          Container(
              margin: EdgeInsets.only(left: 48, right: 47),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff4c748b),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Text("Start",
                    key: Key("start-text"),
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        letterSpacing: 1.6)),
                key: Key("start-btn"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(widget.recipe)),
                  );
                },
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
