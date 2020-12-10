import 'dart:math';

import 'package:strooper/utils/game_play_colors.dart';

extension RandomIndex on Random {
  int randomIndex({int exclude}) {
    // TODO: set rang as function parameter
    int range = GamePlayColor.colors.length - 1;
    int index = Random().nextInt(range);

    /// excluding given index
    if (index == exclude) {
      index == range ? index-- : index++;
    }

    return index;
  }
}
