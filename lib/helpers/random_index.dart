import 'dart:math';

import 'package:strooper/constants/game_colors.dart';

extension RandomIndex on Random {
  int randomIndex({int exclude}) {
    int range = colorNames.length - 1;
    int index = Random().nextInt(range);

    /// excluding given index
    if (index == exclude) {
      index == range ? index-- : index++;
    }

    return index;
  }
}
