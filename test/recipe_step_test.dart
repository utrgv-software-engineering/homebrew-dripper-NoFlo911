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
    expect(steps[0].time, 1);
    expect(steps[1].text, "Cover and wait");
    expect(steps[1].time, 2);
    expect(steps[2].text, "Stir");
    expect(steps[2].time, 3);
    expect(steps[3].text, "Cover and wait");
    expect(steps[3].time, 4);
    expect(steps[4].text, "Stir");
    expect(steps[4].time, 5);
  });

  //how do we test rejecting invalid recipe steps?
}
