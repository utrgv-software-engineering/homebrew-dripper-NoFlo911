import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 1),
      RecipeStep("Cover and wait", 2),
      RecipeStep("Stir", 3),
      RecipeStep("Cover and wait", 4),
      RecipeStep("Stir", 5),
    ];
    //check that it has the right data
    expect(steps[0].text, "Add 360g water");
    expect(steps[0].minutes, 0);
    expect(steps[0].seconds, 1);
    expect(steps[1].text, "Cover and wait");
    expect(steps[1].minutes, 0);
    expect(steps[1].seconds, 2);
    expect(steps[2].text, "Stir");
    expect(steps[2].minutes, 0);
    expect(steps[2].seconds, 3);
    expect(steps[3].text, "Cover and wait");
    expect(steps[3].minutes, 0);
    expect(steps[3].seconds, 4);
    expect(steps[4].text, "Stir");
    expect(steps[4].minutes, 0);
    expect(steps[4].seconds, 5);
  });
  test('creates a valid recipe step for steps that are greater than 60 seconds',
      () {
    //make a recipe step
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    //check that it has the right data
    expect(steps[0].text, "Add 360g water");
    expect(steps[0].minutes, 0);
    expect(steps[0].seconds, 30);
    expect(steps[1].text, "Cover and wait");
    expect(steps[1].minutes, 1);
    expect(steps[1].seconds, 30);
    expect(steps[2].text, "Stir");
    expect(steps[2].minutes, 0);
    expect(steps[2].seconds, 15);
    expect(steps[3].text, "Cover and wait");
    expect(steps[3].minutes, 1);
    expect(steps[3].seconds, 15);
    expect(steps[4].text, "Stir");
    expect(steps[4].minutes, 0);
    expect(steps[4].seconds, 15);
  });
  //how do we test rejecting invalid recipe steps?

  test('rejects an invalid recipe step with a time equal to 0', () {
    //make an invalid recipe step

    expect(() => RecipeStep("Add 360g water", 0), throwsArgumentError);
  });

  test('rejects an invalid recipe step with a time less than 0', () {
    //make an invalid recipe step

    expect(() => RecipeStep("Add 360g water", -1), throwsArgumentError);
  });
}
