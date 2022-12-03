// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Homebrew Dripper Recipe Happy Path', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    /*
      Given I am on recipe_selection_screen
      When I tap the "Test Recipe" tile
      Then I should see "Test Recipe" in recipe_details_screen
      And I should see '22' as the grams of coffee
      And I should see '360' as grams of water
      And I should see 'Total: 0:25" as the total brew time
    */

    test('test recipe tiles', () async {
      final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

      final recipeTileFinder = find.byValueKey('recipe-tile1');
      await driver.tap(recipeTileFinder);

      final recipeNameTextFinder = find.byValueKey('recipeName-text');

      expect(await driver.getText(recipeNameTextFinder), "Test Recipe");
      final coffeeGramsTextFinder = find.byValueKey('coffeeGrams-text');
      expect(await driver.getText(coffeeGramsTextFinder), "22");
      final waterGramsTextFinder = find.byValueKey('waterGrams-text');
      expect(await driver.getText(waterGramsTextFinder), "360");
      final recipeTotalTimeFinder = find.byValueKey('total-time-text');
      expect(await driver.getText(recipeTotalTimeFinder), "Total: 0:25");
    });

    /*
      Given I am on recipe_details_screen
      When I tap the "Start" button
      Then I should see a timer on the recipe_steps_screen
      And I should see the current step
      And I should see the remianing steps
      And I should see the time required for each step
      And I should be taken to done_screen once the all steps are done
    */
    test('test start button', () async {
      final startTextFinder = find.byValueKey('start-text');
      final startBtnFinder = find.byValueKey('start-btn');
      expect(await driver.getText(startTextFinder), "Start");
      await driver.tap(startBtnFinder);

      final timerTextFinder = find.byValueKey('timer-text');
      expect(await driver.getText(timerTextFinder), '5');
      final currentStepTextFinder = find.byValueKey('currentStep-text');
      expect(await driver.getText(currentStepTextFinder), "Add 360g water");

      final step1TextFinder = find.byValueKey('step1-text');
      expect(await driver.getText(step1TextFinder), "Add 360g water");
      final step1TimeFinder = find.byValueKey('step1-time-text');
      expect(await driver.getText(step1TimeFinder), "00:05");
      final step3TextFinder = find.byValueKey('step3-text');
      expect(await driver.getText(step3TextFinder), "Stir");
      final step3TimeFinder = find.byValueKey('step3-time-text');
      expect(await driver.getText(step3TimeFinder), "00:05");
      final step4TextFinder = find.byValueKey('step4-text');
      expect(await driver.getText(step4TextFinder), "Cover and wait");
      final step4TimeFinder = find.byValueKey('step4-time-text');
      expect(await driver.getText(step4TimeFinder), "00:05");
      await Future.delayed(Duration(seconds: 25));

      final doneScreenTextFinder = find.byValueKey('doneScreen-text');
      expect(await driver.getText(doneScreenTextFinder),
          "enjoy your amazing handmade coffee");
    }, timeout: Timeout.none);
/*
    test('test other recipe tiles', () async {
      final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

      final recipeTileFinder = find.byValueKey('recipe-tile0');
      await driver.tap(recipeTileFinder);

      final recipeNameTextFinder = find.byValueKey('recipeName-text');

      expect(await driver.getText(recipeNameTextFinder), "Sweet Maria's");
      final coffeeGramsTextFinder = find.byValueKey('coffeeGrams-text');
      expect(await driver.getText(coffeeGramsTextFinder), "22");
      final waterGramsTextFinder = find.byValueKey('waterGrams-text');
      expect(await driver.getText(waterGramsTextFinder), "360");
      final recipeTotalTimeFinder = find.byValueKey('total-time-text');
      expect(await driver.getText(recipeTotalTimeFinder), "Total: 3:45");
    });

    test('test start button on other recipes', () async {
      final startTextFinder = find.byValueKey('start-text');
      final startBtnFinder = find.byValueKey('start-btn');
      expect(await driver.getText(startTextFinder), "Start");
      await driver.tap(startBtnFinder);

      final timerTextFinder = find.byValueKey('timer-text');
      expect(await driver.getText(timerTextFinder), '30');
      final currentStepTextFinder = find.byValueKey('currentStep-text');
      expect(await driver.getText(currentStepTextFinder), "Add 360g water");

      final step1TextFinder = find.byValueKey('step1-text');
      expect(await driver.getText(step1TextFinder), "Add 360g water");
      final step1TimeFinder = find.byValueKey('step1-time-text');
      expect(await driver.getText(step1TimeFinder), "00:30");
      final step3TextFinder = find.byValueKey('step3-text');
      expect(await driver.getText(step3TextFinder), "Stir");
      final step3TimeFinder = find.byValueKey('step3-time-text');
      expect(await driver.getText(step3TimeFinder), "00:15");
      final step4TextFinder = find.byValueKey('step4-text');
      expect(await driver.getText(step4TextFinder), "Cover and wait");
      final step4TimeFinder = find.byValueKey('step4-time-text');
      expect(await driver.getText(step4TimeFinder), "01:15");
      await Future.delayed(Duration(seconds: 225));

      final doneScreenTextFinder = find.byValueKey('doneScreen-text');
      expect(await driver.getText(doneScreenTextFinder), "Enjoy your coffee");
    }, timeout: Timeout.none);*/

    /*
      Given I am on done_screen
      When I tap the 'done' button FlutterDriver driver;
      Then I should be taken back to the recipe_selection_screen
    */

    test('test done button', () async {
      final doneScreenTextFinder = find.byValueKey('doneScreen-text');
      expect(await driver.getText(doneScreenTextFinder),
          "enjoy your amazing handmade coffee");
      final doneTextFinder = find.byValueKey('done-text');
      final doneBtnFinder = find.byValueKey('done-btn');
      expect(await driver.getText(doneTextFinder), "done");
      await driver.tap(doneBtnFinder);
      final selectionScreenTextFinder = find.byValueKey('coffee-recipes');
      expect(await driver.getText(selectionScreenTextFinder), "Coffee Recipes");
    });
  });

  group("Homebrew Dripper resources happy path", () {
    /*
    Given I am on recipe_selection_screen
    And I see multiple resource links
    When I tap the "Kettles" tile
    Then the "Kettles" tile should have been pressed
  */
    test("test resource link tile", () async {
      final backButton = find.byTooltip('Back');
      await driver.tap(backButton);
      await driver.tap(backButton);
      await driver.tap(backButton);

      final resourceTextFinder = find.byValueKey('resources-text');
      expect(await driver.getText(resourceTextFinder), "Resources");

      final coffeeResourceTileFinder = find.byValueKey('CoffeeResource-tile');
      final grinderResourceTileFinder =
          find.byValueKey('GrindersResource-tile');
      final kettleResourceTileFinder = find.byValueKey('KettlesResource-tile');
      final homebrewDripperResourceTileFinder =
          find.byValueKey('Homebrew DripperResource-tile');
      expect(await driver.getText(coffeeResourceTileFinder), "Coffee");
      expect(await driver.getText(grinderResourceTileFinder), "Grinders");
      expect(await driver.getText(kettleResourceTileFinder), "Kettles");
      expect(await driver.getText(homebrewDripperResourceTileFinder),
          "Homebrew Dripper");

      await driver.tap(kettleResourceTileFinder);
    });
  });
}
