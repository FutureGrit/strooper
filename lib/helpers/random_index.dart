import 'dart:math';
import 'package:flutter/material.dart';

extension RandomIndex on Random {
  int randomIndex({@required int range, int exclude}) {
    int index = Random().nextInt(range);

    /// excluding given index
    if (index == exclude) {
      index == range ? index-- : index++;
    }

    return index;
  }
}
