import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/coffee_resource.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(87, 49, 87, 16),
            child: Text(
              "Coffee Recipes",
              key: Key("coffee-recipes"),
              style: TextStyle(
                  color: Color(0xff4c748b),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Kollektif",
                  fontSize: 24,
                  letterSpacing: 1.6),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  border: Border.all(
                      color: Color(0xff4c748b),
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(
                left: 19,
                bottom: 0,
                right: 19,
              ),
              child: RecipeList()),
          Container(
            margin: EdgeInsets.fromLTRB(120, 30, 120, 16),
            child: Text(
              "Resources",
              key: Key("resources-text"),
              style: TextStyle(
                  color: Color(0xff4c748b),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Kollektif",
                  fontSize: 24,
                  letterSpacing: 1.6),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  border: Border.all(
                      color: Color(0xff4c748b),
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(
                left: 19,
                right: 19,
              ),
              child: ResourceList()),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      for (CoffeeRecipe recipe in recipes)
        Container(
            child: Column(children: [
          ListTile(
              visualDensity: VisualDensity(vertical: -4),
              title: Container(
                  margin: EdgeInsets.only(left: 28),
                  child: Text(recipe.name,
                      style: TextStyle(
                          color: Color(0xff4c748b),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          letterSpacing: 1.6))),
              trailing: Icon(Icons.chevron_right, color: Color(0xff4c748b)),
              key: Key("recipe-tile${recipes.indexOf(recipe)}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe)),
                );
              }),
          if (recipe.name != "Slight Glass")
            Divider(color: Color(0xff4c748b), thickness: 1)
        ]))
    ]);
  }
}

class ResourceList extends StatelessWidget {
  List<CoffeeResource> resources = CoffeeResources.loadResources();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeResource resource in resources)
          Container(
              child: Column(children: [
            ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Container(
                    margin: EdgeInsets.only(left: 28),
                    child: Text(resource.name,
                        key: Key("${resource.name}Resource-tile"),
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            letterSpacing: 1.6))),
                trailing: Icon(Icons.chevron_right, color: Color(0xff4c748b)),
                onTap: () async {
                  if (await canLaunchUrlString(resource.link)) {
                    await launchUrlString(resource.link,
                        mode: LaunchMode.inAppWebView);
                  }
                }),
            if (resource.name != "Homebrew Dripper")
              Divider(color: Color(0xff4c748b), thickness: 1)
          ]))
      ],
    );
  }
}
