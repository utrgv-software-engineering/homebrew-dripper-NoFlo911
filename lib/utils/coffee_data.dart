import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/coffee_resource.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [makeSweetMariasRecipe(), makeTestRecipe()];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}

CoffeeResource linkCoffeeResource() {
  CoffeeResource resource =
      CoffeeResource("Coffee", "https://en.wikipedia.org/wiki/Coffee");
  return resource;
}

CoffeeResource linkGindersResource() {
  CoffeeResource resource = CoffeeResource("Grinders",
      "https://www.amazon.com/LHS-Containers-Adjustable-Coarseness-Refillable/dp/B07RS2G42S/ref=asc_df_B07RS2G42S/?tag=&linkCode=df0&hvadid=366402578372&hvpos=&hvnetw=g&hvrand=9943000392220450163&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1026373&hvtargid=pla-801988383349&ref=&adgrpid=84691872708&th=1");
  return resource;
}

CoffeeResource linkKettlesResource() {
  CoffeeResource resource = CoffeeResource("Kettles",
      "https://www.amazon.com/COSORI-Electric-Gooseneck-Variable-Stainless/dp/B07T1CH2HH/ref=asc_df_B07T1CH2HH/?tag=hyprod-20&linkCode=df0&hvadid=366403797506&hvpos=&hvnetw=g&hvrand=7151783955198809255&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1026373&hvtargid=pla-815429692234&psc=1&tag=&ref=&adgrpid=77662751753&hvpone=&hvptwo=&hvadid=366403797506&hvpos=&hvnetw=g&hvrand=7151783955198809255&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1026373&hvtargid=pla-815429692234");
  return resource;
}

CoffeeResource linkHomeberwDippersResource() {
  CoffeeResource resource = CoffeeResource("Homebrew Dripper",
      "https://www.amazon.com/Hario-V60-Starter-Dripper-Filters/dp/B00JJIOJ7E/ref=asc_df_B00JJIOJ7E/?tag=hyprod-20&linkCode=df0&hvadid=234628061491&hvpos=&hvnetw=g&hvrand=3724838311908709463&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1026373&hvtargid=pla-393286005271&psc=1");
  return resource;
}

List<CoffeeResource> getAllResources() {
  return [
    linkCoffeeResource(),
    linkGindersResource(),
    linkKettlesResource(),
    linkHomeberwDippersResource()
  ];
}

class CoffeeResources {
  static List<CoffeeResource> loadResources() {
    return getAllResources();
  }
}
