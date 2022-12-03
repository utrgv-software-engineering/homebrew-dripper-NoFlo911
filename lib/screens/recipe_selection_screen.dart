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
      body: ListView(
        children: [
          Text("Coffee Recipes", key: Key("coffee-recipes")),
          RecipeList(),
          Text("Resources", key: Key("resources-text")),
          ResourceList()
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          ListTile(
              title: Text(recipe.name),
              trailing: Icon(Icons.chevron_right),
              key: Key("recipe-tile${recipes.indexOf(recipe)}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe)),
                );
              })
      ],
    );
  }
}

class ResourceList extends StatelessWidget {
  List<CoffeeResource> resources = CoffeeResources.loadResources();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeResource resource in resources)
          ListTile(
              title: Text(resource.name,
                  key: Key("${resource.name}Resource-tile")),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                if (await canLaunchUrlString(resource.link)) {
                  await launchUrlString(resource.link,
                      mode: LaunchMode.inAppWebView);
                }
              })
      ],
    );
  }
}
