import 'package:advent_of_code_22/input/input_utils.dart';

void main() async {
  // Part One
  var mostCalories = 0;
  var elfCalories = 0;

  await for (var line in InputUtils().inputAsStream('lib/input/input_day1.txt', splitAtEmpty: true)) {
    if (line.isEmpty) {
      if (elfCalories > mostCalories) {
        mostCalories = elfCalories;
      }
      elfCalories = 0;
    } else {
      elfCalories += int.parse(line);
    }
  }
  print('Part One - Answer: $mostCalories');

  // Part Two
  List<int> allInventories = [];
  elfCalories = 0;

  await for (var line in InputUtils().inputAsStream('lib/input/input_day1.txt', splitAtEmpty: true)) {
    if (line.isEmpty) {
      allInventories.add(elfCalories);
      elfCalories = 0;
    } else {
      elfCalories += int.parse(line);
    }
  }

  allInventories.sort((a, b) => (b.compareTo(a)));
  int topThreeElves = allInventories.take(3).reduce((value, element) => value + element);

  print('Part Two - Answer: $topThreeElves');
}
