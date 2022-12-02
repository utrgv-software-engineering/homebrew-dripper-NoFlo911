class RecipeStep {
  String text;
  int time;
  int minutes = 0;
  int seconds = 0;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    minutes = 0;
    this.text = text;
    if (time <= 0) {
      throw ArgumentError();
    } else if (time >= 60) {
      minutes = time ~/ 60;
      seconds = time % 60;
    } else {
      seconds = time;
    }
    this.time = time;
  }
}
