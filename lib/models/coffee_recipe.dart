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
    this.name = name;

    //add any rules to reject invalid values
    if (coffeeVolumeGrams <= 0) {
      throw ArgumentError();
    }

    this.coffeeVolumeGrams = coffeeVolumeGrams;

    if (waterVolumeGrams <= 0) {
      throw ArgumentError();
    }
    this.waterVolumeGrams = waterVolumeGrams;
    this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    //for example, reject negative gram amounts
    for (RecipeStep step in steps) {
      totaltimeinseconds += step.time;
    }
    if (totaltimeinseconds >= 60) {
      totaltimeinminutes = totaltimeinseconds ~/ 60;
      totaltimeinseconds = totaltimeinseconds % 60;
    }

    this.steps = steps;
  }
}
