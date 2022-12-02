import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    CoffeeRecipe makeTestRecipe() {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 1),
        RecipeStep("Cover and wait", 2),
        RecipeStep("Stir", 3),
        RecipeStep("Cover and wait", 4),
        RecipeStep("Stir", 5),
      ];
      CoffeeRecipe recipe = CoffeeRecipe(
        "Test",
        22,
        360,
        "finely ground coffee",
        "The original recipe: makes one delicious cup",
        steps,
      );
      return recipe;
    }

    //check that it has the right data
    expect(makeTestRecipe().name, "Test");
    expect(makeTestRecipe().coffeeVolumeGrams, 22);
    expect(makeTestRecipe().waterVolumeGrams, 360);
    expect(makeTestRecipe().grindSize, "finely ground coffee");
    expect(makeTestRecipe().miscDetails,
        "The original recipe: makes one delicious cup");
    expect(makeTestRecipe().totaltimeinminutes, 0);
    expect(makeTestRecipe().totaltimeinseconds, 15);
    //how do we test rejecting invalid coffee recipes?
  });
  test(
      'creates a valid coffee recipe for total recipe time greater than 60 seconds',
      () {
    //make a coffee recipe
    CoffeeRecipe makeTestRecipe() {
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
        steps,
      );
      return recipe;
    }

    //check that it has the right data
    expect(makeTestRecipe().name, "Sweet Maria's");
    expect(makeTestRecipe().coffeeVolumeGrams, 22);
    expect(makeTestRecipe().waterVolumeGrams, 360);
    expect(makeTestRecipe().grindSize, "finely ground coffee");
    expect(makeTestRecipe().miscDetails,
        "The original recipe: makes one delicious cup");
    expect(makeTestRecipe().totaltimeinminutes, 3);
    expect(makeTestRecipe().totaltimeinseconds, 45);
    //how do we test rejecting invalid coffee recipes?
  });
  //how do we test rejecting invalid coffee recipes?
}
