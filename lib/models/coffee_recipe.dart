import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;
  int totaltimeinminutes = 0;
  int totaltimeinseconds = 0;
  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    for (RecipeStep step in steps) {
      totaltimeinseconds += step.time;
    }
    if (totaltimeinseconds >= 60) {
      totaltimeinminutes = totaltimeinseconds ~/ 60;
      totaltimeinseconds = totaltimeinseconds % 60;
    }

    this.name = name;
    this.coffeeVolumeGrams = coffeeVolumeGrams;
    this.waterVolumeGrams = waterVolumeGrams;
    this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    this.steps = steps;
  }
}
